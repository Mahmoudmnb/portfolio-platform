# Bannan Studio — Flutter Dashboard Implementation Plan

> Save as `docs/flutter-dashboard-implementation-plan.md` in the portfolio-platform monorepo.
> Codex: read this whole file and the actual backend contract before coding. Implement the Android dashboard through all phases, not another proposal. Preserve the completed backend and existing Jaspr website.

## 1. Outcome and source of truth

Build a polished Flutter Android application that lets the single owner manage portfolio projects/products, team, services, media, site settings and inquiries, and review aggregate analytics and audit history. Use the existing Laravel REST API; do not implement a second backend.

Sources, in order:

1. The repository's `docs/openapi.yaml` and actual backend behavior/tests for API semantics.
2. `docs/backend-completion.md`, `docs/api-integration.md` and `docs/development.md`, when present.
3. This specification for dashboard behavior and delivery requirements.
4. The Figma file for visual direction, reusable patterns and screen layout. Figma illustrative content is never production data.

API reviewed for this plan: OpenAPI 3.1.0, API version 1.0.0; 58 operations overall and 46 administration operations. The attached OpenAPI is JSON syntax in a .yaml file, which is valid YAML. Its SHA-256 at review was `31459e39838fb8ab7b932ad923f728235559019a3cd510eae06b81b5bf04a684`. Compare the repository copy before implementation; a newer contract wins, and material differences must be recorded rather than guessed.

The supplied backend completion report records 37 PostgreSQL tests/363 assertions, PHPStan success, 58 matched OpenAPI operations, HTTP smoke and a backup/restore drill. These are reported backend results, not dashboard verification performed by this plan. Container execution, hosted CI and external S3 remain pending; no live deployment occurred. Do not change those statuses without new evidence.

### Figma design

- File: https://www.figma.com/design/yFT78AadBUhXvLXYTC7BDX
- File key: `yFT78AadBUhXvLXYTC7BDX`
- Page: `01 · Dashboard design`.
- Android reference viewport: 412 × 892 logical design units; adapt layouts, never scale the whole screen as an image.
- Editable text and auto-layout layers; Material 3 button/text-field instances with local Bannan brand variables and typography.
- These are editable screen designs, not a running app or a fully wired interactive prototype.
- Some long forms are intentionally scrollable and use representative field patterns. All contract fields below still must be implemented. Do not treat a field omitted from the viewport as out of scope.
- Initials, fictional inquiries and example analytics are illustrative. Media in the real app must show actual returned thumbnails when ready, with clear processing/failed states.

## 2. Scope and execution rules

- Implement `dashboard/`, the framework-independent `packages/portfolio_api/`, dashboard documentation, and dashboard-specific CI. Add integration-test scripts if needed.
- Leave `website/` untouched. Backend changes require a demonstrated compatibility bug and a minimal regression-tested fix; do not add endpoints just to simplify dashboard widgets.
- Do not add roles, registration, password reset by email, biometric login, push notifications, AI features, offline synchronization, billing, or iOS/web releases in v1.
- One owner account exists; public team members are content, not users. There is no user-management API.
- Inspect repository instructions, installed Flutter/Dart/Java/Android tools and local changes first. Preserve unrelated work; do not initialize nested Git repositories.
- Verify supported stable versions from official documentation at implementation time. Record exact SDK, JDK, Android and package versions; commit application/package resolution files according to Dart conventions.
- Follow the Figma design-to-code skill before any Figma get_design_context call. Inspect screen context and screenshots rather than designing from memory. If Figma access is blocked, the tokens, screen mapping and behavior in this file are a usable fallback; record the limitation without inventing a visual comparison.
- Continue through all phases. Track tasks and actual verification in `docs/dashboard-progress.md`; resume from evidence. Do not mark Android execution or integration tests passed when no emulator/device/backend was available.
- Make normal implementation choices independently. Document decisions, actual blockers and remaining externally authorized actions. Do not publish an app, deploy the backend, rotate real credentials, or mutate production content as part of development.
- No fake successful operations, production sample repositories, permanently mocked screens, secret logging, or security TODOs. Demo fixtures are test/story data only and must not replace live integration.

## 3. Architecture and tooling

Use Flutter Material 3 with feature-oriented views, view models/controllers, repositories and a testable data layer. Keep it small and explicit; do not generate generic CRUD machinery that obscures entity behavior.

