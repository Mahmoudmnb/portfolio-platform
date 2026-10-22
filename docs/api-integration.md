# Integrating Jaspr and Flutter

The contract is [OpenAPI 3.1](openapi.yaml). The document uses JSON syntax, which is also valid YAML 1.2. API base URLs include `/api/v1`: development `http://localhost:8000/api/v1`, Android emulator/LAN `http://HOST_REACHABLE_ADDRESS:8000/api/v1`, production `https://api.example.test/api/v1` (replace this placeholder). Serve the Jaspr client separately. Configure its exact origins in SITE_ORIGINS. Native Flutter does not depend on CORS.

Send `Accept: application/json`; use `Content-Type: application/json` except multipart uploads. A single resource is under `data`. Collections have `data`, `links` and `meta`, including current_page, per_page, last_page and total. Default page size is 20, maximum 100. Follow `links.next` or increment page until last_page. Treat an empty data array as an empty state, not an error. Show a loading indicator while awaiting a request and a retry action on network/5xx errors. On 422 map `errors` keys to form fields; on 429 honor Retry-After. Keep X-Request-ID for diagnostics without recording private payloads.

## Public content flow

Fetch `/site-settings`, then paginated `/entries`, `/team-members` and `/services`. Use `/entries/{slug}` for details; list entries intentionally omit description/gallery/contributors. `kind=project` and `kind=product` share the same API; products have external links and no shopping functionality. Draft/archived entries and inactive profiles/services are absent, including guessed detail slugs. Taxonomies appear only when attached to currently visible entries. Inactive contributors are omitted from public entry details. Always handle 404 after following an old link.

```sh
API_BASE=http://localhost:8000/api/v1
curl -fsS -H 'Accept: application/json' "$API_BASE/site-settings"
curl -fsS -G -H 'Accept: application/json' "$API_BASE/entries" \
  --data-urlencode 'kind=project' --data-urlencode 'technology=flutter' \
  --data-urlencode 'q=offline notes' --data-urlencode 'per_page=20' --data-urlencode 'page=1'
curl -fsS -H 'Accept: application/json' "$API_BASE/entries/field-notes"
```

Entry filters: kind, category (slug), technology (slug), featured (`0`/`1`), q (at most 100 characters), page and per_page. Search is a literal case-insensitive title/summary substring; `%` and `_` are literal. Public ordering: featured first, sort_order ascending, published_at descending, ID ascending. Team/services/categories sort by sort_order then ID; technologies by ID. Unknown/invalid query fields return 422.

Markdown descriptions/bios are untrusted text. Disable raw HTML in Markdown renderers and sanitize rendered output. Never inject them with unsafe innerHTML. Links are HTTP(S) and contain no credentials; the API never fetches submitted URLs. `seo_title`/`seo_description` derive from entry title/summary and are not editable override fields.

Media `url` and `thumbnail_url` are absolute URLs derived from configured storage. Render thumbnail in grids and display URL in detail views; use supplied dimensions to reserve layout space. Public resources include ready media only. Display images retain original dimensions and are re-encoded WebP; thumbnails fit within 480×480 without upscaling. Do not synthesize storage keys or concatenate API paths with media URLs. Local media requires `storage:link` and a MEDIA_URL reachable by the device. Known public media URLs remain accessible after unpublishing; this API is not a private-file vault.

All API content currently uses `Cache-Control: no-store, private`; do not maintain stale client caches across publication changes. Media bytes may use storage/CDN caching independently. Unpublish takes effect on the next API fetch.

## Owner Flutter flow

Create the owner through the server console, never through public registration. Login with email, password and device_name. Store the returned token in secure device storage (Android Keystore-backed encrypted storage or the platform equivalent). Use only `Authorization: Bearer TOKEN_PLACEHOLDER`. Never send credentials or owner tokens from Jaspr public code, URLs, analytics, crash reports or logs.

```sh
curl -sS -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' \
  "$API_BASE/admin/auth/login" \
  --data '{"email":"OWNER_EMAIL","password":"OWNER_PASSWORD","device_name":"Flutter dashboard"}'
# Use a secret-aware client in practice; do not enter real passwords into shell history.
curl -sS -H 'Accept: application/json' -H 'Authorization: Bearer TOKEN_PLACEHOLDER' \
  "$API_BASE/admin/auth/me"
curl -sS -X POST -H 'Accept: application/json' -H 'Authorization: Bearer TOKEN_PLACEHOLDER' \
  -F 'file=@/path/to/example.png' "$API_BASE/admin/media"
```

