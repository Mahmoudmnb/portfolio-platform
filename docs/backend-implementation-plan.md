# Portfolio Platform — Complete Laravel Backend Implementation Plan

> Place this file at `docs/backend-implementation-plan.md` in the repository.
> Instruction for Codex: Read this entire file, inspect the repository and applicable AGENTS.md instructions, then implement the backend through every phase. This is an implementation specification, not a request for another proposal.

## 1. Goal and boundaries

Build a production-ready, open-source Laravel REST API for Mahmoud Bannan's portfolio and small team website. The platform presents Flutter, computer vision, and audio work. Its public website uses Jaspr, and its future Android administration app uses Flutter. Both clients consume this API.

Deliver backend code, meaningful tests, local infrastructure, CI, deployment tooling and instructions, an OpenAPI contract, and a complete Markdown integration guide. Start from scratch if no backend exists.

Do not implement or rewrite the Jaspr website, Flutter dashboard, or shared Dart package during this task. Preserve their existing files. Reserve their repository locations if needed. No AI inference, audio processing, commerce, payments, public accounts, microservices, or multitenancy is required. Products are portfolio entries with external links, not items sold through this backend.

Working structure:

```text
backend/                         Laravel application and its tests
website/                         Existing/future Jaspr application; leave untouched
dashboard/                      Future Flutter application; leave untouched
packages/portfolio_api/           Future shared Dart client; do not implement
docs/backend-implementation-plan.md
docs/architecture.md
docs/api-integration.md
docs/openapi.yaml
docs/development.md
docs/deployment.md
docs/backend-progress.md
docs/backend-completion.md
.github/workflows/backend.yml
README.md
AGENTS.md
```


## 2. Execution rules for Codex

1. Inspect the repository, installed tools, existing changes, and applicable instructions before editing. Never overwrite unrelated work or initialize a nested Git repository.
2. Implement this specification phase by phase. Do not stop after scaffolding or after writing a plan. Continue until acceptance criteria pass or an actual external blocker prevents further work.
3. Make ordinary implementation decisions autonomously using the defaults below. Ask only when missing information materially blocks safe implementation. Document reasonable assumptions.
4. Use official documentation for the selected Laravel major and compatible package versions. Verify the stable supported Laravel/PHP combination at implementation time, pin it in project files, and commit Composer's lockfile. Do not use development branches or claim an unverified version is current.
5. Prefer framework conventions, small controllers, Form Requests, API Resources, policies, and focused actions/services for workflows involving transactions or files. Avoid generic repositories, speculative abstractions, and unnecessary dependencies.
6. Use real migrations and implementations. No fake successful responses, security TODOs, placeholder endpoints, or skipped core tests.
7. Preserve backward compatibility with an existing implementation if one is discovered; explain any conflict with this greenfield specification before making destructive changes.
8. Never commit secrets, personal visitor data, real contact messages, uploaded production media, local databases, or hard-coded administrator credentials. Never run destructive production migrations or deploy publicly without explicit authorization.
9. Keep `docs/backend-progress.md` updated with phases, decisions, commands run, results, and remaining blockers. Resume from evidence rather than repeating completed work. Mark a phase complete only after its checks pass.
10. If external credentials or hosting access are absent, finish and verify locally, supply exact configuration/deployment instructions, and report the remaining external step. Do not call an unexecuted production deployment complete.
11. Implement backend-only `AGENTS.md` guidance at the appropriate location without weakening existing root instructions. Include commands, directory boundaries, privacy rules, and documentation obligations.

## 3. Fixed technical defaults

- Laravel, with a supported stable PHP version compatible with the selected release.
- PostgreSQL for development, integration tests, CI, and documented production. Do not rely exclusively on SQLite tests.
- Laravel Sanctum bearer tokens for the native Flutter administrator app.
- One owner administrator in version 1. No public registration, role editor, or administrator-management API. Public team profiles never grant authentication access.
- Database-backed queues and cache initially; Redis is not required. Scheduled cleanup runs through Laravel's scheduler.
- Laravel filesystem abstraction: local media for development; configurable S3-compatible object storage for production. Document configuration for both.
- Docker Compose is the reference reproducible local environment, with application, PostgreSQL, queue worker, scheduler, and development mail capture. Use one maintained image/build definition where practical.
- PHPUnit or Pest, choosing the framework's supported default; Laravel Pint for formatting. Add a maintained static analyzer if compatible and justify its configuration.
- REST under `/api/v1`; JSON only except uploads; OpenAPI 3.1 document with examples and security definitions.
- UTC storage and ISO 8601 timestamps with timezone. Analytics days and ranges use UTC. English content initially; do not build localization infrastructure.
- No public API key: a key embedded in Jaspr would not be secret. Public routes use validation, throttling, and visibility rules.

