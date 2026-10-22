# Backend delivery — 2026-10-21

The backend implementation is complete and locally verified. Container execution, hosted CI and external storage remain unverified. No production system was accessed or deployed. Website and dashboard implementation remain outside this task.

## Delivered source

- `backend/`: Laravel API, owner commands, migrations, models/factories, validation, policies, Resources, jobs, retention commands and tests.
- `backend/routes/api.php`: 58 versioned public and owner operations. `backend/database/migrations/`: PostgreSQL tables, foreign keys, checks and unique indexes.
- `docs/openapi.yaml` and `docs/api-integration.md`: complete API contract and Jaspr/Flutter handoff with tested response examples, media polling, token lifecycle and device URL guidance.
- `backend/Dockerfile`, `backend/docker/`, `compose.yaml`: rootless web runtime, PostgreSQL, queue worker, scheduler and development mail capture.
- `.github/workflows/backend.yml`, `scripts/`, `backend/scripts/`: CI, contract/HTTP checks, release and backup tooling. `docs/development.md`, `docs/architecture.md`, `docs/deployment.md`: setup and operations.
- `website/`, `dashboard/`, `packages/portfolio_api/`: reserved directories only; no client application was added.

The API includes project/product entries, categories, technologies, team profiles/links, services, settings, asynchronous media, private inquiries, aggregate analytics and privacy-limited audit history. Mutations replace supplied relationship lists transactionally; omitted PATCH fields remain unchanged. Generated slugs are stable and collision-safe. Publication requires valid ready media. Public collections, details, nested contributors and taxonomy visibility respect publication/activation immediately.

## Versions

| Component | Locked or exercised version |
| --- | --- |
| Laravel scaffold / framework | 13.11.0 / 13.38.0 |
| PHP local verification / container target | 8.5.4 / 8.5.11 FPM-bookworm |
| PostgreSQL local and container target | 18.6 |
| Composer | 2.9.5 |
| Sanctum / Flysystem S3 adapter | 4.3.3 / 3.35.3 |
| PHPUnit / Pint | 12.5.40 / 1.32.1 |
| PHPStan / Larastan | 2.3.1 / 3.13.0 |
| OpenAPI / response schema | 3.1.0 / JSON Schema 2020-12 |
| Python contract validator | openapi-spec-validator 0.7.2, jsonschema 4.26.0 |

Exact PHP dependencies are in `backend/composer.lock`; Python check dependencies are in `scripts/requirements.txt`. Official version-specific references and image verification sources are linked in architecture.md.

## Final verification

Run these from `backend/` with the documented PHP extensions and isolated PostgreSQL test configuration:

```sh
vendor/bin/pint --dirty --format agent
vendor/bin/phpstan analyse --memory-limit=512M --no-progress
php artisan test --compact
composer validate --strict
composer audit --locked --format=json
python3 ../scripts/check-openapi.py
```

| Check | Actual result |
| --- | --- |
| Pint, including full formatter run before final edits | Passed |
| PHPStan/Larastan level 5 | Passed, zero errors |
| PostgreSQL PHPUnit suite | Passed: 37 tests, 363 assertions |
| Composer manifest/lock validation | Passed, strict |
| Online locked dependency audit | Passed: no advisories or abandoned packages |
| OpenAPI validation, route inventory and captured responses | Passed: 58 operations, 26 actual response fixtures |
| Test migrations: fresh, full rollback, rerun | Passed on isolated `portfolio_testing` |
| Fictional demo command | Passed twice, idempotent; no owner credentials seeded |
| Production-mode HTTP smoke, independent queue worker | Passed with APP_ENV=production and APP_DEBUG=false |
| Scheduler registration/process | Passed; UTC retention and failed-job pruning registered |
| Config/route cache and full optimize/clear | Passed |
| Backup/restore drill | Passed; database counts and restored media checksums match |
| Release and backup shell syntax | Passed: `sh -n backend/scripts/deploy.sh backend/scripts/backup.sh` from repository root |

The test suite covers authentication on every admin route, disabled/expired/revoked access, password byte limits, public visibility, transaction/relationship semantics, slug and media races, validation/error/CORS behavior, image metadata stripping and bounds, storage failure/retry, inquiry isolation, UTC analytics aggregation/cardinality/retention, generic readiness failures, and bounded collection query count. Independent PostgreSQL connections exercise concurrent increments, slug creation and attachment-versus-cleanup. Tests refuse databases whose names do not end in `_testing`.

