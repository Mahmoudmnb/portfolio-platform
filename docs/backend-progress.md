> Current database migration, 2026-10-22: see [MySQL/MariaDB completion evidence](mysql-migration-completion.md). The PostgreSQL delivery notes below are historical; current runtime uses MySQL/MariaDB, and client applications now exist.

# Backend implementation progress

## Git synchronization and conflict resolution — 2026-11-23

Preserved the local route commit and committed the ten existing documentation/tooling edits before merging `origin/chore/open-source-readiness` and `origin/main`. Resolved `backend/composer.lock` using the complete upstream `main` lockfile, retaining its reviewed dependency updates and the existing Laravel/Symfony security fixes. Kept the complete local OpenAPI definitions: automatic merging had introduced duplicate page path keys and a duplicate media PATCH operation that would silently replace the typed schemas when parsed. A strict duplicate-key check now passes on the resolved document.

The upstream runtime image selected PHP 8.6 RC, which conflicts with Composer's `~8.5.0` requirement and the stable-runtime policy. Restored the existing PHP 8.5.12 container pin. The newer Larastan analyzer identified a mutable date assigned to the entry's immutable publication-date property; publication now initializes it with `CarbonImmutable::now()`. Existing publication tests cover this behavior. No dependency constraints or locked versions were changed beyond adopting upstream `main`.

Post-resolution verification used PHP 8.5.4, PHPUnit 13.4.8, PHPStan 2.3.7 and Larastan 3.15.0 with the existing isolated test runtimes under `/tmp/portfolio-website-tests`:

- MariaDB 11.8.6: **60 tests, 608 assertions passed; no skips**, repeated after the publication-date fix.
- MySQL 8.4.13: **60 tests, 608 assertions passed; no skips**. Both suites included the disposable PostgreSQL legacy-transfer source.
- Full Pint and dirty Pint formatting passed; PHPStan passed with zero errors at the configured level and 512 MiB limit.
- Composer installation, strict validation and platform requirements passed; `composer audit --locked` reported no security vulnerability advisories.
- OpenAPI 3.1 validation passed with **63 matching operations and 32 conforming response fixtures** using upstream's validator 0.9.0. Postman regeneration produced no changes; tracked credential and resource-ID values remain blank.
- Whitespace and conflict-marker checks passed. The final client directory trees match upstream `main` exactly; no client implementation edits were made.

Docker image execution remains unverified: this account cannot access the Docker daemon and the Compose subcommand is unavailable. Hosted CI results remain external. No deployment or production database operation was performed. The user selected `main` as the GitHub destination.

## Current website content update — 2026-11-23

Implemented the requested [Brothers-Tech website brief](../backend/docs/brothers_tech_backend_integration_plan.md) as an additive extension of the existing API. See the [Flutter change guide](../backend/docs/flutter-backend-updates.md), [tested request examples](../backend/docs/flutter-api-examples.md), and [client checklist](../backend/docs/flutter-implementation-checklist.md).

Delivered five fixed page keys with typed content/section headings, draft/published visibility, inline SEO and locked ready-media attachment; owner page GET/list/PUT and public GET routes; ordered featured entry references filtered by live publication; extended settings/contact/navigation/footer/CTA/legal/logo variants; project classification/details/platform/store/SEO fields; service features/cover/CTA/SEO; team-link visibility; editable media alt text and processed file metadata; private inquiry source paths and optional generic queued alerts with a manual requeue command. New media references participate in usage counts, deletion guards and orphan cleanup, including a concurrent page attachment/cleanup test. Existing `/entries`, `/site-settings`, kind/status values and older write bodies remain supported. Literal search now explicitly converts bound strings to utf8mb4, preserving behavior with native PDO bindings on both engines. The legacy transfer compares shared source/target columns, leaving new destination fields at defaults.

Production seeding remains singleton settings only. The opt-in nonproduction demo command creates idempotent fictional drafts for all five pages. The original website source archive was not supplied, so no complete existing-copy/asset import is claimed. No client source, real records or hosted database was changed, and no public deployment was performed.