Default packages: Dio for networking/upload progress/cancellation, flutter_riverpod for dependency/state management, go_router for navigation, flutter_secure_storage for token storage, and a maintained Android-compatible system file/photo picker. Use compatible stable releases and document why each dependency exists. Add JSON serialization/code generation only where it reduces mistakes; tests must cover wire formats. Bundle licensed Manrope/Roboto font assets rather than requiring a network font download at startup. A small chart package is optional; an accessible custom painter is also acceptable.

Suggested layout:

```text
dashboard/
  android/
  assets/fonts/
  lib/
    app/                       Bootstrap, routing, theme, environment
    core/                      Auth lifecycle, secure storage, errors, reusable UI
    features/
      auth/
      overview/
      entries/
      media/
      team/
      services/
      taxonomies/
      inquiries/
      analytics/
      site_settings/
      audit/
      account/
  test/
  integration_test/
packages/portfolio_api/
  lib/src/                     Dart-only DTOs, requests, parsing, transport
  test/
docs/
  flutter-dashboard-implementation-plan.md
  dashboard-progress.md
  dashboard-development.md
  dashboard-design.md
  dashboard-completion.md
.github/workflows/dashboard.yml
```

The shared API package may depend on pure Dart packages, including Dio, but must not import Flutter, Riverpod UI, navigation or secure storage. Token acquisition/storage and session decisions belong to the app; inject a credential provider and transport. Include only the methods/DTOs needed now without exposing a live admin token to a public website. Importing the package does not initialize authenticated state. Public read support may reuse DTOs, but website integration is not this task.

Keep API response DTOs distinct from mutable form state. Never send a serialized response object back as a write payload: responses include read-only fields and requests reject additional properties.

## 4. Design system and navigation

### Visual tokens

| Role | Value |
| --- | --- |
| Canvas | `#F7F8F6` |
| Surface | `#FFFFFF` |
| Primary text | `#172A27` |
| Secondary text | `#5D706C` |
| Border | `#DCE5E0` |
| Teal action | `#126B5A` |
| Teal tint | `#E5F2EC` |
| Warning / tint | `#805600` / `#FFF1D5` |
| Destructive / tint | `#B53B35` / `#FDECE9` |
| Information / tint | `#295F99` / `#EAF1FA` |

Typography: Manrope headings (32/40 display, 26/34 page title, 18/26 section heading); Roboto body 14/22, labels 14/20 medium, captions 12/18. Use Flutter theme/text styles and token constants. Design spacing scale 4/8/12/16/20/24/32; card radius 16, fields 8–12, primary actions rounded. Maintain 24-unit phone page margins where space permits. Light theme only for v1.

Minimum 48 logical-pixel hit targets for interactive controls; a small visual chip may live inside a larger hit area. Show text labels alongside status colors. SafeArea, keyboard insets, scrollable forms, visible focus, TalkBack semantics and text scaling are required. At larger font settings increase control height and wrap content instead of clipping it. On wider Android screens constrain content width and optionally use a navigation rail; phone behavior is the acceptance baseline. Use real back buttons on detail/editor routes even when the Android system also provides back navigation.

### Navigation

Authenticated shell has four persistent destinations: Overview, Content, Inbox, More. Retain each tab's scroll/filter state during a session. Editor/detail pages push above the shell and offer back/unsaved-change handling. More links to Team, Services, Media, Categories & technologies, Analytics, Site settings, Activity log and Account & security. Do not advertise active-session enumeration: only current/all-device sign-out endpoints exist.

### Screen mapping

| Figma screen | Node ID | Implementation |
| --- | --- | --- |
| 01 Sign in | `2:2662` | Owner login |
| 02 Overview | `2:2663` | Summary, draft/inquiry counts, recent entries |
| 03 Content | `2:2664` | Projects/products list, search, filters, pagination |
| 04 Entry editor | `2:2665` | Complete create/edit form, including scroll sections |
| 05 Publish review | `2:2666` | Confirmation with readiness checks |
| 06 Media library | `2:2667` | Library, upload, picker and deletion constraints |
| 07 Team | `2:2668` | Active/inactive profile list |
| 08 Member editor | `2:2669` | Complete profile form |
| 09 Inbox | `2:2670` | Paginated inquiry list and status filters |
| 10 Inquiry detail | `2:2671` | Message, status and internal note |
| 11 Analytics | `2:2672` | Date range, real totals, trend and top lists |
| 12 More | `2:2673` | Management navigation |
| 13 Site settings | `2:2674` | Full settings form, branding and SEO sections |
| 14 Services | `2:2675` | List; derive editor from established form pattern |
| 15 Taxonomies | `2:2676` | Categories/technologies tabs and derived editors |
| 16 Account & security | `2:2677` | Password and sign-out actions |
| 17 Empty content | `2:2678` | First-use empty state; filtered empty state uses Clear filters |
| 18 Connection error | `2:2679` | Retry and diagnostic request ID |
| 19 Session expired | `2:2680` | Reauthentication, no token refresh |
| 20 Upload states | `2:2681` | Uploading/processing/ready/failed patterns |

