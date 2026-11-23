# Website Public API Documentation

This guide explains the public endpoints that the website can use. These endpoints do not need an administrator token.

## Basic setup

Local API base URL:

```text
http://localhost:8000/api/v1
```

Production API base URL:

```text
https://api.your-domain.com/api/v1
```

Replace the production example with the real backend domain. Send these headers with JSON requests:

```http
Accept: application/json
Content-Type: application/json
```

`Content-Type` is only required when sending a JSON body. Public endpoints must never receive an administrator token.

## Response format

A single item is returned inside `data`:

```json
{
  "data": {
    "id": 1,
    "title": "Example"
  }
}
```

A list is returned inside `data` with pagination information:

```json
{
  "data": [],
  "links": {
    "first": "http://localhost:8000/api/v1/entries?page=1",
    "last": "http://localhost:8000/api/v1/entries?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 20,
    "total": 0
  }
}
```

An error has this format:

```json
{
  "message": "The given data was invalid.",
  "code": "VALIDATION_ERROR",
  "errors": {
    "email": ["The email field must be a valid email address."]
  },
  "request_id": "6988b0a3-ee95-4f80-ad25-f494f1eb44a8"
}
```

Keep `request_id` when reporting a backend problem.

The examples below show the fields the website normally needs. Paginated responses can also contain additional Laravel navigation fields inside `meta`.

## Endpoints summary

| Method | URL | Simple purpose |
| --- | --- | --- |
| `GET` | `/entries` | Get published projects and products |
| `GET` | `/entries/{slug}` | Get one published project or product |
| `GET` | `/categories` | Get visible entry categories |
| `GET` | `/technologies` | Get visible entry technologies |
| `GET` | `/team-members` | Get active team members |
| `GET` | `/team-members/{slug}` | Get one active team member |
| `GET` | `/services` | Get active services |
| `GET` | `/services/{slug}` | Get one active service |
| `GET` | `/site-settings` | Get public website information and links |
| `POST` | `/inquiries` | Send the contact form |
| `POST` | `/analytics/events` | Record a simple website event |

---

## 1. Get projects and products

### What does it do?

Returns published portfolio entries. Use it for the projects page, products page, or featured work on the home page. Draft and archived entries are never returned.

### URL

```http
GET /api/v1/entries
```

### Body

No body.

Optional query parameters:

| Parameter | Example | Meaning |
| --- | --- | --- |
| `kind` | `project` or `product` | Return only projects or products |
| `category` | `mobile` | Filter by category slug |
| `technology` | `flutter` | Filter by technology slug |
| `featured` | `1` or `0` | Return featured or non-featured entries |
| `q` | `offline notes` | Search the title and summary; maximum 100 characters |
| `page` | `1` | Page number |
| `per_page` | `20` | Items per page, from 1 to 100 |

Example:

```http
GET /api/v1/entries?kind=project&featured=1&per_page=6&page=1
```

### Response

Status: `200 OK`

```json
{
  "data": [
    {
      "id": 1,
      "kind": "project",
      "slug": "field-notes",
      "title": "Field Notes",
      "summary": "An offline notebook application.",
      "featured": true,
      "sort_order": 0,
      "repository_url": "https://github.com/example/field-notes",
      "demo_url": null,
      "external_url": null,
      "cover": {
        "id": 10,
        "width": 1600,
        "height": 900,
        "url": "https://api.your-domain.com/storage/example/display.webp",
        "thumbnail_url": "https://api.your-domain.com/storage/example/thumbnail.webp"
      },
      "category": {
        "id": 2,
        "slug": "mobile",
        "name": "Mobile",
        "description": null,
        "sort_order": 0,
        "created_at": "2026-10-20T10:00:00.000000Z",
        "updated_at": "2026-10-20T10:00:00.000000Z"
      },
      "technologies": [
        {
          "id": 3,
          "slug": "flutter",
          "name": "Flutter",
          "website_url": "https://flutter.dev",
          "created_at": "2026-10-20T10:00:00.000000Z",
          "updated_at": "2026-10-20T10:00:00.000000Z"
        }
      ],
      "published_at": "2026-10-20T10:00:00.000000Z",
      "seo_title": "Field Notes",
      "seo_description": "An offline notebook application.",
      "created_at": "2026-10-20T10:00:00.000000Z",
      "updated_at": "2026-10-20T10:00:00.000000Z"
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
    "last_page": 1,
    "per_page": 20,
    "total": 1
  }
}
```

The list response does not include the full description, gallery, or contributors. Get the entry detail when the visitor opens an entry.

### Common errors

