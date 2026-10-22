# Deployment and operations

Deploy only after explicit owner authorization. No live deployment is part of this implementation. Run the full CI suite first. Review `docs/backend-completion.md` for checks that could not run on the development host.

For the actual shared-hosting target `api.mahmoudbannan.com` / MariaDB 11.8.9, follow [Hostinger Business deployment](hostinger-deployment.md). The container worker/scheduler below are for worker-capable infrastructure and local Compose. Existing PostgreSQL records require [explicit transfer and reconciliation](postgres-to-mysql-transfer.md); changing the connection does not move them.

## Runtime and release

The Dockerfile builds PHP 8.5.12 FPM with MySQL PDO, GD (JPEG/PNG/WebP), bcmath, pcntl, mbstring, XML/DOM and zip, and installs production packages from Composer's lockfile. It runs FPM and Nginx as UID 1000 under Supervisor, listening on port 8000. `backend/public` is the only document root. Writable paths: storage/app, storage/logs, storage/framework and bootstrap/cache. Do not make application source writable to the web server unnecessarily.

Compose is the development reference; use managed MySQL/MariaDB and durable volumes/object storage for production. Build with `docker build -t portfolio-api:RELEASE backend`. Do not mount host vendor directories into the container. Do not copy .env into the image. Pin/review image patch releases regularly; do not assume this initial pin receives future security fixes automatically. The environment here has no Docker daemon, so container build/start verification remains required before deployment.

Web, worker and scheduler use the same image and key, database and storage configuration. Run web using the default command, worker with `php artisan queue:work --sleep=2 --tries=3 --timeout=90 --max-time=3600`, and scheduler with `php artisan schedule:work`. Use one scheduler replica. Database queue retry_after is 120 seconds, greater than the 90-second worker timeout; ProcessMedia has a 60-second job timeout. Supervise restarts; inspect and retry failed jobs after fixing their cause. `app:prune` runs at 02:15 UTC under an overlap lock; failed jobs are pruned after seven days. Do not run migrations in each web/worker startup.

The TLS edge example is `backend/docker/nginx.conf`; configure certificates and hostname, then proxy to the app. The image's internal Nginx configuration is `nginx-runtime.conf`. Set HTTPS redirects, HSTS, MIME sniffing protection and restrictive network access at your edge. API-generated errors are JSON. Proxy-generated 413/502 responses can be non-JSON; clients must handle that. Both proxy and PHP cap uploads at 12 MiB request body / 10 MiB file. PHP memory is limited to 256 MiB and image dimensions to 20 MP / 8000 per side. Do not loosen these without measuring memory and reviewing decoder security.

`/up` is Laravel liveness. `/api/v1/ready` checks a database query and a randomized write/delete on private local and configured media storage, returning only ready=true or generic 503. Rate-limit readiness access at the edge/monitoring network if necessary; it performs storage I/O. Neither endpoint waits for queue drain. Monitor queue age/failures, worker/scheduler uptime, storage/database capacity, 5xx rates and backup freshness separately.

## Required configuration

| Variable | Production behavior |
| --- | --- |
| APP_ENV / APP_DEBUG | production / false |
| APP_KEY | Generate once, store securely and preserve across releases/restores |
| APP_URL | External HTTPS API origin |
| DB_CONNECTION | mysql |
| DB_HOST/PORT/DATABASE/USERNAME/PASSWORD | Restricted database user, private network, TLS according to provider configuration |
| CACHE_STORE / QUEUE_CONNECTION | database / database |
| SESSION_DRIVER | array; no session-based visitor tracking |
| SITE_ORIGINS | Comma-separated exact Jaspr origins; never wildcard credentialed origins |
| TRUSTED_PROXIES | Explicit trusted proxy IPs/CIDRs; empty unless configured |
| MEDIA_DISK | public for durable local storage, s3 for S3-compatible storage |
| MEDIA_URL | Full public local media URL, normally https://api.example.test/storage |
| AWS_* | Private credentials, region, bucket and optional endpoint/public URL; not site settings |
| AWS_USE_PATH_STYLE_ENDPOINT | true when required by compatible storage |
| SANCTUM_EXPIRATION | Token lifetime in minutes, default 10080 (seven days) |
| ANALYTICS_ENABLED | false validates events and acknowledges 202 without persistence |
| ANALYTICS_REFERRER_DAILY_LIMIT | Default 100 distinct hosts/day; overflow is other |
| *_RETENTION_DAYS | analytics 90, inquiry/audit 180 by default |
| LIMIT_* | Login account 5/min, login IP 30/min, reads 120/min, inquiries 3/hour, analytics 60/min, uploads 20/min and admin operations 120/min |
| LOG_CHANNEL / LOG_LEVEL | stderr / info, with restricted log access and appropriate provider retention |

CORS is a browser policy, not authorization. Only explicitly configured proxy headers are trusted. Native clients use bearer tokens independently of CORS. Never enable token/credential/body logging. Application exception logs contain a class name and server request ID, not raw exception text, SQL bindings or payloads. Limiter keys use HMAC hashes of transient IP/account dimensions and expire from database cache; no raw IP is stored by analytics or inquiries. Configure CDN, web server, load balancer and hosting-provider access logs separately to avoid raw IPs, Authorization headers and contact payloads. The provided Nginx configs disable access logs. Laravel's development server is for local verification only and may emit connection metadata to its console.