Activity log, loading skeletons, deletion dialogs, validation errors and taxonomy/service editor details reuse these visual patterns. They need working implementations even though not every state has a separate Figma frame. Do not reproduce explanatory design notes as end-user app copy. All illustrative dates are replaced by real data.

## 5. Wire contract and networking

Base URL includes `/api/v1`. Supply it through documented build-time environment/flavor configuration. Fail startup clearly for a missing/invalid URL; no silent production fallback or hidden environment switch. Use HTTPS for release; debug-only local HTTP allowance must not weaken release networking. Prevent bearer attachment to a different host, cross-host redirects, external image requests, pagination links or opened URLs. Set Accept: application/json. Let the HTTP client generate multipart boundaries.

General responses: single resources under data; lists under data/links/meta; authentication result under data; analytics data plus meta. Verify exact schemas before writing parsers. Lists default 20, cap 100. Use page numbers against the configured API origin rather than following arbitrary absolute pagination URLs. Query booleans are strings `0`/`1`; body booleans are JSON booleans. Dates/timestamps are ISO 8601 UTC. Numeric IDs are integers; nullable fields must remain nullable.

Model API errors with message, code, errors and request_id plus X-Request-ID fallback. Map dotted validation keys such as `gallery.0.alt_text` to the correct field/row. Unknown codes/fields show a useful generic error without crashing. Handle 204 with no JSON. Support generic non-JSON proxy errors/413, timeouts, TLS/network failures and parsing failures.

Timeout defaults: connect 15s, ordinary receive/send 30s, upload send/receive 120s (document and keep configurable). Cancel stale list requests and ignore out-of-order completions using request identity. Search debounce around 350ms. Reset pagination on filter/search changes, deduplicate appended IDs, retain already loaded content if a later page fails, and offer retry. Pull-to-refresh first pages and refetch affected detail/list/overview after mutations.

Only automatically retry safe idempotent reads with bounded exponential backoff. Do not automatically retry POST/PATCH/PUT/DELETE after an ambiguous timeout; the server may have committed. Show uncertainty and refetch/reconcile before the user repeats the action. The backend has no request-idempotency contract. For 429 honor Retry-After when available and avoid a busy retry loop.

Do not add persistent offline databases or background write queues. Keep authenticated content/inquiries in session memory and clear on logout. Avoid disk image caching of private information; ready media URLs themselves are public. No analytics SDK or visitor-event ingestion from this admin app.

## 6. Authentication and account lifecycle

- POST `/admin/auth/login` with email, password and a nonidentifying `device_name` such as `Bannan Admin Android`. No hardware ID or Android identifier is required.
- Store only the bearer token, expires_at and minimum necessary account metadata using platform secure storage. Never store the password. Do not put tokens in SharedPreferences, logs, crash breadcrumbs, screenshots committed to Git or plain draft files.
- Configure Android backup exclusions/secure storage according to the selected package's documentation. Handle keystore/decryption/storage failure by clearing invalid credentials and prompting login, not silently falling back to plaintext.
- At launch read token/expiry; if usable, validate GET `/admin/auth/me` before exposing authenticated screens. On network failure allow retry without treating it as an invalid token or showing stale private screens. Local expiry is advisory; server remains authoritative.
- A 401 on a protected request transitions once to expired-session state, cancels protected in-flight operations and blocks further protected calls. Avoid multiple dialogs and login redirect loops. A login 401 shows invalid credentials on the login form. No refresh endpoint exists; never implement an invented refresh request.
- On 403 show owner-access failure and offer sign-out; do not retry with different credentials automatically.
- Explicit logout calls POST `/admin/auth/logout`; logout-all calls `/admin/auth/logout-all` after confirmation. On successful revocation clear credentials and sensitive state. A failed network revocation offers Retry or explicitly described local-only sign-out; local token removal cannot prove server revocation.
- PUT `/admin/auth/password`: current_password, password, password_confirmation. Validate minimum 12 characters, mixed case and numbers, maximum 72 UTF-8 bytes for new password; server validation remains authoritative. Successful password change revokes all tokens and requires login again.
- Owner recovery is a server command; display helpful administrator guidance without adding a reset-email flow.
- Explicit sign-out purges all form state. For unexpected expiry, preserve unsent nonsecret form text only in process memory while reauthentication occurs; clear it on account/server mismatch, app process termination or cancel. Never preserve password fields. Refetch the entity after reauth and offer review before resubmission; no silent overwrite.

