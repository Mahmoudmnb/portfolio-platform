# Flutter handoff: website content API updates

Updated 2026-11-23. These changes are implemented in backend source and require the new migration on the target server. They have not been deployed. The approved dependency update also raises Laravel to 13.43.0 and updates six existing Symfony packages to clear the security audit; see the progress record for exact versions. Keep the existing base URL configurable; the configured website target is `https://api.mahmoudbannan.com/api/v1`, while local development uses `http://HOST_REACHABLE_ADDRESS:8000/api/v1`.

Give the Flutter team this file, [request examples](flutter-api-examples.md), [implementation checklist](flutter-implementation-checklist.md), and the repository's [OpenAPI contract](../../docs/openapi.yaml). The [general integration guide](../../docs/api-integration.md) covers existing authentication, uploads, analytics and pagination.

## Compatibility decisions

| Proposed in the website brief | Implemented contract |
| --- | --- |
| `/site` | Existing `/site-settings`, extended |
| `/projects` and `/projects/{slug}` | Existing `/entries?kind=project` and `/entries/{slug}` |
| `kind=mobile_app` | `kind=project` plus optional `project_type=mobile_app` |
| `/project-categories` | Existing `/categories`; `/technologies` is unchanged |
| `site_name`, `short_description` | Existing `site_title`, `introduction` |
| Service `short_description`, `icon`, `cover_image` | `summary`, `icon_key`, `cover` |
| Navigation `path` | `url`, accepting a safe local path or HTTP(S) URL |
| Entry `is_published` | Existing `status`: `draft`, `published`, `archived` |
| Team/service `is_published` | Existing `is_active` boolean |
| Inquiry `in_progress`, `closed` | Existing `read`, `archived`; statuses remain `new/read/replied/archived` |
| Dedicated page SEO route | Inline `data.seo` in each page response |

Existing routes, required fields, owner-only authentication, and pagination remain supported. There are no duplicate `/site` or `/projects` API routes. Categories and technologies retain their existing visibility rule: public lists contain only those used by a currently published entry. They have no separate publication toggle.

## New page editor

All paths below follow `/api/v1`.

| Method | Path | Behavior |
| --- | --- | --- |
| GET | `/pages/{page_key}` | Published page, content and inline SEO; no token |
| GET | `/admin/pages` | Saved pages, including drafts; `{data: [...]}` without pagination |
| GET | `/admin/pages/{page_key}` | Saved page for editing; owner token required |
| PUT | `/admin/pages/{page_key}` | Create or replace a page; returns 200 for both |

The fixed keys are `home`, `about`, `services`, `projects`, `contact`. A missing/draft page returns 404 publicly. A missing page returns 404 in the editor too; initialize it from the examples. Unknown keys return 404. No page create/delete endpoint or flexible page builder is needed.

The PUT body requires `status`, `content`, `seo`. Set `status` to `draft` or `published`. `content` and `seo` replace their entire objects; include everything the editor should retain. Optional `og_image_media_id` and `featured_entry_ids` preserve existing references when omitted; use `null` to clear the image and `[]` to clear featured entries. The returned admin page contains those IDs and its status. Public pages omit them.

Pages currently have a single saved version. Saving `draft` also hides a previously published page; there is no separate unpublished revision alongside the published version. Preview the authenticated admin response. Concurrent edits use last write wins; refetch after save.

### Page content

| Page key | Required section | Optional sections |
| --- | --- | --- |
| home | `hero` | `highlights`, `service_cards`, `value_propositions`, `process_steps`, `metrics`, `cta` |
| about | `intro` | `highlights`, `principles`, `journey_phases`, `philosophy_items`, `specializations`, `cta` |
| services | `intro` | `highlights`, `capabilities`, `solutions`, `delivery_steps`, `cta` |
| projects | `intro` | `highlights`, `delivery_steps`, `cta` |
| contact | `intro` | `form`, `cta` |

Every page also accepts `section_headings`: an object keyed by that page's optional list section names or `featured_projects`, `team_members`, `services`. Each heading requires `title` (500); optional `eyebrow` (180) and `description` (5,000) may be null.

`hero` and `intro` require `title` (500). Optional fields: `eyebrow` (180), `highlighted_text` (500), `description` (5,000), and nullable `primary_cta`/`secondary_cta`. Each supplied CTA object requires `label` (80) and `url` (2,048).