## 4. Data model

Use integer primary keys consistently. All managed entities have timestamps. Add foreign keys, unique constraints, query indexes, factories, and sensible length limits. Store enum values as documented strings with application enums and database constraints where portable within PostgreSQL. Do not expose database rows directly.

### 4.1 Administrator users

`users`: name (120), normalized unique email (254), hashed password, enabled boolean. No self-registration. Bootstrap the first owner through an interactive `app:create-owner` command with hidden password input and confirmation. Reject additional owners in v1; provide a documented recovery command for disabling access, revoking all tokens, and resetting the owner's password without command-line plaintext secrets. Serialize neither hashes nor authentication internals.

### 4.2 Portfolio entries

Use one `portfolio_entries` table and expose `/entries`; `kind` distinguishes `project` and `product`. This avoids duplicating identical management behavior.

Fields: kind, unique slug (160), title (180), summary (500), description (Markdown, maximum 50,000 characters), category_id nullable, status (`draft`, `published`, `archived`), published_at nullable, featured boolean, sort_order integer, cover_media_id nullable, repository_url nullable, demo_url nullable, external_url nullable. Descriptive content is plain text or Markdown, never trusted HTML. Products have no prices, checkout, or payment behavior.

Relations: technologies through a unique pivot; team members through a unique contributor pivot; ordered gallery through an entry-media pivot (media_id, alt_text, sort_order).

Publication rules: creation defaults to draft. Setting status to published sets published_at to now if absent; future publication dates are rejected in v1. Published entries require a title, slug, summary, description and ready cover image. Drafts may omit cover images. Other required text fields remain validated on drafts. Unpublish/archive must remove public visibility immediately. A public entry must have `status=published` and nonfuture `published_at`. Deleting a published entry returns 409 until it is unpublished. Deletion is permanent after this guard; no trash/recovery API in v1.

Slugs: generated once from title if absent, with collision suffix; editable explicitly; changing title does not change slug. Never silently rewrite a supplied duplicate slug. Define unique constraints and handle concurrent collisions.

### 4.3 Taxonomies

`categories`: unique slug, name (120), description nullable (1,000), sort_order.
`technologies`: unique slug, name (120), website_url nullable.
A category cannot be deleted while referenced (409). Referenced technologies cannot be deleted until detached (409). Public taxonomy routes return only taxonomies attached to publicly visible entries, avoiding draft information leakage.

### 4.4 Team members

`team_members`: unique slug, name (120), role_title (180), bio (10,000 Markdown), photo_media_id nullable, is_active boolean default false, sort_order. Separate `team_member_links`: label (80), URL, sort_order; limit 10 per member. Activation requires name, role_title and ready photo. Only active members appear publicly. Entry contributors expose only active members publicly; admin responses may include inactive contributors. Team member deletion detaches entry contributor links transactionally.

### 4.5 Services

`services`: unique slug, title (180), summary (500), description (20,000 Markdown), optional validated icon_key (plain identifier), is_active default false, sort_order. Public API exposes active services only. No executable SVG or arbitrary HTML icon input.

### 4.6 Site settings

A singleton typed settings record, not arbitrary key/value editing: site_title, tagline, introduction, contact_email, availability (`available`, `limited`, `unavailable`), logo_media_id nullable, default_seo_title, default_seo_description, and up to 10 labeled social links. Do not put secrets or deployment configuration here. Validate fields with explicit lengths. Site settings are immediately public after update; no draft settings in v1.

### 4.7 Media

`media`: generated storage key, disk, original_filename (metadata only), verified MIME type, bytes, width, height, processing status (`processing`, `ready`, `failed`), uploader_id. Store relationships through foreign keys and documented pivots, including settings logo. URLs are derived from filesystem configuration, never client-supplied storage paths.

See section 8 for lifecycle and failure handling.

### 4.8 Contact inquiries