Default retention keeps the current UTC day plus the preceding N-1 days; timestamps before the cutoff midnight are pruned. Analytics events use server time only. Media older than 24 hours is queued for cleanup only if still unattached under a row lock. A deleting record is not attachable and remains durable if file removal fails. Pruning requeues old deletion records, so failed cleanup can recover. Normal failed jobs contain only media IDs, not upload bytes or contact messages. Inquiries are not deduplicated and are persisted without requiring SMTP. No consent-management service is built; deployers must configure their visitor analytics flow appropriately.

## Local media and object storage

For local storage persist `/app/storage/app`, including private temporary upload input and public processed variants. The image includes public/storage -> storage/app/public. Web and workers must share the same volume; processing must see the original private input. Do not host temporary upload directories publicly. Readiness tests both local temporary storage and the selected media disk.

For S3 set MEDIA_DISK=s3, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION and AWS_BUCKET; set AWS_ENDPOINT/AWS_USE_PATH_STYLE_ENDPOINT for compatible services and AWS_URL for the public bucket/CDN base. Grant only required object read/write/delete access, disable public listing and executable content. Ready display/thumbnail objects must be anonymously readable through the configured URL or CDN; the backend does not issue signed URLs. Originals are removed after successful processing or terminal failure. Keys are randomized and outputs always WebP. Configure bucket policy/CDN independently; no credentials are returned in Resources. Unpublishing removes API visibility but does not revoke existing public image URLs.

## Release checklist

1. Back up MySQL/MariaDB, media and APP_KEY; verify recent restore-drill evidence.
2. Build the immutable image and run formatting, static analysis, MySQL/MariaDB tests, contract checks and dependency audit. There are no ignored audit advisories.
3. Configure secrets, persistent storage, trusted proxies, TLS and exact CORS origins. Confirm debug=false.
4. Stop old workers safely or drain them before incompatible job changes. Start a single maintenance/release task using the new image.
5. From `backend/`, run `./scripts/deploy.sh`. It stops on failure, enters maintenance, migrates once, seeds only safe singleton defaults, creates the media link, caches configuration/routes and requests worker restart. It never generates APP_KEY or performs automatic rollback migrations.
6. Start/restart web, workers and scheduler on the new release. Existing workers honor queue:restart when the shared database cache is available.
7. Verify liveness/readiness, owner login, media upload/processing and public publication from a device-reachable URL. Run the HTTP smoke workflow only on a disposable environment, not production data.
8. Confirm backups, monitoring and scheduler registration. Retain the prior image until validation succeeds.

If release commands fail, the script leaves maintenance mode in place so partially migrated code does not resume serving traffic. Inspect the error, choose compatible application code, then run `php artisan up` explicitly when safe. Application rollback must remain compatible with already-migrated data. Never automatically run migrate:rollback against production.

## Backup and restoration

Use encrypted consistent MySQL/MariaDB backups, all public media variants, in-flight private upload input and APP_KEY. Pause writers/cron for matching database/media snapshots. Keep credentials outside source control and command-line arguments.

From `backend/`, run `MYSQL_DATABASE=DATABASE ./scripts/backup.sh NEW_SECURE_DIRECTORY PRIVATE_MYSQL_OPTION_FILE`. The 0600 option file contains a `[client]` section with host/user/password. The script refuses an existing destination, uses a single InnoDB snapshot and writes `database.sql` plus `media.tar.gz`. Use a compatible mysqldump client (or a private PATH wrapper for mariadb-dump); encrypt/copy backups off-host. Restore SQL into a new isolated empty MySQL/MariaDB database using a private client option file; restore media/key, compare counts/checksums and exercise API/media flows before any cutover. Never overwrite the existing source or automatically roll back production migrations.

For PostgreSQL-to-MySQL migration, preserve the original PostgreSQL dump and use [the transfer runbook](postgres-to-mysql-transfer.md); pg_dump SQL is not MySQL SQL. Executed transfer/restore checks and external limits are recorded in [migration results](mysql-migration-completion.md).

## Recovery and diagnosis

```sh
php artisan app:recover-owner --disable  # disable access and revoke all tokens
php artisan app:recover-owner --revoke   # revoke tokens without changing password/enabled state
php artisan app:recover-owner            # hidden new password/confirmation; re-enables owner
php artisan queue:failed
php artisan queue:retry all              # after correcting the cause
php artisan app:prune                    # safe to repeat; logs counts only
php artisan schedule:list
php artisan config:clear
php artisan storage:link
```

If media is stuck processing, inspect worker uptime and failed jobs before re-uploading. Failed uploads may remain until orphan cleanup; never attach them manually. If the database says ready but images fail to load, verify disk configuration, public URL, bucket/CDN policy, symlink and whether a physical device can reach MEDIA_URL. Avoid logging signed credentials or entire environment dumps while diagnosing. A missing database/storage produces generic readiness failure; detailed configuration is never returned to clients.