The user explicitly approved seven compatible dependency security updates after the original locked audit reported 10 advisories in seven existing packages: Laravel 13.38.0 → 13.43.0; Symfony filesystem/http-foundation/http-kernel/routing/yaml 8.1.9 → 8.1.11; Symfony mime 8.1.7 → 8.1.10. No new dependency or major-version change was introduced. Composer manifest constraints are unchanged.

Verification used PHP 8.5.4 and isolated native MariaDB 11.8.6 / MySQL 8.4.13 data directories and Unix sockets under `/tmp/portfolio-website-tests`. GD/PDO PostgreSQL and missing database runtime libraries were extracted there without system installation. PostgreSQL 18.6 was used only as the disposable frozen legacy transfer source; all application integration tests used MySQL/MariaDB. No SQLite was used.

| Final post-upgrade check | Actual result |
| --- | --- |
| MariaDB 11.8.6 full suite | **60 tests, 608 assertions passed; no skips** |
| MySQL 8.4.13 full suite | **60 tests, 608 assertions passed; no skips** |
| New page/resource documentation examples | Accepted by real HTTP feature tests for all five page payloads and settings/entry/service payloads |
| Migration → full rollback → migrate | Passed on both destination engines in their disposable `_testing` databases |
| Laravel Pint, full and final dirty formatting | Passed |
| PHPStan/Larastan, level 5, 512 MiB | Passed, zero errors |
| Composer strict validation | Passed |
| Online locked security audit after approved updates | Passed; no advisories or abandoned packages |
| OpenAPI 3.1 + route/response check | Valid; **63 operations match**, **32 actual response fixtures conform** |
| Postman generation | 63 method/path pairs match OpenAPI; repeat generation is reproducible; environment secrets remain blank |
| Whitespace, handoff links, client preservation | Passed; no website/dashboard/shared-client source changes |

Representative executed commands from `backend/` (the temporary PHP extension configuration and each disposable database/transfer-source environment were selected in the shell):

```sh
php artisan migrate --no-interaction
php artisan migrate:rollback --no-interaction
php artisan migrate --no-interaction
php artisan migrate --database=legacy_pgsql --path=tests/Fixtures/postgres --no-interaction
TRANSFER_TEST_SOURCE=1 php artisan test --compact
vendor/bin/pint --format agent
vendor/bin/pint --dirty --format agent
vendor/bin/phpstan analyse --memory-limit=512M
composer validate --strict
composer audit --locked --format=json
python3 ../scripts/check-openapi.py
python3 ../scripts/generate-postman.py
git diff --check
```

The complete suite was repeated with each destination engine after the seven approved package updates. It includes successful real cross-engine import/reconciliation/rollback tests, concurrent media attachment/cleanup, publication and hidden-reference checks, generic notification delivery/idempotency and queue-dispatch failure recovery. Laravel 13.43's test teardown disconnects resolved database connections, so the readiness failure test now restores its database facade after the intentional mock; failure/visibility assertions were retained. JSON response booleans and ordering integers are normalized even when validation accepts equivalent numeric form values.

Exact Hostinger MariaDB 11.8.9, hosted CI/container execution, actual SMTP delivery and Flutter/Jaspr UI/SSR acceptance remain external release checks. No public deployment, hosted migration, real inquiry, real employee data or real owner credentials were used. The source release requires the new migration and normal configuration/worker refresh during an authorized deployment. The Markdown handoff identifies the missing source archive and editorial tasks explicitly.

## Historical delivery evidence — October 2026

Updated 2026-10-21. See [delivery report](backend-completion.md) for versions, commands, evidence and external checks.

## Gates