`inquiries`: name (120), email (254), subject (180), message (10,000 plain text), status (`new`, `read`, `replied`, `archived`), internal_note nullable (5,000), submitted_at, last_status_changed_at nullable. Status `replied` records that the owner replied elsewhere; no outgoing reply API. Never expose inquiries publicly. Do not store IP/user-agent in this table. Default retention is 180 days from submission, configurable.

### 4.9 Analytics

Implement aggregate counters, not visitor profiles. `analytics_daily_counts`: UTC date, event_name, path (bounded normalized path), entry_id nullable, referrer_host nullable, count. Use a canonical non-null aggregate key/hash to enforce one bucket even when dimensions are null; demonstrate concurrency-safe atomic upsert. Preserve historical buckets after entry deletion with nullable relation and stable dimension key.

Event names: `page_view`, `entry_view`, `contact_click`. No session ID, fingerprint, visitor identifier, IP address, full referrer URL, full browser agent, or query strings persisted by the analytics feature. No unique visitor or conversion-rate claims. Totals represent accepted events and may include bots/retries.

### 4.10 Audit events

`audit_events`: actor_id nullable, action, entity_type, entity_id, minimal change summary, created_at. Record successful content mutations, settings changes, uploads/deletions and inquiry status changes. Record no passwords, tokens, inquiry message/email, raw request payloads, or unnecessary deleted content. Admin-only read access. Retention 180 days, configurable.

## 5. API contract and conventions

### Responses

- Single item: `{ "data": { ... } }`.
- Collections: `{ "data": [ ... ], "links": { ... }, "meta": { "current_page": 1, "per_page": 20, "last_page": 1, "total": 0 } }`.
- Error: `{ "message": "...", "code": "VALIDATION_ERROR", "errors": { "field": ["..."] }, "request_id": "..." }`; errors object may be empty outside validation failures.
- 200 read/update, 201 create, 202 analytics accepted, 204 delete/logout, 401 unauthenticated, 403 forbidden, 404 absent or not publicly visible, 409 conflicting state/reference, 422 validation, 429 throttled with Retry-After, generic 500 with request ID. Normalize API framework exceptions too. Never expose traces or SQL.
- UUID request ID generated server-side, returned as `X-Request-ID`, used in logs and errors. Do not blindly trust arbitrary incoming identifiers.
- Dates ISO 8601 UTC; date-only analytics boundaries `YYYY-MM-DD`; IDs integers; booleans JSON booleans.
- Pagination default 20, maximum 100. Reject invalid pagination, filter or sort values with 422; whitelist columns and directions. Consistent tie-breaker by ID.
- List ordering: featured descending, sort_order ascending, published_at descending, ID ascending for public entries; sort_order then ID for team/services/categories; documented admin sorts.
- Eager-load exposed relations and test query counts do not scale linearly with collection size.
- Public responses omit private metadata, inactive relations, internal storage keys and uploader identities. Public media remains publicly accessible when someone knows its URL; unpublishing a page is not a private-file revocation mechanism. Explain this explicitly.

### Public routes

| Method | Route after `/api/v1` | Behavior |
| --- | --- | --- |
| GET | `/entries` | Published entries; filters kind, category slug, technology slug, featured, q; page/per_page |
| GET | `/entries/{slug}` | Published detail with ordered gallery and visible contributors |
| GET | `/categories` | Taxonomies attached to visible entries |
| GET | `/technologies` | Taxonomies attached to visible entries |
| GET | `/team-members` | Active members |
| GET | `/team-members/{slug}` | Active profile |
| GET | `/services` | Active services |
| GET | `/services/{slug}` | Active service |
| GET | `/site-settings` | Explicit public settings representation |
| POST | `/inquiries` | Validate and create privately; generic acknowledgment, no submitted content returned |
| POST | `/analytics/events` | Validate and atomically increment allowed bucket; 202 |

Search q maximum 100 chars, case-insensitive literal substring over title/summary only, with escaped wildcard characters and parameter binding. Do not add search infrastructure.

### Authentication routes

| Method | Route after `/api/v1` | Behavior |
| --- | --- | --- |
| POST | `/admin/auth/login` | email, password, device_name; return bearer token, token_type, expires_at, safe user |
| GET | `/admin/auth/me` | Current enabled owner |
| POST | `/admin/auth/logout` | Revoke current token |
| POST | `/admin/auth/logout-all` | Revoke all owner's tokens |
| PUT | `/admin/auth/password` | current_password, password, password_confirmation; revoke all tokens, require login again |