## 7. Feature requirements

### 7.1 Overview

Fetch `/admin/analytics/summary` using a shared UTC date range, `/admin/entries?status=draft&per_page=1` for draft meta.total, `/admin/inquiries?status=new&per_page=1` for new inquiry meta.total, and recent `/admin/entries?sort=updated_at&direction=desc&per_page=3`. There is no dashboard-summary endpoint. Independent cards can show independent errors; one failure must not erase other data. Do not count a downloaded first page as a total.

Labels: Page views, Entry views, Contact clicks; no unique visitors, money, conversion percentages or unsupported growth comparisons. Quick create opens a draft project editor. Clearly label the selected UTC reporting range.

### 7.2 Entries: projects and products

CRUD `/admin/entries` and `/admin/entries/{id}`. Projects/products are kind filters over one resource. Admin routes use numeric IDs, not public slugs.

Fields: kind; title max 180; slug max 160 with lowercase hyphen pattern; summary max 500; description Markdown max 50,000; status draft/published/archived; featured; sort_order integer -1,000,000 to 1,000,000; nullable category_id and ready cover_media_id; nullable repository_url/demo_url/external_url max 2,048; technology_ids/contributor_ids each <=30 unique; gallery <=20 with unique media references, alt_text max 500 and integer sort_order. Do not expose an editable SEO override: SEO title/description are derived by the API. Show a computed search preview instead.

Create requires kind/title/summary/description. Default draft; optional slug omitted allows backend generation. Preserve generated slug when title changes. Expose explicit slug editing under Details and show server uniqueness errors. No scheduled publishing in v1; do not show a future-date picker. Let the backend set publication time on publish, and treat returned published_at as read-only in the UI.

Form sections: Basics, Description (Write/Preview), Cover/gallery, Classification/contributors, Links, Visibility/order. Fetch paginated selectors for categories/technologies/team/media; do not assume the first page contains all candidates. Include inactive team profiles in the admin contributor picker and identify them; backend hides them publicly.

Initial edit GET provides nested relation objects: map them to IDs for writes. Never reset an unseen relation when a selector is not loaded. PATCH omitted keys mean unchanged; null clears only nullable values; supplied relationship arrays replace the entire set, [] clears. Implement an explicit unset sentinel/diff builder; nullable Dart values alone cannot represent all three cases. User-edited arrays submit their complete intended set. Set read-only fields aside.

Gallery supports selecting ready media, editing alt text, reordering and removal, converting order to explicit sort_order. Numeric display order suffices where no bulk reorder endpoint exists; do not imply atomic batch reorder. Related data is last-write-wins. Refetch after saves and warn about unsaved navigation; no autosave or offline writes.

Publish review checks required text and ready cover, asks confirmation and PATCHes status=published with any already-saved requirements. Save before review; a failed save must prevent publication. Show server validation/conflicts. Unpublish PATCHes status=draft; archive PATCHes status=archived. Deleting published entries receives 409: offer explicit unpublish then separately confirmed delete, never silently perform both. Deleted content does not delete its media.

### 7.3 Media library and picker

GET `/admin/media` supports state processing/ready/failed/deleting and usage used/unused; no text search parameter exists. Display original_filename, dimensions, bytes, status, usage_count, safe failure_message and ready thumbnail. A ready media picker disables other states and returns numeric IDs. Null URLs during processing are expected.

POST multipart `/admin/media` field name exactly `file`. JPEG/PNG/WebP only; <=10 MiB, <=8,000 pixels each side, <=20 megapixels. Precheck accessible metadata where practical without expensive UI-thread decoding, but trust server validation. Use system picker grants rather than broad storage permission. Handle picker cancellation, lost Android activity and temporary source files; clean upload staging files. Upload one image at a time in v1.