Tokens expire seven days after login by default; there is no refresh endpoint. On 401 clear the token and reauthenticate. Disabled owner requests return 403. Logout revokes the current token; logout-all revokes all devices. PUT auth/password requires current_password, password (12+ characters, mixed case and numbers, at most 72 UTF-8 bytes) and password_confirmation; success is 200 with a reauthentication message and revokes all tokens. All logout/password paths require a valid enabled owner.

Upload first: POST `/admin/media` returns 201 with `status=processing` under normal database-queue operation. Poll GET `/admin/media/{id}` with bounded backoff (for example 1, 2, 4, 8 seconds) until ready/failed, with a user-visible timeout. A dispatch failure returns a persisted failed state. Do not attach processing, failed or deleting media. A failed upload should be uploaded again. Uploads allow actual decoded JPEG/PNG/WebP only, up to 10 MiB, 8000 pixels per side and 20 megapixels; filenames do not determine type. SVG/GIF and non-images are rejected.

Create an entry with POST `/admin/entries`, initially draft. A published entry needs ready cover_media_id plus required text; status published assigns published_at when omitted and rejects future dates. PATCH to draft or archived immediately hides it. DELETE a published entry returns 409; unpublish first. An unused image DELETE returns 204 after a durable deletion state; storage removal is asynchronous. Referenced media cannot be deleted even when content is draft/inactive. Deleting content never automatically deletes media.

```sh
curl -sS -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer TOKEN_PLACEHOLDER' "$API_BASE/admin/entries" \
  --data '{"kind":"project","title":"Field notes","summary":"An offline notebook","description":"Untrusted **Markdown**"}'
curl -sS -X PATCH -H 'Accept: application/json' -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer TOKEN_PLACEHOLDER' "$API_BASE/admin/entries/ENTRY_ID" \
  --data '{"cover_media_id":123,"status":"published","technology_ids":[1],"gallery":[{"media_id":123,"alt_text":"Notebook screen","sort_order":0}]}'
```

Replace ENTRY_ID and numeric example references with returned IDs. Numeric admin IDs differ from public slugs. Slugs generate once with a collision suffix; editing title preserves slug. Supplied duplicate slugs return 422. PATCH omission leaves a field/relation unchanged. Explicit null clears only nullable fields such as cover_media_id, category_id and URLs. `technology_ids`, `contributor_ids`, gallery, member links and settings social_links replace the complete set when supplied; `[]` clears. Null arrays and duplicates are rejected. Maximum gallery 20, technologies/contributors 30, member/social links 10. Settings PUT requires the full typed required schema; there are no arbitrary settings keys. Team activation requires a ready photo. Concurrent editing is last-write-wins in v1; refetch after successful changes.

Admin lists add status for entries, active (`0`/`1`) for team/services, and sort/direction as specified in OpenAPI. Categories/technologies support q by name. Media supports state and usage=used/unused. Inquiry list uses status/start_date/end_date and newest submission first; GET never marks read. PATCH inquiries accepts status/internal_note only. `replied` means the owner replied elsewhere; the API sends no reply email. Audit events contain field names and entity IDs, never inquiry values or passwords.

## Contact form

POST name/email/subject/message to `/inquiries`. Optional website is a hidden honeypot field; leave it empty. Filled honeypots receive the same acknowledgment and store nothing. Render the stable generic success message; no inquiry ID/content is returned. The backend stores accepted messages without SMTP. It does not deduplicate retries, so avoid resubmitting automatically after an ambiguous timeout. There is no public inquiry list/detail API.

```sh
curl -sS -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' \
  "$API_BASE/inquiries" \
  --data '{"name":"Fictional Visitor","email":"visitor@example.test","subject":"Hello","message":"A fictional example inquiry.","website":""}'
```

## Aggregate analytics

Jaspr may POST page_view, entry_view or contact_click to `/analytics/events`; Flutter administration must not send visitor events. Respect applicable consent requirements. Send only event_name, path, optional entry_id for entry_view, and optional HTTP(S) referrer. Omit entry_id for other events. Paths allowed: `/`, `/projects`, `/products`, `/about`, `/contact`, `/entries/{slug}`, `/team`, `/team/{slug}`, `/services`, `/services/{slug}`. An optional trailing slash normalizes away. Never send query strings, fragments, absolute URLs, arbitrary page paths, user identifiers, device metadata or timestamps. Do not send sensitive query data inside the optional referrer; only its normalized host is persisted. Own configured website hosts are discarded. Referrers above the configurable daily distinct-host ceiling aggregate under `other`.