No refresh endpoint in v1. Configure token lifetime to 7 days by default. Return 401 for expired/revoked tokens; Flutter reauthenticates. Document secure device storage as a client responsibility. Login errors must not disclose whether an email exists. Disabling an owner blocks existing tokens on every request. Use policies/authorization as well as authentication; token abilities alone are not user permissions. Never send admin credentials or tokens from public Jaspr code.

### Protected administration routes

Prefix `/api/v1/admin`, all require enabled owner authorization.

- Resource CRUD for `/entries`, `/categories`, `/technologies`, `/team-members`, `/services` using numeric IDs. Implement index/show/store/update/destroy with PATCH updates; define full field schemas and writable filters in OpenAPI.
- Entries filter kind/status/category/technology/featured/q; team/services filter active; taxonomy search by name.
- GET/PUT `/site-settings` for typed singleton full update. Missing required fields on PUT return 422.
- POST `/media` multipart upload; GET `/media`, GET `/media/{id}`, DELETE `/media/{id}`. Index exposes processing state and usage count; filter state and used/unused.
- GET `/inquiries`, GET `/inquiries/{id}`, PATCH `/inquiries/{id}`, DELETE `/inquiries/{id}`. Filter status/date range, sort newest first. PATCH only status/internal_note; GET does not mark read implicitly.
- GET `/analytics/summary`, GET `/analytics/daily`, GET `/analytics/top-pages`, GET `/analytics/top-entries`, GET `/analytics/referrers`.
- GET `/audit-events` with bounded pagination and filters action/entity_type/date.

Nested entry relationships are updated via entry PATCH arrays: technology_ids, contributor_ids, and gallery objects. If supplied, replace the complete relation set transactionally; omitted keys leave relations unchanged; empty arrays clear relations. Reject duplicates, invalid IDs, unready media and over-limit arrays. Apply the same replacement behavior to member/social links. Cap galleries at 20, technologies at 30 and contributors at 30. Never accept client IDs for the owner or audit actor. Document null versus omitted fields for PATCH.

Public collection responses are paginated, including team/services/taxonomies. Settings is a singleton. Public entry list contains summaries, cover and taxonomy; detail includes description, gallery and contributors. Expose seo title/description derived from content unless a separately specified override exists; do not invent editable fields silently.

## 6. Security and abuse controls

- HTTPS in production. CORS allows configured website origins; never wildcard credentialed origins. CORS is not an authorization or abuse-control boundary. Native apps do not depend on CORS.
- Credentials only in Authorization headers; never URLs. Disable token/credential request logging. API clients send Accept: application/json.
- Form Request allowlists, safe Resource serialization, policies on every admin route, database constraints, transactions and upload checks.
- HTTPS/HTTP URL validation for content links only; reject javascript/data/file schemes, userinfo credentials, and excessive lengths. Never fetch user-supplied URLs on the server.
- Markdown is untrusted: API returns it as text; clients must sanitize rendered output and disable unsafe raw HTML. Document this in the integration guide.
- Initial configurable limits: login 5/minute per normalized account+IP plus 30/minute per IP; public reads 120/minute/IP; inquiries 3/hour/IP; analytics 60/minute/IP; admin uploads 20/minute/user; admin mutations 120/minute/user. Bound request body size at proxy and application layers. Document shared-IP tradeoffs.
- IP addresses may be used transiently in keyed-hash limiter keys with expiry; never persist raw IPs in application analytics. Redact logs and document web server/provider log configuration separately. Treat proxy headers as trusted only from configured proxies.
- Honeypot optional field on inquiries: filled honeypot returns same generic success without storing an inquiry. Honeypot does not replace throttling. No CAPTCHA service dependency in v1.
- Default no response caching of public content in v1, preventing stale publication visibility. Add Cache-Control no-store to auth, admin and inquiry responses. Explicitly document public caching headers.
- Clean production exception handling and APP_DEBUG=false; security headers at deployment layer. No embedded demo owner in production seeders.

## 7. Inquiry and analytics behavior

Inquiries: trim fields, validate email, return a stable acknowledgment without leaking message IDs. Record once per accepted request; no email notifications required in v1. Database persistence must work without SMTP. Document lack of automatic retry deduplication.