- [ ] 0: Scaffold/infrastructure — Laravel, PostgreSQL migrations and native liveness/readiness passed; Docker image execution remains unrun (no Docker/Podman installed).
- [x] 1: Schema, factories, safe seeding and complete test migration rollback/rerun.
- [x] 2: Owner lifecycle, policy authorization, token expiry/revocation, uniform safe errors.
- [x] 3: Media processing/retries/deletion, content relationships and publication workflow.
- [x] 4: Public visibility, filters, search, pagination and bounded relationship query count.
- [x] 5: Private inquiries, aggregate analytics, concurrency and UTC retention.
- [x] 6: Complete OpenAPI, integration guide, route inventory and actual response validation.
- [ ] 7: CI/deployment/operations — workflow and runtime/scripts delivered; native web/worker/scheduler, cache and restore checks passed. Docker and hosted Actions execution remain unrun.
- [x] 8: Final local review, full checks, production-mode HTTP smoke and handoff report; external limitations explicitly recorded.

No live deployment or external production access occurred. Client application directories remain reserved only.

## Repository and runtime

The repository initially contained the untracked implementation plan only. No pre-existing application or parent AGENTS.md was present. Read the entire plan and established backend-only scope. Selected Laravel 13 with current version-specific official references. Exact PHP dependencies are locked.

Host PHP 8.5.4/Composer 2.9.5 lacked GD, PostgreSQL PDO/tools and a container runtime. Downloaded isolated runtime packages under /tmp/portfolio-runtime; native PostgreSQL 18.6 runs on loopback port 55432. Tests use portfolio_testing and refuse non-testing database names. Python contract dependencies are isolated in /tmp/portfolio-contract-env. No host package installation or production credentials were needed.

## Delivered

All 58 versioned API operations, PostgreSQL constraints/indexes/factories, owner bootstrap/recovery, Sanctum lifecycle, media jobs and reference locks, transactional content management, safe public Resources, inquiries, atomic UTC aggregate analytics, reports/audits/retention, readiness, rootless container/Compose definitions, CI, release/backup tooling, OpenAPI and client/operations guides.

## Final check results

- Formatting: full Pint run and final dirty formatting passed.
- PHPStan 2.3.1 with Larastan 3.13.0, level 5: zero errors, no suppression baseline.
- Complete PostgreSQL suite: 37 tests, 363 assertions passed.
- OpenAPI 3.1: valid; 58 operations match routes; 26 actual response fixtures conform.
- Composer strict validation passed; final online locked audit returned no advisories or abandoned packages.
- Isolated migrations: fresh, full rollback, rerun passed. Fictional draft demo command passed twice without duplication.
- Production-mode, debug-disabled HTTP smoke passed with independent queue worker, including real PNG upload, WebP public URL retrieval, publishing/unpublishing, inquiry, analytics/statistics and token rejection after logout.
- Scheduler ran successfully; retention at 02:15 UTC and failed-job pruning registered. Config/route cache and full optimize/clear passed.
- Backup and restore into portfolio_restore_drill passed: entries/media/users/settings counts 2/1/1/1 matched, as did both restored media variant SHA-256 checksums. Artifacts remain under /tmp, outside source control.
- Deployment/backup shell syntax passed. Compose/workflow YAML parsing passed; actual Docker build/start/config and hosted Actions execution remain unrun.
- Environment files, generated caches, fixtures, uploads and storage links were checked against ignore rules.

## Issues resolved during verification

- Rejected path control/newline/query/fragment forms and fixed numeric-string analytics bucket canonicalization.
- Explicit PostgreSQL UTC sessions prevent host-timezone interpretation of UTC timestamps; stored midnight and retention boundaries tested.
- Corrected auth test guard caching to reflect fresh production HTTP requests and verified revoked/expired/disabled access.
- Preserved durable media deletion state across storage failure and tested retry; validated decoded bounds and metadata stripping.
- Allowed full settings updates to clear social_links with an empty array.
- Added typed Eloquent relationships, cast properties and explicit resource allowlists; static checks pass without hiding diagnostics.
- PHPStan download timeouts required a hash-verified official portable Composer cache; the actual locked analyzer/framework extension executed successfully.

## External work

Build/run the pinned Docker runtime, execute hosted CI, verify any real S3-compatible bucket/CDN, then configure and authorize the target deployment. Detailed steps are in backend-completion.md and deployment.md. No core application placeholder is left pending these external checks.