```sh
curl -sS -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' \
  "$API_BASE/analytics/events" --data '{"event_name":"page_view","path":"/about"}'
curl -sS -H 'Accept: application/json' -H 'Authorization: Bearer TOKEN_PLACEHOLDER' \
  "$API_BASE/admin/analytics/daily?start_date=2026-10-01&end_date=2026-10-21"
```

A 202 acknowledgment means the accepted request was handled. ANALYTICS_ENABLED=false still validates and returns 202 without persisting. Counts are accepted events and include possible bots/retries; do not label them unique people or conversion rates. Reporting ranges are inclusive UTC dates, default the last 30 days including today, maximum 90 days and no future dates. Daily reports fill zero dates. Top lists accept limit (default 10, max 50); page/per_page are rejected for reports. Analytics defaults to 90-day retention; older dates can return zero after pruning. Deleted entry dimensions become null, but historical counts and their stable aggregate keys survive. A null referrer means direct/own-site/unspecified, not an identified person.

Initial limits: public reads 120/min/IP, login 5/min/account+IP and 30/min/IP, inquiries 3/hour/IP, analytics 60/min/IP, uploads 20/min/owner, other admin operations 120/min/owner. They are configurable. Shared networks share public limits. CORS restricts browser access but is not authentication or an abuse-control boundary. Proxy-generated 413/502 errors may be non-JSON; handle content type and use a generic message. API-generated errors always use the documented error envelope.

## Actual response examples

The following fictional fixtures come from the PostgreSQL HTTP feature tests and are validated against OpenAPI. IDs and timestamps are examples, not deployment constants. The login token is replaced with a placeholder.

### Entry list

```json
{
  "data": [
    {
      "id": 1,
      "kind": "project",
      "slug": "field-notes",
      "title": "Field notes",
      "summary": "A fictional offline notebook.",
      "featured": false,
      "sort_order": 0,
      "repository_url": null,
      "demo_url": null,
      "external_url": null,
      "cover": {
        "id": 1,
        "width": 20,
        "height": 20,
        "url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/display.webp",
        "thumbnail_url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/thumbnail.webp"
      },
      "category": {
        "id": 1,
        "slug": "mobile",
        "name": "Mobile",
        "description": null,
        "sort_order": 0,
        "created_at": "2026-10-21T06:00:00.000000Z",
        "updated_at": "2026-10-21T06:00:00.000000Z"
      },
      "technologies": [
        {
          "id": 1,
          "slug": "flutter",
          "name": "Flutter",
          "website_url": null,
          "created_at": "2026-10-21T06:00:00.000000Z",
          "updated_at": "2026-10-21T06:00:00.000000Z"
        }
      ],
      "published_at": "2026-10-21T06:00:00.000000Z",
      "seo_title": "Field notes",
      "seo_description": "A fictional offline notebook.",
      "created_at": "2026-10-21T06:00:00.000000Z",
      "updated_at": "2026-10-21T06:00:00.000000Z"
    }
  ],
  "links": {
    "first": "http://localhost:8000/api/v1/entries?page=1",
    "last": "http://localhost:8000/api/v1/entries?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 1,
    "links": [
      {
        "url": null,
        "label": "&laquo; Previous",
        "page": null,
        "active": false
      },
      {
        "url": "http://localhost:8000/api/v1/entries?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": null,
        "label": "Next &raquo;",
        "page": null,
        "active": false
      }
    ],
    "path": "http://localhost:8000/api/v1/entries",
    "per_page": 20,
    "to": 1,
    "total": 1
  }
}
```

### Entry detail