Analytics payload: event_name, path, optional entry_id, optional referrer. Limit path to 255 characters, require relative path beginning `/`, reject `//`, schemes, control chars and query/fragment content. Normalize trailing slash consistently. Referrer may be a valid HTTP(S) URL up to 2,048 chars; derive and store only lowercase host, strip www consistently, ignore own configured site hosts, never fetch it. Reject unknown event fields.

For entry_view, require a currently published entry; other events must omit entry_id. Validate supported payload/event combinations before incrementing. Accept only path shapes documented for the website; no arbitrary metadata, timestamps, device fields or identity fields. Server controls receipt time. Cap referrer cardinality using a configurable daily distinct-host ceiling with overflow into `other`; test it. Known bots may be excluded when practical without storing user-agent; do not promise bot-proof counts.

Default raw aggregate retention 90 days, configurable. Stats accept inclusive start_date/end_date, default last 30 UTC days including today, maximum 90-day span, no future dates; reject reversed/invalid ranges. Daily results fill zero days; summaries expose event totals, not unique people. Top lists limit default 10 maximum 50. Document treatment of deleted entries and the available retention window. The Flutter dashboard records no public visitor events itself.

Scheduled idempotent commands prune analytics, inquiries, audit events, expired tokens and old unattached media. Tests use frozen clocks to verify boundaries. Retention jobs log counts, never deleted content.

## 8. Media workflow

Accept JPEG, PNG and WebP only, up to 10 MiB and 20 megapixels; also bound each dimension to 8,000 pixels. Check actual decoded image type and dimensions; reject SVG, GIF, audio, video, malformed data and decompression-bomb input. Set processing resource limits and use a supported image library. Re-encode images to strip metadata, including GPS/EXIF. Do not retain the original upload after processing. Generate randomized keys independent of filenames.

Upload stores a processing record and temporary private input, queues image processing after transaction commit, returns 201 with processing state. Media status is obtained by polling GET; no websockets. Store the processed original-sized display image and a bounded thumbnail; document their dimensions and URL fields. Do not upscale. If queue dispatch/processing fails, preserve a useful failure state without exposing internal exceptions; clean temporary input on success or terminal failure. Retry with bounded backoff; processing must be idempotent.

Ready media may be attached to content; processing/failed media may not. Public Resources only include ready images. Prevent deletion of referenced media with 409, including references from drafts, galleries, inactive members and settings. Do not delete media automatically when deleting content.

Deleting unused media: transition to a deletion state or equivalent durable cleanup job, ensure it cannot be attached while deletion is pending, remove all variants, and retry failed file operations safely. Prevent attach/delete races with locking/transaction design and tests. Clean unattached uploads older than 24 hours, but never referenced files. Concurrent attach versus cleanup must preserve referential integrity. Local storage URL configuration must work for a physical Android device, not just localhost on the host computer.

## 9. Implementation phases and acceptance gates

### Phase 0 — Inspect, decide, scaffold

- Inspect tools, root files and existing work. Select and record exact supported versions.
- Scaffold Laravel in backend without nesting Git. Create required directories and scoped Codex instructions.
- Add Composer lockfile, safe .env.example, development Compose, PostgreSQL, queue/scheduler and mail capture.
- Use configurable host ports and health checks. App waits for database readiness. Document host-native commands as an alternative.
- Root README explains monorepo responsibilities and backend setup. Do not claim absent client apps are implemented.

Gate: a new checkout can build/start the backend, connect to PostgreSQL, migrate, and answer `/up`. Record actual commands and tool versions.

### Phase 1 — Schema and seed data

- Implement schema, indexes, relationships, enums, factories and deterministic fictional content.
- Production seeding creates safe singleton defaults only; demo content requires an explicit nonproduction command/flag. No seed passwords.
- Add migration tests on PostgreSQL, relation constraints and publication visibility tests.

Gate: migrations run on an empty database, rollback in the isolated test environment, and rerun; factories and demo data work reproducibly without network access.

### Phase 2 — Authentication and owner authorization

- Implement bootstrap/recovery commands, Sanctum, throttles, policies, enabled-owner middleware, password update, logout/logout-all and token pruning.
- Normalize API errors/request IDs. Configure CORS and sensitive-response caching.

Gate: owner lifecycle works; wrong credentials, disabled accounts, missing/expired/revoked tokens fail correctly; every management route is protected. No registration route exists.