Upload progress describes bytes sent only. 100% transfer does not mean the image is ready. Parse returned media ID and poll GET `/admin/media/{id}`: e.g. 2s, 3s, then 5s, up to 2 minutes while the relevant screen is active. Stop on ready/failed/deleting, logout, navigation/dispose or background. Resume explicitly or on screen foreground. Timeout yields Still processing / Check again, not Failed. No media retry endpoint exists: terminal failure offers a new upload. Do not invent a retry-processing action.

DELETE `/admin/media/{id}` requires confirmation. Used media gets 409; show usage count and explain it must be detached, including references from drafts/inactive profiles/settings. Deleting is a supported durable state: refresh until gone/404 with bounded checks, and never let users attach it. No raw filesystem keys or uploader internals are exposed.

### 7.4 Team and services

Team CRUD `/admin/team-members`: name 120, role_title 180, bio Markdown 10,000, slug, sort_order, nullable ready photo_media_id, is_active and up to 10 label/URL links. Name/role/bio required on create. Activation requires a ready photo. Slug/order use contract constraints. Labels <=80 and URLs <=2,048 with safe HTTP(S) schemes and no embedded credentials. A Website field in the design is a labeled item in links, not a nonexistent website_url member field. Deleting detaches entry contributor relations; confirm impact.

Services CRUD `/admin/services`: title 180, summary 500, description Markdown 20,000, slug, nullable icon_key <=80 with `^[a-z][a-z0-9_-]*$`, sort_order, is_active. Title/summary/description required on create. Offer a small known icon-key picker and safe fallback for unknown returned keys; never execute raw SVG/HTML. Service activation is PATCH is_active, not a separate endpoint.

Both lists support q, sort, direction and active=`0`/`1`; add/update/activation/deletion must update list state only after confirmed success.

### 7.5 Categories and technologies

Categories CRUD: name <=120, slug, nullable description <=1,000, sort_order. Technologies CRUD: name <=120, slug, nullable website_url <=2,048. Follow actual create-required fields in OpenAPI. Use separate tabs and straightforward forms. Both support q and approved sorting. Referenced deletion returns 409; explain detachment rather than inventing force-delete. Preserve the entity on failed deletion.

### 7.6 Site settings

GET then PUT `/admin/site-settings`. Typed singleton; full update must include all required writable fields, including fields in collapsed form sections. Preserve existing data when sections are not edited. Never issue PUT with only the visible first section.

Fields: site_title 180, tagline 500, introduction 10,000, contact_email 254, availability available/limited/unavailable, default_seo_title 180, default_seo_description 500, social_links up to 10 labeled URLs, nullable ready logo_media_id. GET returns logo nested; PUT sends logo_media_id. Changes are immediately public: show a short confirmation near Save. No API credentials or server configuration belong in settings.

### 7.7 Inquiries

GET list/detail and PATCH status/internal_note, DELETE with permanent-deletion confirmation. Status new/read/replied/archived; note nullable <=5,000. Display name, email, subject, message, timestamps. Filters status and inclusive date range only; no invented server full-text search.

Opening detail does not mark read. Make Mark read explicit, or provide the designed Save note & mark read action with a clear state-dependent label. Replied means the owner replied externally, not that the backend sent mail. Open email app with a validated mailto URI; do not include private note and do not automatically change status after launch. No client-side email sending service or reply composer that claims delivery.

Inquiry data is private session memory. No persistent drafts, analytics logging, share button or automatic clipboard copying of message content. Retention is server-controlled; a detail may disappear, so handle 404 and refresh list.

### 7.8 Analytics and audit

Analytics GET summary/daily/top-pages/top-entries/referrers. Date range is inclusive UTC, default last 30 days including today, max 90-day span and no future dates; respect returned retention_days. Use UTC calendar dates for requests even if device display timezone differs. Show a visible UTC label; convert ordinary content timestamps to device locale separately.

summary.data has page_view/entry_view/contact_click integers. daily.data contains date and these three counts, including zero days. Provide an accessible legend, selected-event label, date axis and count axis in actual charts; the Figma bars are illustrative, not a precise chart spec. Empty/all-zero is legitimate, not a loading/error state. No fabricated percentage growth or inferred visitor count.

top-pages: path/total. top-entries: nullable entry_id/total, no entry title returned; show Entry #id, or resolve limited returned IDs without unbounded list fetching. Handle missing/deleted entries as Deleted entry. referrers: nullable referrer_host/total; display null as Direct / unknown and literal other as Other. Top lists default 10, max 50. Aggregates are accepted events and may include retries/bots.