The HTTP smoke creates a fictional owner interactively, logs in, uploads a PNG, waits for a separate worker to produce WebP, fetches the public image URL, creates/publishes an entry, reads public list/detail, records an event and checks statistics, unpublishes and checks 404, persists/deletes a private inquiry, cleans up content/media, logs out and verifies 401. Run `scripts/smoke-http.py` only against a disposable loopback instance with SMOKE_CONFIRM_DISPOSABLE=1 and securely supplied SMOKE_EMAIL/SMOKE_PASSWORD. The smoke credentials are absent from source and documentation.

After verification, the disposable local owner was disabled and all its tokens revoked; temporary HTTP and worker processes were stopped or had exited. For this existing local database, `php artisan app:recover-owner` interactively sets a new password and re-enables access. Fresh installations use `app:create-owner` instead. The isolated PostgreSQL instance and restore artifacts remain available locally for inspection.

For the restore drill, `backend/scripts/backup.sh` wrote `/tmp/portfolio-runtime/backup-drill/database.dump` and `media.tar.gz` from disposable local data. `pg_restore --no-owner --no-acl --dbname=portfolio_restore_drill` restored into a newly created database. Entry/media/user/settings counts matched at 2/1/1/1. Extracting the archive to isolated `/tmp/portfolio-runtime/restored-media` preserved both database-linked WebP variant SHA-256 checksums. APP_KEY preservation and production promotion are documented procedures, not live operations performed here.

The host lacked GD, PostgreSQL PDO, PostgreSQL tools and Docker. Native verification used isolated downloaded extensions/PostgreSQL under `/tmp/portfolio-runtime`, with PHP wrapper `/tmp/portfolio-runtime/bin/php`, PostgreSQL on port 55432 and Python venv `/tmp/portfolio-contract-env`. The standard commands above were executed using that wrapper and venv; PHP_INI_SCAN_DIR/LD_LIBRARY_PATH allowed subprocesses to load the same extensions. No host package installation is required by the repository. A slow Composer download required a local cache assembled from hash-verified official PHPStan portable files, excluding optional native accelerators; the actual locked PHPStan and Larastan versions ran successfully.

## Security and privacy decisions

There is one database-enforced owner, created/recovered with hidden interactive password input. No registration or seeded production password exists. Bcrypt passwords accept at most 72 UTF-8 bytes. Seven-day bearer tokens support individual/all-device logout; changing or recovering a password revokes all tokens. Disabled owners cannot use existing tokens. Every admin route requires owner authorization.

Requests receive server-generated IDs and generic JSON errors with no debug/SQL/payload disclosure. API responses use no-store. Exact-origin CORS and explicitly configured proxies are documented. Limiter keys HMAC transient IP/account values; inquiries, analytics and audits do not store raw IPs, visitor identifiers, tokens or request bodies. Private inquiry contents stay out of public responses and audit changes. Retention keeps UTC day buckets; the database session explicitly uses UTC even on this Asia/Damascus host.

Images are bounded before decoding, re-encoded as WebP to discard source metadata, and processed from private temporary input. Attachment/deletion locks and durable deletion state prevent unsafe references; failed removal can retry. Ready media URLs are public and remain accessible if an entry is unpublished. Markdown must be sanitized by clients. Editing uses last-write-wins; there is no implied optimistic locking. Analytics count accepted events rather than unique visitors; no throughput/load-test guarantee is claimed.

Environment files, uploads, logs, response fixtures, static-analysis cache, dependency directories and generated storage links are ignored. Committed examples contain fictional data/placeholders. Provider/proxy logging, TLS and storage policy still require deployment configuration.

## Remaining external checks

1. Build/start the pinned image and run `docker compose config --quiet`, health checks and the smoke workflow in that runtime. Docker/Podman are unavailable here; native PHP verification does not prove image execution.
2. Run the supplied GitHub workflow in a hosted repository. All executable local equivalents passed; no hosted Actions run was available in this workspace.
3. If using S3-compatible media, verify real credentials, endpoint, bucket/CDN permissions, shared private temporary storage and public variant URLs. Local storage and failure paths were tested; no external bucket credentials were supplied.
4. Before an authorized release, configure HTTPS, secrets/APP_KEY, database and media persistence, trusted proxies, exact origins, supervised processes, monitoring and encrypted off-host backups. Exercise restore procedures in the target infrastructure and create the real owner interactively.

The deployment helper was syntax-checked and its Laravel migration/cache/worker primitives were exercised locally. A live release, target reverse proxy and cloud backup integration were not run. Phases 0 and 7 retain their container/hosted execution gates in backend-progress.md rather than being marked fully verified.