### Phase 3 — Media and content management

- Implement validated uploads and processing, content CRUD and transactional relationships, settings, publish guards, conflict responses and audit recording.
- Track cleanly failed queue/storage operations; eager-load Resources.

Gate: owner can upload a real image, wait for ready state, create and publish an entry, edit it, unpublish it and delete it. Referential deletion guards and race handling work.

### Phase 4 — Public API

- Implement read-only visibility-safe endpoints, filters/search/order/pagination and safe serialization.
- Match nested visibility behavior, including hidden contributors and taxonomies used only by drafts.

Gate: unauthenticated clients can discover published content only. Guessed draft slugs return 404. Unpublish takes effect immediately. Error handling and pagination match the contract.

### Phase 5 — Inquiries, analytics, retention

- Implement throttled inquiry and event ingestion, aggregation, stats, audit listing, pruning commands and schedule.
- Keep the analytics feature enabled by config with a documented disabled behavior (202 without persistence), and state that consumers should respect any consent requirements applicable to their deployment.

Gate: events aggregate correctly under repeat/concurrent increments, reporting matches UTC boundaries, retention is idempotent, and no visitor identifiers leak into application persistence/logs.

### Phase 6 — API contract and teammate handoff

- Write complete `docs/openapi.yaml`: every route, security, request fields, nullability, response fields, status, query, multipart upload and representative example. Auth routes show their exceptions to global security.
- Write `docs/api-integration.md` for Jaspr and Flutter with runnable HTTP/curl examples using placeholders, not real tokens.
- Cover base URLs by environment; public list/detail flow; project/product kind; Markdown rendering; relative/full media URLs; loading/error/empty states; pagination/filter encoding; publishing; eventual media readiness; cache behavior; contact form and analytics; token expiry/logout; no admin secrets in public website.
- Include full JSON examples for entry list/detail, team, settings, validation errors, login and analytics, consistent with tested fixtures.
- Document concurrent editing as last-write-wins in v1; dashboard should refetch after a successful update. No silently implied optimistic locking.
- Check route inventory against OpenAPI operations using an automated test or script; validate OpenAPI with a compatible validator. Check representative actual responses against schemas.

Gate: a teammate can implement both clients without reading Laravel controllers; no undocumented endpoint or example contradicts implementation.

### Phase 7 — CI, deployment and operations

- GitHub Actions scoped to backend/docs contract/shared workflow changes; PostgreSQL service; install from lockfile; test environment only; formatting, meaningful static analysis, migrations/tests, OpenAPI validation and dependency audit.
- Pin action revisions or documented stable releases, minimum permissions, no production secrets on pull-request jobs. Dependency audit must not silently ignore findings; record justified exceptions explicitly.
- Provide production container or exact reproducible image build, non-root runtime where practical, document root `backend/public`, required extensions, writable paths and health/readiness checks.
- `/up` is liveness; implement separate minimal readiness check verifying database and writable/default storage without exposing config. Do not require a queue to drain synchronously for health.
- Document HTTPS/proxy/CORS, env vars, persistent media, object storage, database/cache/queue configuration, scheduler, supervised worker retries/timeouts, failed jobs, logs and redaction, deployment migrations, cache commands and worker reloads.
- Provide a deployment checklist and safe command/script that stops on failure. Do not generate APP_KEY on every start; do not run migrations from every web/worker replica. No automatic destructive rollback migrations.
- Document database and media backups, restore procedure and a local restore drill. Retain APP_KEY securely. Explain that application rollback must remain compatible with migrated data.
- Provide operational commands for owner recovery, token revocation, cleanup, retrying failed jobs and diagnosing storage URLs.

Gate: CI checks pass or are honestly marked unrun with exact blockers; a local production-like build runs with debug disabled and demonstrates web, worker, scheduler and media persistence.

### Phase 8 — Final review and handoff

- Run the complete required checks after final relevant edits, fix failures and remove dead code/debug artifacts.
- Execute an end-to-end smoke workflow through HTTP: create owner, login, upload/process image, create/publish entry, fetch public list/detail, unpublish and verify 404, submit inquiry, record event, read stats, logout and verify rejection.
- Write `docs/backend-completion.md` with versions, delivered features, schema/API locations, exact commands/results, security/privacy decisions, limitations and external deployment tasks.
- Update root README and progress checklist. Report changed paths and test evidence without claiming website/dashboard implementation or live deployment.