Activity log GET `/admin/audit-events`: paginate and filter action/entity_type/start_date/end_date. Show action, entity type/id, created_at and returned summary.fields names only. Never invent old/new values or a detailed message history the API does not return. No mutation/deletion controls for audits.

## 8. Common form and security behavior

- Inline server field errors, first-error focus/scroll and accessible error announcements. Client validation should match the schema but never replace server validation.
- Disable duplicate submission while pending; retain edits on known validation failure. On ambiguous transport failure refetch and offer reconciliation, not blind resend.
- Confirm destructive actions; distinguish removing a reference from deleting a library object. No optimistic deletion before the server accepts.
- Use a supported Markdown renderer with raw HTML disabled and safe links. Provide text editing and sanitized preview. URL fields require HTTP(S), no credentials; never put bearer tokens into external links.
- Allow accessibility tools, keyboard navigation and text selection where appropriate. Password fields support show/hide and autofill; do not prohibit password managers.
- Do not expose tokens in HTTP logs or include inquiry bodies/internal notes/passwords in diagnostics. Production logs should contain request ID, route template, status and sanitized error category only.
- Clear authenticated repository caches and cancel polling/in-flight work after sign-out. Do not let a late response repopulate a logged-out session; use session generation checks.
- Android backups exclude credentials and sensitive app state; release disables cleartext and debug tooling. Never disable TLS verification globally for a development certificate.

## 9. Phases and acceptance gates

### Phase 0 — Inspect and contract audit

Inspect monorepo, SDK/toolchain, sources and Figma. Record contract hash/changes, screen references, chosen dependency versions and Android package identity (default `com.mahmoudbannan.portfolio_admin`, configurable before distribution). Add scoped instructions, app/shared-package scaffolds and dashboard documentation structure. Do not modify production identifiers after distribution without a migration decision.

Gate: Flutter app and Dart package resolve dependencies and pass initial analyze/tests. Document unavailable Android components explicitly.

### Phase 1 — Foundations and shared API

Implement brand theme/assets, router shell, error/pagination models, DTOs/write payloads and transport, cancellation, safe token attachment and environment loading. Add API fixture tests grounded in OpenAPI examples and schema names. Create core loading/empty/error/form/confirmation widgets.

Gate: Dart package has no Flutter imports; JSON parsing, omitted/null/array encoding, query booleans, 204/non-JSON errors and host protection pass tests. Shell matches phone navigation and handles large text without overflow.

### Phase 2 — Authentication

Implement secure storage, login/me bootstrap, route guards, expiry handling, logout/logout-all/password update and owner-only behavior.

Gate: no protected screen appears before session validation; failed network is distinguished from expired token; all credential flows tested, and device secure-storage behavior verified where an Android runtime exists.

### Phase 3 — First complete vertical slice

Implement media upload/polling/selection and entry create/edit/publish/list. Exercise a real disposable backend with a running queue worker; no production data.

Gate: upload image -> processing -> ready -> create draft -> publish -> verify public GET -> unpublish -> public 404, all driven by dashboard/API flows. Required fields and gallery semantics persist after refetch. Real image URLs work from the emulator/device.

### Phase 4 — Remaining content and settings

Complete full entry advanced fields, team, services, categories/technologies, media management and complete settings PUT.

Gate: create/edit/activate/order/deactivate/delete workflows work, 409 keeps current data intact, selectors paginate, and all writable fields have a usable UI. No first-page-only relationship loss.

### Phase 5 — Inbox, analytics, audit and overview

Implement inquiry lifecycle and email handoff, all five analytics views, read-only activity log, real overview counts/recent entries, partial loading/error behavior.

Gate: figures come from returned data/meta totals; empty stats valid; timezone/date edges verified; opening an inquiry leaves status unchanged; no sending capability or unsupported metric is implied.

### Phase 6 — Accessibility, visual QA and lifecycle

Compare screenshots of main screens against Figma at reference size. Verify 360-wide phone, 412-wide phone, large text at 2x and tablet/wide layout. Verify TalkBack labels/hit targets, keyboard scroll, unsaved/back dialogs, app background/resume, image polling cancellation and session race handling. Use actual content and long/error strings.

Gate: no RenderFlex overflow, clipped form labels/actions or inaccessible critical controls. Keep screenshots with fictional fixtures only, not private data. Record deliberate differences from Figma, such as extra required form sections and real chart axes.

### Phase 7 — CI, Android build and handoff

