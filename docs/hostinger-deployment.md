# Hostinger Business deployment

Target supplied by the owner on 2026-10-22: `api.mahmoudbannan.com`, server `11.8.9-MariaDB-log`. This is MariaDB, although hPanel labels its database tools “MySQL”. [Hostinger confirms MariaDB for Web/Cloud plans](https://www.hostinger.com/support/1583226-which-database-management-system-is-used-at-hostinger/). Use `DB_CONNECTION=mysql` (PDO MySQL protocol) with this application. Local Compose and the MariaDB CI lane select `mariadb:11.8.9`; the second lane tests Oracle MySQL 8.4. Do not substitute MySQL 5.7 or an arbitrary old XAMPP server: enforced CHECK constraints, InnoDB and strict SQL mode are required. Confirm `SELECT VERSION()` on the destination before installation; [Hostinger's version procedure](https://www.hostinger.com/support/how-to-check-your-database-version-in-phpmyadmin-at-hostinger/) is read-only.

No production deployment or database access has been performed. The supplied version is owner evidence, not a live server probe by this task. See [migration results](mysql-migration-completion.md) for executed versions and limitations.

## Runtime preflight

Select PHP 8.5 for this website and locate the matching **CLI** binary for Composer and cron. [Hostinger supports selection through PHP 8.5](https://www.hostinger.com/support/1575755-how-to-change-the-php-version-of-your-hostinger-hosting-plan/); `php -v` over SSH may differ from the web version. Keep vendor packages locked. Check `composer check-platform-reqs --no-dev`, `php -m` and `php --ri gd`; required capabilities include PDO MySQL, GD with JPEG/PNG/WebP, fileinfo, mbstring, openssl, tokenizer, ctype, filter, hash, session, DOM/XML, curl and zip. Verify bcmath, CLI `proc_open`, `flock`, GNU `timeout`, and `pcntl` availability for the chosen process controls. `pcntl` is needed for Laravel's per-job timeout; the wrapper also supplies an OS deadline. If GNU timeout/flock are missing, do not schedule an unbounded worker: obtain a supported bounded execution method from Hostinger or use a worker-capable hosting tier. The wrapper fails closed if those tools are absent.

Set web and CLI memory limits to 256 MiB, upload_max_filesize=10M and post_max_size=12M. The app separately limits decoded images to 20 MP and 8000 pixels per side. Confirm JPEG/PNG/WebP processing on the actual account before accepting uploads. Do not assume a container daemon, Supervisor, a persistent queue worker or persistent scheduler is available on shared hosting.

## Private files and public document root

Use an API subdomain without changing the Jaspr website's document root. Keep the Laravel project, vendor, storage and `.env` outside the publicly served directory, for example `/home/ACCOUNT/apps/portfolio/backend`. Configure the API subdomain's document root to that application's `public/` directory if hPanel permits it. If hPanel fixes a `public_html` root, copy only the contents of Laravel `public/` into that API root and adjust the two private paths in its index.php to the real application's `vendor/autoload.php` and `bootstrap/app.php`. Do not copy the full project into public_html and rely solely on deny rules. Verify hPanel's allowed paths/open_basedir and index.php paths on the actual account.

Retain `public/.htaccess` rewrite rules for LiteSpeed/Apache. With a split public directory, point Laravel's public path at the actual API document root before creating its storage link, or create only that root's `storage` link to private `storage/app/public`. Check symlink/open_basedir support. A separately hosted public media disk/CDN is an alternative when symlinks are prohibited. Keep original upload input in `storage/app/private`; never expose all of storage. Make only `storage/` and `bootstrap/cache/` writable (no 0777).

Create the private `.env` from `.env.example`; permissions 0600 where supported. Generate APP_KEY once for a new installation; preserve the existing key during a transfer. Set:

```dotenv
APP_ENV=production
APP_DEBUG=false
APP_URL=https://api.mahmoudbannan.com
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=REPLACE_WITH_HPanel_DATABASE
DB_USERNAME=REPLACE_WITH_HPanel_USER
DB_PASSWORD=REPLACE_PRIVATELY
CACHE_STORE=database
QUEUE_CONNECTION=database
DB_QUEUE_RETRY_AFTER=120
SESSION_DRIVER=array
MEDIA_DISK=public
MEDIA_URL=https://api.mahmoudbannan.com/storage
SITE_ORIGINS=REPLACE_WITH_EXACT_JASPR_HTTPS_ORIGIN
LOG_CHANNEL=daily
LOG_LEVEL=info
```

`127.0.0.1:3306` connects locally; the external database hostname is for authorized remote connections. Verify the actual hPanel connection details. PDO sessions force `+00:00`, `READ COMMITTED`, utf8mb4 binary collation, strict mode and InnoDB. Do not loosen these settings. Use a dedicated database/user and no root account. Keep real values outside Git and Postman exports.

Enable a valid SSL certificate and HTTPS redirection for the API subdomain. Configure trusted proxy addresses only if Hostinger supplies trustworthy proxy details. Use the external HTTPS media URL and exact Jaspr CORS origins. Disable LiteSpeed/CDN response caching for `/api/*`, retaining API no-store behavior; public media may cache separately. Verify redirects, mixed-content behavior, Authorization forwarding and inaccessible `.env`/vendor/storage-private paths without displaying their contents. Restrict provider access logs and private application logs; do not enable request-body or token logging.

## Scheduler and finite queue processing

Create two **Custom** hPanel cron entries. [Cron runs in UTC](https://www.hostinger.com/support/1583465-how-to-set-up-a-cron-job-at-hostinger/), and [Premium and above allow unlimited cron entries](https://www.hostinger.com/support/1583765-how-many-cron-jobs-can-you-set-up-in-hostinger/); CPU/memory/process quotas still apply. Confirm minute scheduling and actual process deadlines on this account.

Every minute, run the scheduler with an overlap lock and bounded process lifetime. Replace every path and the PHP binary with the verified account values:

```sh
flock -n /home/ACCOUNT/apps/portfolio/backend/storage/framework/scheduler.lock timeout --kill-after=5 50 /VERIFIED/PHP85 /home/ACCOUNT/apps/portfolio/backend/artisan schedule:run --no-interaction
```

Every minute, run the delivered finite worker wrapper:

```sh
PORTFOLIO_PHP=/VERIFIED/PHP85 /bin/sh /home/ACCOUNT/apps/portfolio/backend/scripts/cron-queue.sh
```

The wrapper acquires an OS overlap lock, processes at most 10 jobs, exits when empty or after 40 seconds between jobs, uses a 60-second per-job timeout and a 105-second OS deadline (TERM then KILL after another 5 seconds). Its reservation retry interval is 120 seconds. A slow final job may extend beyond 40 seconds; overlap invocations exit, and the hard deadline is separate from Laravel's between-job timer. A killed job can retry after reservation expiry; media jobs are idempotent. Inspect nonzero cron exits, especially 124 from GNU timeout. Bound memory and measure image workloads on this account. No queue/scheduler commands belong in HTTP routes.

Cron introduces upload latency: a processing image may wait one or more minutes before ready. The unchanged dashboard's polling can time out before that; users can revisit/refetch the library. Verify acceptable latency and throughput on the hosting account. Do not promise a persistent-worker response time. If the backlog grows, move processing to suitable hosting rather than removing overlap/deadline guards.

The scheduler prunes at 02:15 UTC and prunes old failed jobs daily. Check `php artisan schedule:list`, actual cron output, `queue:failed`, oldest queued job age, media states and storage capacity. After fixing a failure, retry only intended failed jobs. Pause cron during releases and transfers; resume once checks pass.

## Release and data transfer

For a **new empty database**, install locked production dependencies with the matching PHP binary, configure private env/key, back up the destination, then run `php artisan migrate --force`, `php artisan db:seed --force`, `php artisan storage:link` and `php artisan optimize`. Create the owner interactively with `app:create-owner` only for a new installation. Never generate or reset an owner password in a deployment script.

For **existing PostgreSQL records**, follow [the transfer runbook](postgres-to-mysql-transfer.md) first. Changing DB_CONNECTION does not transfer data. Do not run MySQL migrations against the old PostgreSQL database, truncate it or replay a pg_dump as MySQL SQL. The revised baseline is for a new MySQL/MariaDB schema, not an in-place alteration of an existing PostgreSQL installation. Run transfer before the singleton seeder; import refuses nonempty business/runtime tables.

Keep maintenance and cron stopped during cutover. Check `/up`, `/api/v1/ready`, owner login, a processed upload URL, published public data, dashboard/client flows, scheduler output and queue age. HTTP smoke automation is restricted to disposable loopback environments; do not point it at production. Hostinger execution, real SSL/root/security checks and the exact server patch must be approved and verified separately. No deployment is authorized by this runbook.

## Quotas and backups

[Hostinger's current published limits](https://www.hostinger.com/support/6976044-parameters-and-limits-of-hosting-plans-in-hostinger/) list the former Business offering as Unlimited: 2 CPU cores, 3 GB account RAM, 3 GB per database, 75 connections per database user, 16 MiB packets, a 120-second query limit and a 200 MB import limit. The same page explicitly says existing Business customers retain their previous limits. These figures therefore do **not** establish this account's quotas: check hPanel and provider support before release. Image processing and DB-backed cache/queues share account resources. Use SSH streaming for transfers above the verified import ceiling. Do not infer a PHP cron lifetime from the separate Node.js cron guide.

Back up the MySQL/MariaDB database consistently with `mysqldump`/`mariadb-dump --single-transaction`, public media, private pending uploads and APP_KEY. Credentials belong in a private `[client]` option file (0600), not arguments/history. `backend/scripts/backup.sh NEW_PRIVATE_DIRECTORY PRIVATE_OPTION_FILE` takes MYSQL_DATABASE from the environment and a mysqldump-compatible binary on PATH. Pause writers/cron for matching database/media snapshots. Encrypt and copy backups off-host. Restore SQL with the matching mysql/mariadb client into a new empty isolated database; restore media/key privately, run reconciliation and application checks before switching. Never restore over the original database or automatically run production rollback migrations. Provider snapshots complement, rather than replace, an independently tested restore.