List sections accept at most 30 objects. Each requires `title` (180) and may include `description` (5,000), `icon_key` (80), `label`, `value`, `period` (180 each), `url` (2,048), `sort_order`, `is_visible`. Optional text fields may be null. All ordering integers are between -1,000,000 and 1,000,000. Defaults are visible and order zero. Public responses omit hidden items and sort by order, preserving supplied order on ties. Admin responses retain hidden items. Metrics are editorial text; do not invent business figures.

`cta` and settings `shared_cta` are nullable objects. When supplied as an object they require `title` (500), `button_label` (80), `button_url` (2,048); optional `eyebrow` (180), `description` (5,000) may be null.

`contact.content.form` may contain nullable strings (1,000 each): `name_label`, `email_label`, `subject_label`, `message_label`, `submit_label`, `sending_label`, `success_message`, `error_message`, `confidentiality_note`. `subject_options` accepts up to 20 nonempty strings (180 each). These options guide the UI; the inquiry API still accepts any subject within its length limit.

The API rejects unknown top-level and nested keys with 422. Omitted optional content keys remain absent in responses; keep frontend fallbacks. There is no locale selector or translation system: `data.locale` is `en`.

### Featured content and reusable resources

Send `featured_entry_ids` in the desired order, at most 30 distinct existing entry IDs. A public page's `featured_projects` resolves only published entries and hides an entry immediately when it is unpublished. Admin responses retain drafts. Clearing/reordering this selection does not change each entry's global `featured` flag. Deleting an unpublished entry automatically removes its page reference.

Fetch reusable team profiles and service records through `/team-members` and `/services`. They are not copied into page JSON. Use `/entries?kind=project&featured=1` for the original global featured feed, or `page.featured_projects` for an explicit page selection.

### Page SEO

`seo` requires `title` (180), `meta_description` (500). Optional nullable fields are `canonical_url` (absolute HTTP(S), 2,048), `og_title`/`twitter_title` (180), `og_description`/`twitter_description` (500). Optional booleans `robots_index` and `robots_follow` default to true. Omitted canonical/Twitter fields return null. Omitted Open Graph title/description use title/meta description; explicitly supplied null stays null.

Set `og_image_media_id` beside `seo` in the PUT body. Responses resolve it as `seo.og_image`. Use it as the Twitter image fallback as well; there is no separate Twitter image upload field. Public responses expose ready images only. Jaspr should fetch this data during SSR so metadata is present in initial HTML.

## Extended existing editors

### Site settings

Keep sending the existing required settings fields in PUT `/admin/site-settings`: `site_title` (180), `tagline` (500), `introduction` (10,000), `contact_email` (254, email), `availability` (`available/limited/unavailable`), `default_seo_title` (180), `default_seo_description` (500), `social_links` (array, at most 10).

New optional fields:

| Field | Validation / output |
| --- | --- |
| `phone`, `location`, `availability_text` | Nullable strings, 255 each |
| `logo_light_media_id`, `logo_dark_media_id`, `favicon_media_id` | Nullable ready image IDs; output `logo_light`, `logo_dark`, `favicon` |
| `navigation` | Up to 20 link objects |
| `footer` | Nullable object: description (5,000), copyright_text (500), established_year (1900–2100), footer_links/practice_links (20 each) |
| `shared_cta` | Nullable CTA as described above |
| `legal_links` | Nullable object: privacy_policy_url, terms_url, security_policy_url; each nullable safe link, 2,048 |

Navigation/footer links require `label` (80), `url` (2,048). Optional `sort_order`, `is_visible`, `open_in_new_tab` are supported. Social links keep absolute HTTP(S) URLs and gain optional `platform` (40, lowercase identifier) and `is_visible`. Public link arrays are ordered and exclude hidden items. Missing link flags mean visible/same tab/order zero.

New settings fields preserve current values when omitted by older clients. Supplied arrays/objects replace their whole value. Use `[]` for empty link lists, `null` for nullable objects/fields. Settings changes become public immediately. The frontend should calculate the current copyright year rather than storing a fixed year in text.

### Projects / entries

Keep the existing entry editor and add:

| Field | Validation |
| --- | --- |
| `project_type` | Nullable: mobile_app, web_app, desktop_app, platform; independent of kind |
| `challenge`, `solution` | Nullable strings, 10,000 each; detail/admin responses |
| `outcomes` | Up to 30 nonempty strings, 1,000 each; detail/admin responses |
| `platforms` | Up to 6 distinct values: android, ios, web, windows, macos, linux |
| `store_links` | Up to 10 objects requiring platform (same enum), label (80), absolute HTTP(S) url (2,048) |
| `seo_title`, `seo_description` | Nullable overrides, 180/500; null falls back to title/summary in responses |