```json
{
  "data": {
    "id": 1,
    "kind": "project",
    "slug": "field-notes",
    "title": "Field notes",
    "summary": "A fictional offline notebook.",
    "featured": false,
    "sort_order": 0,
    "repository_url": null,
    "demo_url": null,
    "external_url": null,
    "description": "An **offline** notebook.",
    "gallery": [
      {
        "media": {
          "id": 1,
          "width": 20,
          "height": 20,
          "url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/display.webp",
          "thumbnail_url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/thumbnail.webp"
        },
        "alt_text": "Notebook example",
        "sort_order": 0
      }
    ],
    "contributors": [
      {
        "id": 1,
        "slug": "fictional-engineer",
        "name": "Fictional Engineer",
        "role_title": "Developer",
        "bio": "Fictional team profile.",
        "sort_order": 0,
        "photo": {
          "id": 1,
          "width": 20,
          "height": 20,
          "url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/display.webp",
          "thumbnail_url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/thumbnail.webp"
        },
        "links": [],
        "created_at": "2026-10-21T06:00:00.000000Z",
        "updated_at": "2026-10-21T06:00:00.000000Z"
      }
    ],
    "cover": {
      "id": 1,
      "width": 20,
      "height": 20,
      "url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/display.webp",
      "thumbnail_url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/thumbnail.webp"
    },
    "category": {
      "id": 1,
      "slug": "mobile",
      "name": "Mobile",
      "description": null,
      "sort_order": 0,
      "created_at": "2026-10-21T06:00:00.000000Z",
      "updated_at": "2026-10-21T06:00:00.000000Z"
    },
    "technologies": [
      {
        "id": 1,
        "slug": "flutter",
        "name": "Flutter",
        "website_url": null,
        "created_at": "2026-10-21T06:00:00.000000Z",
        "updated_at": "2026-10-21T06:00:00.000000Z"
      }
    ],
    "published_at": "2026-10-21T06:00:00.000000Z",
    "seo_title": "Field notes",
    "seo_description": "A fictional offline notebook.",
    "created_at": "2026-10-21T06:00:00.000000Z",
    "updated_at": "2026-10-21T06:00:00.000000Z"
  }
}
```

### Team members

```json
{
  "data": [
    {
      "id": 1,
      "slug": "fictional-engineer",
      "name": "Fictional Engineer",
      "role_title": "Developer",
      "bio": "Fictional team profile.",
      "sort_order": 0,
      "photo": {
        "id": 1,
        "width": 20,
        "height": 20,
        "url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/display.webp",
        "thumbnail_url": "http://localhost:8000/storage/f65b92de-4495-45a9-961c-541a12e5a8d8/thumbnail.webp"
      },
      "links": [],
      "created_at": "2026-10-21T06:00:00.000000Z",
      "updated_at": "2026-10-21T06:00:00.000000Z"
    }
  ],
  "links": {
    "first": "http://localhost:8000/api/v1/team-members?page=1",
    "last": "http://localhost:8000/api/v1/team-members?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 1,
    "links": [
      {
        "url": null,
        "label": "&laquo; Previous",
        "page": null,
        "active": false
      },
      {
        "url": "http://localhost:8000/api/v1/team-members?page=1",
        "label": "1",
        "page": 1,
        "active": true
      },
      {
        "url": null,
        "label": "Next &raquo;",
        "page": null,
        "active": false
      }
    ],
    "path": "http://localhost:8000/api/v1/team-members",
    "per_page": 20,
    "to": 1,
    "total": 1
  }
}
```

### Site settings

```json
{
  "data": {
    "id": 1,
    "site_title": "Portfolio",
    "tagline": "Software and creative engineering",
    "introduction": "Welcome to our portfolio.",
    "contact_email": "contact@example.test",
    "availability": "available",
    "default_seo_title": "Portfolio",
    "default_seo_description": "Projects, products and services.",
    "social_links": [],
    "logo": null,
    "created_at": "2026-10-21T06:00:00.000000Z",
    "updated_at": "2026-10-21T06:00:00.000000Z"
  }
}
```

### Validation error

```json
{
  "message": "The given data was invalid.",
  "code": "VALIDATION_ERROR",
  "errors": {
    "per_page": [
      "The per page field must be between 1 and 100."
    ]
  },
  "request_id": "6988b0a3-ee95-4f80-ad25-f494f1eb44a8"
}
```

### Owner login

```json
{
  "data": {
    "token": "TOKEN_PLACEHOLDER",
    "token_type": "Bearer",
    "expires_at": "2026-10-28T09:00:00.000000Z",
    "user": {
      "id": 1,
      "name": "Example Owner",
      "email": "owner@example.test"
    }
  }
}
```

### Accepted analytics event

```json
{
  "data": {
    "accepted": true
  }
}
```

### Analytics summary

```json
{
  "data": {
    "page_view": 1,
    "entry_view": 0,
    "contact_click": 0
  },
  "meta": {
    "start_date": "2026-09-22",
    "end_date": "2026-10-21",
    "retention_days": 90
  }
}
```