Add dashboard-specific hosted workflow running locked dependency resolution, format check, analyze, Dart package tests, Flutter widget/unit tests and debug Android APK build. Respect existing backend workflow and path filters, including shared package changes. Run emulator integration job when infrastructure supports it; document separate device checks rather than passing skipped jobs as evidence.

Document build environment, emulator 10.0.2.2 vs physical-device LAN URL, debug HTTP, backend queue/storage URL reachability, login bootstrap via server commands, polling, token expiry, dependencies/licenses and troubleshooting. Never use localhost inside the emulator as if it meant the host. Ensure returned media URLs are reachable too; API reachability alone is insufficient.

Create production flavor/build configuration with HTTPS and private signing instructions. Debug APK is locally reviewable; an unsigned or debug artifact is not a signed release. Do not commit keystore/passwords, distribute or upload to Play Store. Do not claim hosted CI or signed release validation if not run.

Gate: all locally runnable checks pass; APK builds if SDK available; a real-backend Android smoke passes if device/emulator available. Produce `docs/dashboard-completion.md` with exact commands/results, screenshots/visual comparisons, versions and blocked checks.

## 10. Verification requirements

- Shared API parsing against actual supplied shapes; separate create/patch/full PUT payload tests, nested DTOs and optional/null distinctions.
- Auth successful/failed login, expired/revoked token, launch offline, storage failure, 401 concurrency, 403, logout network failure, late-response isolation and password revocation.
- Pagination/filters/search cancellation and stale-response ordering, later-page retry and stable deduplication.
- Forms field lengths/byte limits, dirty state, unknown dotted validation fields, relation replacements, duplicate IDs, full settings preservation, last-write-wins reconciliation.
- Media picker cancellation, 413/422, processing/failed/deleting/null URLs, bounded polling, background/dispose/logout cancellation, ready-only selection and 409 deletion.
- Inquiries status unchanged on GET, safe mailto launch failure, note privacy, deletion and 404 retention cases.
- Analytics UTC boundaries/leap days, inclusive spans, zeros, null referrers/deleted entries and bounded data fetching. Overview totals must use meta.total.
- Widget tests at small width/large text, error/retry/empty paths, unsaved confirmation and accessible labels. Focus tests on behavior; avoid broad fragile snapshots of every widget.
- End-to-end integration with disposable PostgreSQL backend/queue, covering real CRUD and image processing. Use test secrets from secure environment injection, never from checked-in fixtures. Remove only test-created entities after the run; no blanket destructive reset.
- Run `dart format` check, `flutter analyze`, relevant package/app tests and `flutter build apk --debug` using the selected documented toolchain. If code generation exists verify generated output is current.
- Treat backend verification numbers in the old completion report as historical. Test results in the dashboard report must be newly observed.

## 11. Definition of done

- [ ] Android Flutter app is implemented in dashboard/ and uses the real Laravel API.
- [ ] Dart-only shared client and tested DTO/write-payload layer exist in packages/portfolio_api/.
- [ ] Owner auth lifecycle, secure storage and all sign-out/password behaviors work.
- [ ] All content fields, relations, visibility, media states and conflict behavior have working UI.
- [ ] Team, services, taxonomies, full settings, inquiries, analytics and audit are complete.
- [ ] Overview uses API totals and actual entries; no illustrative data ships as live data.
- [ ] Figma visual direction implemented with responsive, accessible native widgets, not screenshots.
- [ ] Error/empty/loading/401/403/409/422/429/network and ambiguous-write states handled.
- [ ] Meaningful tests, formatting/analyze and Android build checked; unavailable runtime checks explicitly listed.
- [ ] Dashboard setup/design/completion documentation and CI updated.
- [ ] Backend and Jaspr remain compatible, with no new product scope or production mutations.
- [ ] No credentials, inquiry data, keystore or insecure release networking committed.

## 12. References to verify during coding

- Flutter architecture: https://docs.flutter.dev/app-architecture/guide
- Flutter architecture recommendations: https://docs.flutter.dev/app-architecture/recommendations
- Flutter accessibility: https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility
- Dio: https://pub.dev/packages/dio
- Riverpod: https://pub.dev/packages/flutter_riverpod
- go_router: https://pub.dev/packages/go_router
- Secure storage and Android backup guidance: https://pub.dev/packages/flutter_secure_storage
- Figma design: https://www.figma.com/design/yFT78AadBUhXvLXYTC7BDX

These are documentation entry points, not pinned dependency versions. Record actual compatible stable versions chosen at implementation time.