- `422`: an unsupported filter or invalid parameter was sent.
- `429`: too many requests; wait for the number of seconds in the `Retry-After` header.

---

## 2. Get one project or product

### What does it do?

Returns the full details of one published entry, including its description, gallery, and visible contributors.

### URL

```http
GET /api/v1/entries/{slug}
```

Example:

```http
GET /api/v1/entries/field-notes
```

Use the `slug` returned by `GET /entries`. Do not use the numeric `id` in this URL.

### Body

No body.

### Response

Status: `200 OK`

```json
{
  "data": {
    "id": 1,
    "kind": "project",
    "slug": "field-notes",
    "title": "Field Notes",
    "summary": "An offline notebook application.",
    "description": "A detailed **Markdown** description.",
    "featured": true,
    "sort_order": 0,
    "repository_url": "https://github.com/example/field-notes",
    "demo_url": null,
    "external_url": null,
    "cover": {
      "id": 10,
      "width": 1600,
      "height": 900,
      "url": "https://api.your-domain.com/storage/example/display.webp",
      "thumbnail_url": "https://api.your-domain.com/storage/example/thumbnail.webp"
    },
    "category": null,
    "technologies": [],
    "gallery": [
      {
        "media": {
          "id": 11,
          "width": 1200,
          "height": 800,
          "url": "https://api.your-domain.com/storage/gallery/display.webp",
          "thumbnail_url": "https://api.your-domain.com/storage/gallery/thumbnail.webp"
        },
        "alt_text": "Application home screen",
        "sort_order": 0
      }
    ],
    "contributors": [],
    "published_at": "2026-10-20T10:00:00.000000Z",
    "seo_title": "Field Notes",
    "seo_description": "An offline notebook application.",
    "created_at": "2026-10-20T10:00:00.000000Z",
    "updated_at": "2026-10-20T10:00:00.000000Z"
  }
}
```

### Common errors

- `404`: the slug does not exist, or the entry is not published.
- `429`: too many requests.

---

## 3. Get categories

### What does it do?

Returns categories that are used by published entries. Use these values to build project filters.

### URL

```http
GET /api/v1/categories?page=1&per_page=20
```

### Body

No body. `page`, `per_page`, and `q` are optional. `q` searches the category name and can contain at most 100 characters.

### Response

Status: `200 OK`

```json
{
  "data": [
    {
      "id": 2,
      "slug": "mobile",
      "name": "Mobile",
      "description": "Mobile applications.",
      "sort_order": 0,
      "created_at": "2026-10-20T10:00:00.000000Z",
      "updated_at": "2026-10-20T10:00:00.000000Z"
    }
  ],
  "links": {
    "first": "http://localhost:8000/api/v1/categories?page=1",
    "last": "http://localhost:8000/api/v1/categories?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 20,
    "total": 1
  }
}
```

To filter entries with this category, use its slug:

```http
GET /api/v1/entries?category=mobile
```

### Common errors

- `422`: invalid pagination or an unknown query parameter.
- `429`: too many requests.

---

## 4. Get technologies

### What does it do?

Returns technologies attached to published entries. Use them as labels or project filters.

### URL

```http
GET /api/v1/technologies?page=1&per_page=20
```

### Body

No body. `page`, `per_page`, and `q` are optional. `q` searches the technology name and can contain at most 100 characters.

### Response

Status: `200 OK`

```json
{
  "data": [
    {
      "id": 3,
      "slug": "flutter",
      "name": "Flutter",
      "website_url": "https://flutter.dev",
      "created_at": "2026-10-20T10:00:00.000000Z",
      "updated_at": "2026-10-20T10:00:00.000000Z"
    }
  ],
  "links": {
    "first": "http://localhost:8000/api/v1/technologies?page=1",
    "last": "http://localhost:8000/api/v1/technologies?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 20,
    "total": 1
  }
}
```

To filter entries with this technology, use its slug:

```http
GET /api/v1/entries?technology=flutter
```

### Common errors

- `422`: invalid pagination or an unknown query parameter.
- `429`: too many requests.

---

## 5. Get team members

### What does it do?

Returns active team members for the About page. Inactive members are not returned.

### URL

```http
GET /api/v1/team-members?page=1&per_page=20
```

### Body

No body. `page`, `per_page`, and `q` are optional. `q` searches the team member name and can contain at most 100 characters.

### Response

Status: `200 OK`