Gate: all applicable requirements below satisfied; no core TODO or placeholder remains.

## 10. Required verification matrix

Implement behavior-focused tests, not tests that merely mirror code:

- Access: every admin route rejects unauthenticated access; owner-disabled and revoked/expired tokens fail; public mutation methods cannot edit content.
- Visibility: drafts/archives/inactive profiles hidden in list, detail, taxonomies, contributors and any counts; public resources omit private fields.
- Content: slug collisions, patch omission/null/empty distinctions, invalid relationships, publication requirements, stable ordering, filter validation and transaction rollback.
- Media: forged MIME, invalid/oversized dimensions, traversal filenames, metadata stripping, failed processing, retries, in-use deletion, race-safe attach/deletion and orphan cleanup.
- Auth: generic login failures, rate limits, password checks, password update revocation and sensitive fields/log redaction.
- Inquiries: no public read/list, honeypot behavior, length/email checks, throttles, status transitions and private-note isolation.
- Analytics: validation, unpublished target rejection, query-string refusal, host normalization, zero-filled days, atomic bucket increments including null dimensions, cardinality cap, deleted entries and retention boundaries.
- API: JSON errors even for invalid authentication/404/405, 413 mapping where app handles it (document proxy differences), 429 headers, CORS allowed/disallowed origins and allowed methods.
- Database: PostgreSQL constraints/migrations, concurrent slug conflict handling and aggregate update correctness.
- Operations: jobs dispatched after commit, idempotent jobs/cleanup, scheduler registration, generic readiness failure and no debug leakage.
- Contract: OpenAPI validates; operation list matches application routes; representative examples conform to actual responses.
- Performance: pagination caps and a bounded query-count regression test on entry collections with relationships. Do not invent throughput guarantees without load tests.

## 11. Definition of done

- [ ] Laravel backend exists in backend/ with dependency lockfile and documented supported versions.
- [ ] PostgreSQL migrations, indexes, factories and safe demo seed flow work.
- [ ] Owner bootstrap/recovery and complete token lifecycle work without embedded credentials.
- [ ] All specified public/admin routes implemented with validation, authorization and stable JSON.
- [ ] Media lifecycle handles processing, references, retries and cleanup safely.
- [ ] Publishing and nested visibility rules verified.
- [ ] Private inquiries and aggregate-only analytics implemented with retention.
- [ ] Audit logging is useful without exposing sensitive content.
- [ ] Docker local setup, workers/scheduler and environment examples verified.
- [ ] Tests and CI cover the required behaviors and run on PostgreSQL.
- [ ] OpenAPI and teammate Markdown guide match actual behavior.
- [ ] Production configuration, backup/restore and deployment procedure documented and locally exercised where possible.
- [ ] Completion report distinguishes verified results from external/unrun steps.
- [ ] Existing website/dashboard files preserved; no unrelated product features added.
- [ ] Repository contains no secrets, default production password or real visitor data.

## 12. Reference policy and starting references

At implementation time, resolve the documentation for the exact selected Laravel major and record links/versions in architecture.md. Avoid using master documentation as a release contract.

- Laravel documentation: https://laravel.com/docs
- Sanctum: https://laravel.com/docs/sanctum
- Validation: https://laravel.com/docs/validation
- Authorization: https://laravel.com/docs/authorization
- API Resources: https://laravel.com/docs/eloquent-resources
- Storage: https://laravel.com/docs/filesystem
- Queues: https://laravel.com/docs/queues
- Scheduling: https://laravel.com/docs/scheduling
- Testing: https://laravel.com/docs/testing
- Deployment: https://laravel.com/docs/deployment
- OpenAPI specification: https://spec.openapis.org/oas/latest.html

## 13. Initial prompt to execute this plan

```text
Read docs/backend-implementation-plan.md completely and inspect applicable
AGENTS.md instructions and the existing repository. Implement the complete
Laravel backend described in that file, beginning with project scaffolding
and continuing through tests, API documentation, CI, deployment preparation
and final verification. Leave website/ and dashboard/ implementation out of
scope. Maintain docs/backend-progress.md as you work. Make documented routine
decisions independently, verify current compatible framework versions, and
continue through all phases instead of stopping after a plan. Never overwrite
unrelated changes or perform a production deployment. Report actual verification
results and any external blockers honestly.
```
