# Backend architecture

Initial selection on 2026-10-21: Laravel 13 (framework 13.38.0 resolved by Composer), PHP 8.5.4, PostgreSQL 18. Laravel 13 officially supports PHP 8.3–8.5. The application pins PHP to the 8.5 series for one reproducible runtime; Composer lock pins exact packages. That database choice is superseded by the 2026-10-22 MySQL/MariaDB migration; the historical runtime record below is retained.

A single REST application serves public content and an owner-only API at `/api/v1`. Sanctum bearer tokens expire after seven days. Public team profiles have no authentication relation. Database queues/cache avoid requiring Redis. Object storage is interchangeable through Laravel's filesystem; private upload input uses the local disk. GD decodes and re-encodes bounded raster images, producing a display WebP at original dimensions and a thumbnail fitting 480×480 without upscaling.

Content relationships and mutations use transactions. All media attachments and deletion lock media rows, then verify readiness/usage under the lock. A durable `deleting` media state is an internal lifecycle extension; it prevents new attachments until asynchronous removal succeeds. Slugs are generated once; supplied collisions are validation errors. Concurrent generated collisions retry under unique constraints.

Analytics are daily accepted-event counters, not people. Null dimensions are represented in a SHA-256 canonical key. A transaction-owned row in application_locks serializes daily referrer cardinality allocation; bucket increments use atomic `ON DUPLICATE KEY UPDATE`. The constant generated users.owner_slot unique index enforces one owner even under concurrent direct inserts. Historic entry dimension IDs remain in the hash when the foreign key becomes null.

No public response caching is enabled. All API responses use `Cache-Control: no-store`. Known media URLs remain public after content is unpublished. Markdown is untrusted text and must be sanitized by clients. Concurrent edits use last-write-wins; clients refetch after saving.

## Version-specific references

- [Laravel 13 release/support policy](https://laravel.com/docs/13.x/releases)
- [Sanctum](https://laravel.com/docs/13.x/sanctum)
- [Validation](https://laravel.com/docs/13.x/validation)
- [Authorization](https://laravel.com/docs/13.x/authorization)
- [API Resources](https://laravel.com/docs/13.x/eloquent-resources)
- [Filesystem](https://laravel.com/docs/13.x/filesystem)
- [Queues and after-commit dispatch](https://laravel.com/docs/13.x/queues)
- [Scheduling](https://laravel.com/docs/13.x/scheduling)
- [Testing](https://laravel.com/docs/13.x/testing)
- [Deployment](https://laravel.com/docs/13.x/deployment)
- [OpenAPI 3.1](https://spec.openapis.org/oas/v3.1.0.html)

## Verification design

PHPUnit runs on real MySQL and MariaDB rather than SQLite. A separate real PostgreSQL source exercises the legacy data transfer. Race tests fork independent processes/connections to exercise slug uniqueness, atomic null-dimension increments, daily referrer ceilings and attachment versus cleanup. The test harness refuses databases that do not end in `_testing`. Captured fictional HTTP responses are checked against OpenAPI with a JSON Schema 2020-12 validator; the route inventory must match every documented operation. Full HTTP smoke verification also uses an independent running web process and database queue worker.

PHPStan 2.3.1 with Larastan 3.13.0 checks application code, routes and seeders at level 5, including invalid calls, impossible branches and argument/return compatibility. Typed relationships and resource annotations describe Eloquent's dynamic behavior. There is no suppression baseline. These checks complement database behavior tests. Pint controls formatting. CI dependency audit has no suppressed advisories.

PostgreSQL connections explicitly set the session timezone to UTC. This is required even when the server host uses another timezone: Eloquent writes timestamps in UTC and PostgreSQL must interpret them consistently. A regression test checks both the session setting and an exact stored UTC midnight. Passwords use framework bcrypt and are limited to 72 UTF-8 bytes to avoid silent truncation; owner bootstrap, recovery and password changes share this validation rule. The project retains the scaffold's MIT license.

CI actions use documented stable releases checked on 2026-10-21: [checkout v7.0.1](https://github.com/actions/checkout/releases/tag/v7.0.1), [setup-python v7.0.0](https://github.com/actions/setup-python/releases/tag/v7.0.0), and [setup-php v2](https://github.com/shivammathur/setup-php). The workflow grants read-only repository permission and uses disposable PostgreSQL credentials, with no production secrets or deployment job.

Container image pins were updated after checking the [official PHP tag catalog](https://github.com/docker-library/official-images/blob/master/library/php) and [PostgreSQL tag catalog](https://github.com/docker-library/official-images/blob/master/library/postgres): PHP 8.5.11 FPM/bookworm, PostgreSQL 18.6/bookworm. Development mail capture uses [Mailpit v1.31.6](https://github.com/axllent/mailpit/releases/tag/v1.31.6). Local executable checks ran on the installed Ubuntu PHP 8.5.4 build and PostgreSQL 18.6; the newer pinned PHP image still needs Docker verification. Composer permits the supported 8.5 patch series.

## Current MySQL/MariaDB design (2026-10-22)

The deployment target is owner-reported MariaDB 11.8.9 at api.mahmoudbannan.com; local Compose/CI use that image tag and CI also tests MySQL 8.4. Normal runtime requires only pdo_mysql. A separate legacy_pgsql connection and optional migration-machine PDO PostgreSQL extension serve read-only source transfer. Historical PostgreSQL verification above does not establish destination compatibility; see [fresh results](mysql-migration-completion.md).

Connections force strict InnoDB, utf8mb4_bin, +00:00 and READ COMMITTED. The isolation level makes post-lock usage reads fresh, protecting media attachment/deletion checks from MySQL repeatable-read snapshots. Existing media locks remain ordered; FK errors 1451/1452 retain API 409/422 handling. Deadlock retries and generated-slug unique-violation retries remain transactional. Explicit slugs never silently change.

Identifiers/enums are case-sensitive. Search alone lowercases both sides of a parameterized LIKE with binary collation; an explicit ! escape preserves literal %, _, ! and backslash without SQL-mode-dependent escaping. JSON replaces jsonb. App/token timestamps use UTC DATETIME(6), avoiding the MySQL TIMESTAMP 2038 ceiling and preserving source microseconds; response serialization is unchanged. Large 50,000/20,000-character Unicode descriptions use MEDIUMTEXT, preserving character limits without MySQL TEXT's byte truncation. CHECK constraints remain enforced, including booleans, publication/media bounds and settings ID 1. Settings uses a non-auto-increment primary key because MySQL disallows checking an AUTO_INCREMENT column. The generated owner slot is internal and never included by API Resources.

Shared hosting uses two bounded cron entries and an OS overlap lock instead of persistent services. The container still supports development workers/scheduler. [Transfer tooling](postgres-to-mysql-transfer.md) copies into empty target tables with checks/FKs active, preserves identifiers and password/token hashes, and reconciles all tables before committing. No API/schema/client source changes are needed.