```json
{
  "data": [
    {
      "id": 4,
      "slug": "example-developer",
      "name": "Example Developer",
      "role_title": "Software Developer",
      "bio": "A short **Markdown** biography.",
      "sort_order": 0,
      "photo": {
        "id": 12,
        "width": 800,
        "height": 800,
        "url": "https://api.your-domain.com/storage/team/display.webp",
        "thumbnail_url": "https://api.your-domain.com/storage/team/thumbnail.webp"
      },
      "links": [
        {
          "label": "GitHub",
          "url": "https://github.com/example",
          "sort_order": 0
        }
      ],
      "created_at": "2026-10-20T10:00:00.000000Z",
      "updated_at": "2026-10-20T10:00:00.000000Z"
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
    "last_page": 1,
    "per_page": 20,
    "total": 1
  }
}
```

### Common errors

- `422`: invalid pagination or an unknown query parameter.
- `429`: too many requests.

---

## 6. Get one team member

### What does it do?

Returns one active team member by slug.

### URL

```http
GET /api/v1/team-members/{slug}
```

Example:

```http
GET /api/v1/team-members/example-developer
```

### Body

No body.

### Response

Status: `200 OK`

```json
{
  "data": {
    "id": 4,
    "slug": "example-developer",
    "name": "Example Developer",
    "role_title": "Software Developer",
    "bio": "A short **Markdown** biography.",
    "sort_order": 0,
    "photo": null,
    "links": [],
    "created_at": "2026-10-20T10:00:00.000000Z",
    "updated_at": "2026-10-20T10:00:00.000000Z"
  }
}
```

### Common errors

- `404`: the slug does not exist, or the member is inactive.
- `429`: too many requests.

---

## 7. Get services

### What does it do?

Returns active services for the home page or Services page.

### URL

```http
GET /api/v1/services?page=1&per_page=20
```

### Body

No body. `page`, `per_page`, and `q` are optional. `q` searches the service title and can contain at most 100 characters.

### Response

Status: `200 OK`

```json
{
  "data": [
    {
      "id": 5,
      "slug": "mobile-development",
      "title": "Mobile Development",
      "summary": "Android and iOS application development.",
      "description": "We design and build reliable mobile applications.",
      "icon_key": "smartphone",
      "sort_order": 0,
      "created_at": "2026-10-20T10:00:00.000000Z",
      "updated_at": "2026-10-20T10:00:00.000000Z"
    }
  ],
  "links": {
    "first": "http://localhost:8000/api/v1/services?page=1",
    "last": "http://localhost:8000/api/v1/services?page=1",
    "prev": null,
    "next": null
  },
  "meta": {
    "current_page": 1,
    "last_page": 1,
    "per_page": 20,
    "total": 1
  }
}
```

### Common errors

- `422`: invalid pagination or an unknown query parameter.
- `429`: too many requests.

---

## 8. Get one service

### What does it do?

Returns one active service by slug.

### URL

```http
GET /api/v1/services/{slug}
```

Example:

```http
GET /api/v1/services/mobile-development
```

### Body

No body.

### Response

Status: `200 OK`

```json
{
  "data": {
    "id": 5,
    "slug": "mobile-development",
    "title": "Mobile Development",
    "summary": "Android and iOS application development.",
    "description": "We design and build reliable mobile applications.",
    "icon_key": "smartphone",
    "sort_order": 0,
    "created_at": "2026-10-20T10:00:00.000000Z",
    "updated_at": "2026-10-20T10:00:00.000000Z"
  }
}
```

### Common errors

- `404`: the slug does not exist, or the service is inactive.
- `429`: too many requests.

---

## 9. Get site settings

### What does it do?

Returns public website information such as the site title, tagline, introduction, contact email, availability, SEO defaults, social links, and logo.

### URL

```http
GET /api/v1/site-settings
```

### Body

No body.

### Response

Status: `200 OK`

```json
{
  "data": {
    "id": 1,
    "site_title": "Brothers-Tech",
    "tagline": "Software that moves businesses forward",
    "introduction": "We build practical digital products.",
    "contact_email": "contact@example.com",
    "availability": "available",
    "default_seo_title": "Brothers-Tech",
    "default_seo_description": "Mobile, web, and desktop software development.",
    "social_links": [
      {
        "label": "GitHub",
        "url": "https://github.com/example",
        "sort_order": 0
      }
    ],
    "logo": null,
    "created_at": "2026-10-20T10:00:00.000000Z",
    "updated_at": "2026-10-20T10:00:00.000000Z"
  }
}
```

`availability` is one of `available`, `limited`, or `unavailable`.

### Common errors

- `429`: too many requests.
- `500`: an unexpected server error.

---

## 10. Send a contact inquiry

### What does it do?

Sends the website contact form to the backend. The inquiry is stored privately and is not returned to the website.

### URL

```http
POST /api/v1/inquiries
```

### Body