Summary lists include `project_type`, `platforms`, `store_links`, effective SEO. Full description/gallery/contributors/challenge/solution/outcomes require detail or admin responses. Existing gallery and category/technology/contributor relations are unchanged. The gallery remains image-only.

Public `/entries` additionally supports `project_type` and `sort=sort_order` or `sort=-published_at`, with ID ascending as tie-breaker. Without sort, the original featured descending, order ascending, publication descending, ID ascending behavior remains. Use `featured=1` or `featured=0`, not the literal query strings `true/false`. Admin sorts remain the existing `sort` plus `direction` contract.

### Services and team

Services gain `features` (up to 30 strings, 1,000 each), nullable `cover_media_id`, `cta_label` (80), `cta_url` (safe link, 2,048), `seo_title` (180), `seo_description` (500). Responses resolve `cover`; SEO null falls back to title/summary. Existing `title`, `summary`, `description`, `icon_key`, `sort_order`, `is_active` remain. Null clears nullable fields; [] clears features.

Team member links gain `is_visible` (default true). Admin responses include hidden links; public profiles and public entry contributors exclude them. Team activation still requires a ready photo. No private employee fields or new administrator roles were added.

`icon_key` accepts a lowercase identifier matching `^[a-z][a-z0-9_-]*$`; Flutter/Jaspr should map recognized keys to their own icons and use a fallback for unknown keys. The backend does not accept executable SVG/HTML icon definitions.

### Media

Multipart POST `/admin/media` additionally accepts optional nullable `alt_text` (500). New PATCH `/admin/media/{id}` accepts exactly `{ "alt_text": "..." }`; null clears it. Responses expose this field as `alt`.

All media objects gain `alt`, `file_size` (processed display bytes, nullable for older media), `display_mime_type: image/webp`. Public `mime_type` is `image/webp`; existing admin `mime_type`/`bytes` retain the uploaded source's type/size. `file_size` is separate from source `bytes`. Width/height describe the display image, and thumbnail URL fits within 480×480 without upscaling. Existing uploads do not need re-uploading just to set alt text.

Uploads still require JPEG/PNG/WebP, at most 10 MiB, 8,000 pixels per side, 20 megapixels. Poll until ready before attaching. New logo, service and page SEO references participate in usage counts and deletion/orphan-cleanup protection, including draft pages and inactive services. Referenced deletion returns 409. A deleting image cannot be edited or attached.

### Contact inquiries

POST `/inquiries` gains optional nullable `source_page` (255): a local path such as `/contact`. Queries, fragments, full URLs and double leading slashes are rejected. The existing required fields and generic 201 acknowledgment remain unchanged. No public inquiry ID, content or status is returned. Name/email/subject/message limits remain 120/254/180/10,000. Leave the optional `website` honeypot empty. Do not automatically resubmit after ambiguous network failures; requests have no deduplication key.

The server may enable generic business inbox alerts through `INQUIRY_NOTIFICATION_EMAIL`. This address is deployment configuration, separate from the public contact email. Queued alerts contain no visitor name, email, subject or message; the owner signs in to read the inquiry. Persistence succeeds without SMTP. A dispatch failure leaves the inquiry stored and returns the acknowledgment; the operator can requeue its alert with `php artisan app:retry-inquiry-notification INQUIRY_ID`. Normal queued mail failures retry up to three times, then use the existing failed-job operations. Completed jobs skip already-notified/deleted inquiries. Delivery is at least once: a crash after SMTP acceptance can result in a duplicate alert.

## Shared client behavior

Keep unknown JSON fields forward-compatible. Send `Accept: application/json` and JSON content type except uploads. All mutations require the existing owner bearer token except inquiry/event submission. On 401 reauthenticate; on 422 map dotted errors to editor fields; on 409 refetch references; on 429 honor Retry-After. Keep request IDs for diagnostics without logging request bodies, tokens or inquiry contents.

All API responses continue to use `Cache-Control: no-store, private`. No ETag/CDN API cache was introduced; publishing/unpublishing is visible on the next request. Configure storage/CDN cache independently for immutable media. Render content as text or safe Markdown with raw HTML disabled. Safe content links allow absolute HTTP(S) without credentials or local paths matching `^/(?!/)[a-zA-Z0-9/_-]*$`; contact email/phone are text fields for the UI to render appropriately.

No Flutter, shared Dart client, or Jaspr source was modified in this backend task. Staging deployment, real inbox delivery, editorial copy, and client UI/SSR acceptance remain release tasks. The referenced `our_website.zip` was not supplied here, so sample content is for integration and must be reviewed before publication. Optional testimonials, FAQs and blog features remain outside scope.
