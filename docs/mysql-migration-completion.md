# MySQL/MariaDB migration — 2026-10-22

Implemented for `api.mahmoudbannan.com`. The owner reports `11.8.9-MariaDB-log`; this task did not connect to Hostinger or deploy production. Compose and CI select MariaDB 11.8.9; CI also exercises Oracle MySQL 8.4. PHP container target is 8.5.12. The API schema and website/dashboard/shared-client source are unchanged.

## Delivered behavior

- PDO MySQL runtime/configuration, environment example, Docker, CI, migrations, tests and operations scripts replace the PostgreSQL runtime. PostgreSQL remains only as an optional, separately configured transfer source and frozen test fixture. Factory definitions were inspected and work unchanged against both engines.
- Constant generated unique owner slot replaces PostgreSQL's expression index. Normalized owner email, singleton settings, enum/status/boolean/media/count checks and foreign keys remain enforced in the database. Race tests cover direct owner inserts and generated/explicit slug collisions.
- InnoDB transaction row locks replace advisory locks. Analytics retain non-null canonical dimension hashes and use atomic duplicate-key increments, including nullable dimensions and concurrent cardinality allocation. Media attachment/deletion retains row locking; READ COMMITTED prevents stale reads after waiting for a media lock.
- Bound, literal case-insensitive searches replace ILIKE, preserving accents and literal `%`, `_`, `!` and backslash handling. Binary utf8mb4 collation preserves identifier case sensitivity. PostgreSQL casts and SQLSTATE mappings were adapted without changing API errors.
- UTC sessions and DATETIME(6) retain microseconds and support dates beyond 2038. MEDIUMTEXT preserves validated Unicode description lengths. No PostgreSQL-only partial indexes, advisory locks or ON CONFLICT syntax remain in runtime queries. JSON fields use the destination's supported JSON representation.
- An opt-in PostgreSQL transfer command inventories by default, requires an exact target confirmation to copy into an empty new destination, preserves IDs/hashes/relationships/UTC dates and reconciles counts plus canonical SHA-256 values for 21 tables before commit. Constraint failures roll back the copy; source transactions are read-only. No FK disabling, overwrite mode or source deletion is provided.
- Shared-hosting cron uses an overlap lock, finite job count/time, memory limit and an OS deadline. A persistent queue worker is not assumed. Lock files are ignored by Git.

## Executed checks

All database checks used newly created private temporary data directories and fictional records on loopback, never an existing database. Local PHP was 8.5.4; isolated matching GD/PDO PostgreSQL libraries were used for image and transfer checks. Test database names end in `_testing` and the test harness enforces the destination driver/environment/name.

| Check | Actual result |
| --- | --- |
| Full backend suite, MariaDB 11.8.6 | **47 passed, 435 assertions**, including concurrency and transfer tests; no skips |
| Full backend suite, Oracle MySQL 8.4.11 | **47 passed, 435 assertions**, including concurrency and transfer tests; no skips |
| Legacy source, PostgreSQL 18.6 | Original schema used for real cross-engine copy, verification, mismatch detection, nonempty refusal and rollback tests in both suites |
| Schema migrate → rollback → migrate | Passed explicitly on both destination engines |
| Laravel Pint, full `--test` | Passed |
| PHPStan/Larastan | Passed, zero errors |
| Composer strict validation / locked security audit | Passed / no vulnerability advisories reported; package versions unchanged |
| OpenAPI validator | Passed: 58 operations match routes, 26 actual response fixtures conform |
| Production-mode HTTP smoke, MariaDB | Passed: login, upload/process/public PNG+WebP URLs, publication/detail/analytics, unpublish visibility, inquiry cleanup and logout revocation |
| Unchanged shared Dart client's live API smoke, MariaDB | Passed: media, content/relationships, team, taxonomy, services, settings, inquiries, reports, audit and logout |
| Shared API package | Static analysis clean; **30 tests passed** |
| Flutter dashboard | Static analysis clean; **36 tests passed** |
| Finite queue runner | Processed real smoke image jobs; overlapping invocation exits successfully without starting a second PHP worker |
| Scheduler | `schedule:list` shows retention/failed-job tasks; `schedule:run` executed successfully with no task due at that time. Retention behavior also exercised by backend suite |
| Backup/restore rehearsal, MariaDB | Delivered backup script exported fictional smoke DB; SQL restored into new `portfolio_restore_testing`; table/owner/media counts matched and fictional archived media content restored |
| Shell syntax / diff whitespace | Passed |
| Preservation check | SHA-256 comparison found no changes in dashboard, website, shared client or `docs/openapi.yaml` |

Representative commands (use the real local PHP path and private environment configuration):

```sh
cd backend
php artisan migrate --force
php artisan migrate:rollback --force
php artisan migrate --force
php artisan migrate --database=legacy_pgsql --path=tests/Fixtures/postgres --force
TRANSFER_TEST_SOURCE=1 php artisan test
vendor/bin/pint --test
vendor/bin/phpstan analyse --memory-limit=512M
composer validate --strict
composer audit --locked
python ../scripts/check-openapi.py
```

The full suite was repeated with each destination port/engine. Contract checking uses the same isolated PHP binary through PORTFOLIO_PHP/PATH. HTTP/client smoke uses disposable loopback API fixtures and is not a production acceptance script. Raw local output resides in the private temporary runtime directory, not Git; this report records the results without including tokens/passwords or record payloads.

## External gates and limits

- Exact **MariaDB 11.8.9** runtime, PHP **8.5.12** container build and hosted GitHub Actions have not been executed here. Native tests used the versions above. Docker CLI exists, but the Compose plugin is unavailable (`docker compose config --quiet` failed); container execution/config validation is not marked passed.
- Hostinger's account-specific PHP/CLI extensions, resource quotas, document root/open_basedir/symlink support, HTTPS/Authorization forwarding, cron timing, `timeout`/`flock`/`pcntl`, media latency and sustained throughput require an authorized hosting preflight. Published newer Unlimited limits do not establish this existing Business account's limits.
- Dashboard widget tests and the shared client's live HTTP workflow passed. A manual browser/native-device dashboard session against Hostinger and a Jaspr live-site test were not performed. Cron upload latency must be accepted on the actual account.
- Existing PostgreSQL records were not inspected, copied or deleted. Whether valuable records exist remains an owner inventory decision. If records exist, changing DB_CONNECTION alone loses access to them; follow the tested [transfer process](postgres-to-mysql-transfer.md). Actual source/media reconciliation, production-sized duration, matching APP_KEY and encrypted off-host backup/restore remain cutover gates. The automated transfer rehearsal uses fictional records and covers all table inventories, not every historical data combination.
- No production deployment, destructive existing-database migrations, credential commits, dependency upgrades, or API schema/client source changes occurred.

See [Hostinger deployment](hostinger-deployment.md), [data transfer](postgres-to-mysql-transfer.md), [development setup](development.md) and [integration guide](api-integration.md). Earlier PostgreSQL completion/progress entries remain explicitly historical.