```json
{
  "name": "Alex Morgan",
  "email": "alex@example.com",
  "subject": "Mobile application project",
  "message": "I would like to discuss a mobile application.",
  "website": ""
}
```

| Field | Required? | Rules |
| --- | --- | --- |
| `name` | Yes | Text, maximum 120 characters |
| `email` | Yes | Valid email, maximum 254 characters |
| `subject` | Yes | Text, maximum 180 characters |
| `message` | Yes | Text, maximum 10,000 characters |
| `website` | No | Honeypot field; hide it and keep it empty for real visitors |

The current website form has extra values such as company, scope, budget, and timeline. The API does not have separate fields for them. Combine them into `subject` or `message`. Do not send unknown JSON fields because the backend rejects them.

### Response

Status: `201 Created`

```json
{
  "data": {
    "message": "Thank you. Your inquiry has been received."
  }
}
```

The response intentionally does not contain the inquiry ID or submitted content. Do not automatically repeat a request after an unclear network timeout because that can create a duplicate inquiry.

### Common errors

- `422`: a required value is missing, invalid, too long, or an unknown field was sent.
- `429`: too many contact submissions. The default limit is 3 per hour per IP address.

---

## 11. Record an analytics event

### What does it do?

Records a simple aggregate event without a visitor account, session ID, or fingerprint. This endpoint is optional. Use it only when appropriate consent requirements have been satisfied.

### URL

```http
POST /api/v1/analytics/events
```

### Body

Page view example:

```json
{
  "event_name": "page_view",
  "path": "/about"
}
```

Entry view example:

```json
{
  "event_name": "entry_view",
  "path": "/entries/field-notes",
  "entry_id": 1,
  "referrer": "https://www.google.com/"
}
```

Contact click example:

```json
{
  "event_name": "contact_click",
  "path": "/contact"
}
```

| Field | Required? | Rules |
| --- | --- | --- |
| `event_name` | Yes | `page_view`, `entry_view`, or `contact_click` |
| `path` | Yes | A supported relative website path; no domain, query, or fragment |
| `entry_id` | Only for `entry_view` | Numeric ID of a currently published entry |
| `referrer` | No | HTTP or HTTPS URL, maximum 2,048 characters |

Supported paths are:

- `/`
- `/projects`
- `/products`
- `/about`
- `/contact`
- `/entries/{slug}`
- `/team` and `/team/{slug}`
- `/services` and `/services/{slug}`

Do not send user IDs, email addresses, device details, timestamps, full visitor profiles, or other fields.

### Response

Status: `202 Accepted`

```json
{
  "data": {
    "accepted": true
  }
}
```

`202` means the request was accepted. It does not mean that the event represents a unique person.

### Common errors

- `422`: invalid event name, unsupported path, invalid entry, wrong field combination, or unknown field.
- `429`: too many events. The default limit is 60 per minute per IP address.

---

## Suggested endpoint for each website page

| Website area | Endpoint |
| --- | --- |
| Global title, logo, contact email, and social links | `GET /site-settings` |
| Home featured projects | `GET /entries?featured=1&kind=project&per_page=6` |
| Home services | `GET /services` |
| Projects page | `GET /entries?kind=project` |
| Project detail page | `GET /entries/{slug}` |
| Project category filters | `GET /categories` |
| Project technology filters | `GET /technologies` |
| About/team page | `GET /team-members` |
| Team member detail page | `GET /team-members/{slug}` |
| Services page | `GET /services` |
| Service detail page | `GET /services/{slug}` |
| Contact form | `POST /inquiries` |
| Optional page/click tracking | `POST /analytics/events` |

## Important website rules

1. Configure the website's exact origin in the backend `SITE_ORIGINS`. For local Jaspr development, the default is `http://localhost:8080`.
2. Never put an administrator email, password, or bearer token in public website code.
3. Use `thumbnail_url` for cards and `url` for larger images. Media URLs are already complete URLs; do not add the API base URL to them.
4. Entry descriptions and team biographies may contain Markdown. Treat it as untrusted text, disable raw HTML, and sanitize rendered output.
5. Show loading, empty, and error states. An empty `data` list is a valid response, not an error.
6. Follow `links.next` or increase `page` until `meta.current_page` equals `meta.last_page`.
7. Handle `404` when old entry, team, or service links are no longer public.
8. Handle `422` by displaying messages from `errors` beside the related form fields.
9. Handle `429` by waiting for the `Retry-After` response header before trying again.
10. Public API responses use `Cache-Control: no-store`; fetch again when current publication state matters.

For the complete machine-readable contract, see [openapi.yaml](openapi.yaml). For advanced public and administrator integration details, see [api-integration.md](api-integration.md).