## 13. Prompt to start Codex

```text
Read docs/flutter-dashboard-implementation-plan.md completely, then inspect
AGENTS.md, docs/openapi.yaml, docs/backend-completion.md and available backend
integration/setup docs. Implement the complete Flutter Android dashboard and
Dart-only shared API package through every phase. Use the linked Figma file
for visual direction and load applicable Figma skills before design tooling.
Preserve the Laravel backend and Jaspr website. Track progress and verified
results in docs/dashboard-progress.md, run meaningful tests and Android checks,
and finish with docs/dashboard-completion.md. Do not stop after scaffolding,
ship mock data as live data, invent API endpoints, or claim checks you did not
run. Use only disposable development data for integration verification.
```

## Appendix A — Exact administration operation inventory

The following table is generated from the reviewed attached OpenAPI, not inferred from REST naming. Reconcile against the repository contract if it changes.

| Method | Path after `/api/v1` | Operation ID |
| --- | --- | --- |
| GET | `/admin/entries` | `get_admin_entries` |
| POST | `/admin/entries` | `post_admin_entries` |
| GET | `/admin/entries/{id}` | `get_admin_entries_id` |
| PATCH | `/admin/entries/{id}` | `patch_admin_entries_id` |
| DELETE | `/admin/entries/{id}` | `delete_admin_entries_id` |
| GET | `/admin/categories` | `get_admin_categories` |
| POST | `/admin/categories` | `post_admin_categories` |
| GET | `/admin/categories/{id}` | `get_admin_categories_id` |
| PATCH | `/admin/categories/{id}` | `patch_admin_categories_id` |
| DELETE | `/admin/categories/{id}` | `delete_admin_categories_id` |
| GET | `/admin/technologies` | `get_admin_technologies` |
| POST | `/admin/technologies` | `post_admin_technologies` |
| GET | `/admin/technologies/{id}` | `get_admin_technologies_id` |
| PATCH | `/admin/technologies/{id}` | `patch_admin_technologies_id` |
| DELETE | `/admin/technologies/{id}` | `delete_admin_technologies_id` |
| GET | `/admin/team-members` | `get_admin_team_members` |
| POST | `/admin/team-members` | `post_admin_team_members` |
| GET | `/admin/team-members/{id}` | `get_admin_team_members_id` |
| PATCH | `/admin/team-members/{id}` | `patch_admin_team_members_id` |
| DELETE | `/admin/team-members/{id}` | `delete_admin_team_members_id` |
| GET | `/admin/services` | `get_admin_services` |
| POST | `/admin/services` | `post_admin_services` |
| GET | `/admin/services/{id}` | `get_admin_services_id` |
| PATCH | `/admin/services/{id}` | `patch_admin_services_id` |
| DELETE | `/admin/services/{id}` | `delete_admin_services_id` |
| GET | `/admin/site-settings` | `get_admin_site_settings` |
| PUT | `/admin/site-settings` | `put_admin_site_settings` |
| POST | `/admin/auth/login` | `post_admin_auth_login` |
| GET | `/admin/auth/me` | `get_admin_auth_me` |
| POST | `/admin/auth/logout` | `post_admin_auth_logout` |
| POST | `/admin/auth/logout-all` | `post_admin_auth_logout_all` |
| PUT | `/admin/auth/password` | `put_admin_auth_password` |
| POST | `/admin/media` | `post_admin_media` |
| GET | `/admin/media` | `get_admin_media` |
| GET | `/admin/media/{id}` | `get_admin_media_id` |
| DELETE | `/admin/media/{id}` | `delete_admin_media_id` |
| GET | `/admin/inquiries` | `get_admin_inquiries` |
| GET | `/admin/inquiries/{id}` | `get_admin_inquiries_id` |
| PATCH | `/admin/inquiries/{id}` | `patch_admin_inquiries_id` |
| DELETE | `/admin/inquiries/{id}` | `delete_admin_inquiries_id` |
| GET | `/admin/audit-events` | `get_admin_audit_events` |
| GET | `/admin/analytics/summary` | `get_admin_analytics_summary` |
| GET | `/admin/analytics/daily` | `get_admin_analytics_daily` |
| GET | `/admin/analytics/top-pages` | `get_admin_analytics_top_pages` |
| GET | `/admin/analytics/top-entries` | `get_admin_analytics_top_entries` |
| GET | `/admin/analytics/referrers` | `get_admin_analytics_referrers` |
