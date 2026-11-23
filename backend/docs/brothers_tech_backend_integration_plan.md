# Brothers-Tech Website — Backend Integration Plan

**Document purpose:** This is the implementation brief for the backend team. It is based on the supplied Jaspr website source (`our_website.zip`) and identifies the content the website currently displays, the fields the API should provide, and how the frontend should consume it.

**Frontend:** Jaspr website  
**Suggested API style:** REST JSON API, versioned under `/api/v1`  
**Current API constants found in the project:** `https://api.mahmoudbannan.com/api/v1`  
**Important:** Original endpoint names below are proposals. The implementation update and linked contract specify the delivered API.

---

## Implementation update — 2026-11-23

The backend changes described below are now implemented in source. The original sections remain the website brief; this update and the linked OpenAPI/Flutter handoff define the actual API names and behavior. Deployment and client implementation are separate tasks.

- Five fixed pages (`home`, `about`, `services`, `projects`, `contact`) now have authenticated GET/PUT management and public GET endpoints, typed sections, editable section headings, inline SEO, draft/publication control, a ready Open Graph image and ordered featured entry references.
- Existing site settings now include contact text, light/dark logos and favicon, navigation, footer, legal links, social visibility and a shared CTA.
- Existing entries now support application classification, challenge/solution/outcomes, platforms, store links and editable SEO overrides. Existing services gain features, cover, CTA and SEO. Team links support visibility.
- Media supports alt-text upload/editing and processed file metadata. All new image references participate in deletion and orphan-cleanup guards.
- Inquiries accept `source_page`; optional queued generic business inbox notifications keep visitor details inside the authenticated inquiry API. Server configuration and a working queue/mail transport are needed for actual delivery.

| Brief proposal | Actual API / decision |
| --- | --- |
| `/site` | `/site-settings` |
| `/projects` | `/entries?kind=project` |
| `/projects/{slug}` | `/entries/{slug}` |
| `kind=mobile_app` | Keep `kind=project|product`; use optional `project_type=mobile_app|web_app|desktop_app|platform` |
| `/project-categories` | `/categories`, with existing visible-entry taxonomy rules |
| Page SEO endpoint | Inline `seo` on `/pages/{page_key}` |
| Publication boolean | Keep entry `status` and team/service `is_active` |
| Contact status names | Keep `new`, `read`, `replied`, `archived` |
| Proposed inquiry response ID/status | Keep the existing private generic 201 acknowledgment without IDs |
| Navigation path | Safe `url` field; local paths or absolute HTTP(S) |
| Suggested API caching | Existing `Cache-Control: no-store, private`; no stale API cache |
| Locale | English only for this version |

Read [Flutter backend changes](flutter-backend-updates.md), [tested request examples](flutter-api-examples.md), [Flutter implementation checklist](flutter-implementation-checklist.md), and [OpenAPI](../../docs/openapi.yaml). They specify writable limits, nullability, full-object page replacement and exact response fields.

`php artisan app:demo` creates idempotent fictional draft pages outside production. Production seeding remains singleton settings only. The source archive referenced by the brief was not supplied, so no unverified project links, employee data, metrics or complete website-copy import were fabricated. Review sample copy and enter real content through the owner API before publishing. Existing client directories were preserved. Testimonials/FAQs/blog, localization, arbitrary page builders and staging deployment remain outside this implementation.

---

## 1. Main objectives

1. Move editable website content out of Dart source files and into the backend.
2. Allow authorized staff to manage content without changing or redeploying the frontend.
3. Keep the website fast, SEO-friendly, and resilient if the API is temporarily unavailable.
4. Use consistent content structures across Home, About, Services, Projects, and Contact pages.
5. Provide predictable ordering, publication status, image variants, and SEO metadata.
6. Keep layout, styling, animations, responsive behavior, and reusable UI components in the frontend. The backend supplies content, not HTML or CSS.

## 2. Scope: what should and should not be dynamic

### Make dynamic

- Website identity and global settings: brand description, logo assets, contact details, social links, footer content.
- Navigation labels and destinations, if the team needs to edit them.
- Home page section headings, descriptions, cards, metrics, process steps, and featured project selection.
- About page introduction, principles, journey phases, engineering philosophy, specialization labels, and team members.
- Services page service groups, features, solutions, delivery steps, and supporting copy.
- Projects page project records, categories, technologies, images, links, descriptions, and featured/ordered state.
- Contact page form options and contact information. Contact submissions must be stored by the backend.
- SEO title, description, Open Graph image, canonical URL, and indexing settings for each page.
- Optional announcements, testimonials, FAQs, and blog content only if those sections are actually added to the website.

### Keep static in the frontend

- Layout structure and component composition.
- Typography, colors, spacing, breakpoints, animations, and visual effects.
- Icons that are purely decorative.
- Form validation mechanics and interaction states (the API may return validation errors).
- Routes and page rendering logic.
- Fallback copy and error/empty/loading states.
- Technical configuration such as API base URL and cache policy.

**Rule:** If a non-developer should be able to change it from an admin panel, it is a candidate for backend content. If it controls how the interface is rendered or behaves, it usually belongs in the frontend.

---

## 3. Website content inventory

The following inventory reflects the supplied source code. Some content is currently hardcoded and should become API-managed if content editing is required.

### 3.1 Global website content

Used by the header, footer, shared contact call-to-action, and potentially all pages.

| Content group | Required fields |
|---|---|
| Site identity | `site_name`, `tagline`, `short_description`, `logo`, `logo_light`, `logo_dark`, `favicon` |
| Contact details | `contact_email`, `phone` (optional), `location` (optional), `availability_text` (optional) |
| Social links | `platform`, `label`, `url`, `sort_order`, `is_visible` |
| Navigation | `label`, `path`, `sort_order`, `is_visible`, `open_in_new_tab` |
| Footer | `description`, `copyright_text`, `established_year`, `footer_links`, `practice_links` |
| Shared CTA | `eyebrow`, `title`, `description`, `button_label`, `button_url` |
| Legal links | `privacy_policy_url`, `terms_url`, `security_policy_url` (only if those pages exist) |

Do not store the current year as fixed text. The frontend should calculate the current year or the backend should provide a copyright template/year policy.

### 3.2 Home page (`/`)

| Section | Content to manage | Suggested structure |
|---|---|---|
| Hero / intro | Eyebrow, headline, highlighted headline segment, description, primary and secondary CTA | `hero` object |
| Hero highlights | “Real-World Products”, “Multi-Platform Dev”, “End-to-End Delivery” style proof points | `highlights[]` |
| Services overview | Mobile App Development, Web Development, Desktop Applications, UI/UX Design; each has title, description, icon, link | `service_cards[]` |
| Why Brothers-Tech | “Built for Real-World Use”, “One Team, Multi-Platform”, “Scalable Architecture”, “From Idea to Release” cards | `value_propositions[]` |
| How we work | Define & Align, Plan & Prototype, Engineered Code, Rigorous QA, Deploy & Scale | `process_steps[]` |
| Metrics / feature bar | Real-World Products, Multi-Platform, End-to-End Dev, Modern Tech Stack | `metrics[]` or `capabilities[]` |
| Selected work | Featured projects, with order and optional card variant | `featured_projects[]` (prefer references to project IDs/slugs, not duplicated project content) |
| Shared CTA | “Have an Idea? Let’s Build It Together.” style CTA | Reuse global CTA or page-specific CTA |

For metric values, include a numeric or text value only if it is truthful and maintained. Avoid hardcoded claims such as “14+ Platforms Shipped” unless the business confirms the number and commits to updating it.

### 3.3 About page (`/about`)

| Section | Content to manage | Suggested structure |
|---|---|---|
| Intro | Eyebrow, title, description | `intro` |
| Proof points | Practitioner-led, direct communication, multi-platform craft | `highlights[]` |
| Core principles | Product First, Built for Real Use, Clean Engineering, Long-Term Thinking; each with description and icon | `principles[]` |
| Our journey | Learn, Build, Ship, Improve; each with title, description, optional date/period | `journey_phases[]` |
| Engineering philosophy | Numbered statements such as solves a real problem, feels simple to use, can grow | `philosophy_items[]` |
| Specializations | Mobile, Web, Desktop, UI/UX | `specializations[]` |
| Team members | Name, role, bio, portrait, social/developer links, display order | `team_members[]` |

Team member fields:
- `id`, `slug`, `name`, `role_title`, `bio`
- `photo` media object
- `links[]`: `label`, `url`, `sort_order`, `is_visible`
- `sort_order`, `is_published`
- Optional `location`, `short_bio`, `email` only if intended to be public

Do not expose private employee details. Only return fields intended for public display.

### 3.4 Services page (`/services`)

| Section | Content to manage | Suggested structure |
|---|---|---|
| Intro | Eyebrow, title, description, proof-point labels | `intro`, `highlights[]` |
| Our services | Service entries and descriptions | `services[]` |
| Features / capabilities | Mobile Applications, Web Platforms & Applications, Dashboards, Desktop Software, Operations Workstations | `capabilities[]` |
| Solutions by industry/use case | Business Applications, Educational Platforms, Management Systems, E-commerce Solutions, Dashboards & Analytics, Admin Panels, Custom Software | `solutions[]` |
| How we build | Plan, Design, Develop, Test, Deploy, Support | `delivery_steps[]` |
| Shared CTA | Contact / project CTA | Reuse global CTA |

Recommended service fields:
- `id`, `slug`, `title`, `short_description`, `description`
- `icon` (icon identifier from an agreed allowlist)
- `cover_image` (optional)
- `features[]` (short strings or structured feature records)
- `sort_order`, `is_published`
- `cta_label`, `cta_url` (optional)
- `seo_title`, `seo_description` (optional)

Avoid allowing arbitrary HTML from the API. Use plain text or a documented rich-text format with safe rendering.

### 3.5 Projects page (`/projects`)

Projects are the most important structured content type and should have a dedicated resource, not be embedded as a large static list in the home page response.

The current source includes project examples such as Prime, Ala Al-Nadha, Drisavo, Prime Bac, and Elegance. The backend should store the content and links, but the frontend should not assume this exact list will remain fixed.

**Project fields**

| Field | Type | Required? | Notes |
|---|---|---:|---|
| `id` | integer/string | Yes | Stable identifier |
| `slug` | string | Yes | Unique URL-safe identifier |
| `title` | string | Yes | Public project name |
| `kind` | enum/string | Yes | e.g. `mobile_app`, `web_app`, `desktop_app`, `platform` |
| `summary` | string | Yes | Short card description |
| `description` | string | Recommended | Full project description |
| `challenge` | string | Optional | Problem/context |
| `solution` | string | Optional | What was built |
| `outcomes` | array | Optional | Results; do not invent metrics |
| `category` | object | Yes | `id`, `slug`, `name` |
| `technologies` | array | Recommended | Each item: `id`, `slug`, `name`, `website_url` (optional) |
| `cover` | media object | Yes | Main card image |
| `gallery` | media array | Optional | Screenshots, mockups, videos |
| `featured` | boolean | Yes | Whether selected for home/featured areas |
| `sort_order` | integer | Yes | Manual ordering |
| `repository_url` | URL/null | Optional | Only public repositories |
| `demo_url` | URL/null | Optional | Live demo |
| `external_url` | URL/null | Optional | Other project link |
| `platforms` | string array | Recommended | e.g. `android`, `ios`, `web` |
| `store_links` | array | Optional | `platform`, `label`, `url` |
| `published_at` | ISO-8601/null | Recommended | Publication date |
| `is_published` | boolean | Yes | Draft/published control |
| `seo_title` | string/null | Optional | Project page SEO |
| `seo_description` | string/null | Optional | Project page SEO |
| `created_at`, `updated_at` | ISO-8601 | Yes | Audit fields |

**Media object**

Use one consistent media structure for project covers, galleries, team photos, and other images:

```json
{
  "id": 31,
  "url": "https://cdn.example.com/projects/prime/cover.webp",
  "thumbnail_url": "https://cdn.example.com/projects/prime/cover-640.webp",
  "width": 1600,
  "height": 1000,
  "alt": "Prime medical education platform displayed on mobile devices",
  "mime_type": "image/webp",
  "file_size": 182400
}
```

The API should return absolute HTTPS URLs. Provide optimized variants (at least thumbnail/card and full-size) and preserve width/height to prevent layout shift. `alt` should describe the image meaningfully, not repeat a keyword list.

**Project category**

- `id`
- `slug`
- `name`
- `description` (optional)
- `sort_order`
- `is_published`

**Project technology**

- `id`
- `slug`
- `name`
- `website_url` (optional)
- `logo` (optional media object)
- `sort_order`

**Project listing behavior**
- Support filtering by category/kind.
- Support pagination.
- Support sorting by `sort_order` and/or `published_at`.
- Only return published projects to public endpoints.
- Support a featured-only query for the home page.
- Include a detail endpoint by slug.

### 3.6 Contact page (`/contact`)

The current form displays:
- Your Name
- Work Email
- Subject
- Tell us about your project
- Submit button and sending/success/error states
- Confidentiality note

**Submission payload**

```json
{
  "name": "Jane Smith",
  "email": "jane@example.com",
  "subject": "Mobile application project",
  "message": "We need a cross-platform application...",
  "source_page": "/contact"
}
```

**Backend requirements**
- Validate all required fields server-side.
- Validate email format and enforce sensible length limits.
- Apply rate limiting and anti-spam protection (honeypot and/or CAPTCHA if needed).
- Sanitize input and prevent header injection.
- Store inquiry with status such as `new`, `in_progress`, `replied`, `closed`.
- Send a notification to the configured business inbox.
- Return a clear success response only after the inquiry is safely accepted/stored.
- Do not expose inquiry records through public GET endpoints.
- Never return internal email addresses, notes, or operational metadata to the public website.

**Response example**

```json
{
  "data": {
    "id": 845,
    "status": "received",
    "message": "Your inquiry has been received."
  }
}
```

### 3.7 SEO and page metadata

Provide metadata for each public page, either in the page content endpoint or a dedicated `page_seo` resource.

Fields:
- `path` or `page_key`
- `title`
- `meta_description`
- `canonical_url` (optional)
- `og_title`
- `og_description`
- `og_image` (media object or URL)
- `twitter_title` (optional)
- `twitter_description` (optional)
- `twitter_image` (optional)
- `robots_index` (boolean)
- `robots_follow` (boolean)

SEO metadata must be available to the server-rendered page response. Do not rely on client-side JavaScript to update metadata after the page has loaded.

---

## 4. Recommended API endpoints

Use a versioned base URL:

`https://api.mahmoudbannan.com/api/v1`

The following endpoint names are proposed. The backend team can adjust naming, but should preserve the response capabilities and field definitions.

| Method | Endpoint | Purpose |
|---|---|---|
| `GET` | `/site` | Global settings, navigation, footer, shared CTA, social links |
| `GET` | `/pages/home` | Home page content sections and featured project references |
| `GET` | `/pages/about` | About page sections and team members |
| `GET` | `/pages/services` | Services page sections and content |
| `GET` | `/pages/projects` | Projects page intro and optional delivery content |
| `GET` | `/projects` | Published projects listing; filters and pagination |
| `GET` | `/projects/{slug}` | One published project detail |
| `GET` | `/project-categories` | Published project categories |
| `GET` | `/services` | Published service records (if services are normalized resources) |
| `GET` | `/team-members` | Published team members |
| `GET` | `/pages/{page_key}/seo` | SEO metadata, if not included in page response |
| `POST` | `/inquiries` | Submit a contact inquiry |

### Suggested query parameters

For `GET /projects`:

- `page=1`
- `per_page=12`
- `category={slug}`
- `kind=mobile_app`
- `featured=true`
- `sort=sort_order` or `sort=-published_at`

For `GET /team-members` and `/services`:
- `page`, `per_page` only if the list may grow substantially.
- `sort=sort_order`.

Do not create separate endpoints for every small static text string. Page-level endpoints are suitable for page composition; dedicated endpoints are appropriate for reusable entities such as projects, services, team members, and categories.

---

## 5. Response format and conventions

Use one consistent response envelope.

**Single resource / page**

```json
{
  "data": {
    "page_key": "home",
    "seo": {
      "title": "Brothers-Tech | Software Development Studio",
      "meta_description": "..."
    },
    "hero": {
      "eyebrow": "MULTI-PLATFORM SOFTWARE STUDIO",
      "title": "We Build Software That Moves Businesses Forward.",
      "description": "...",
      "primary_cta": {
        "label": "Start Your Project",
        "url": "/contact"
      },
      "secondary_cta": {
        "label": "Explore Our Work",
        "url": "/projects"
      }
    }
  },
  "meta": {
    "version": 1,
    "locale": "en",
    "updated_at": "2026-11-08T12:00:00Z"
  }
}
```

**Collection**

```json
{
  "data": [],
  "meta": {
    "current_page": 1,
    "per_page": 12,
    "total": 0,
    "last_page": 1
  }
}
```

**Error**

```json
{
  "message": "The given data was invalid.",
  "errors": {
    "email": ["Please enter a valid email address."]
  }
}
```

### API conventions

- Use `snake_case` JSON keys consistently.
- Use ISO-8601 timestamps in UTC.
- Use `null` for absent optional values; do not unpredictably switch between `null`, empty strings, and missing keys.
- Use booleans for boolean fields.
- Use stable IDs and unique slugs.
- Use absolute HTTPS media URLs.
- Return explicit `sort_order` and sort records consistently on the server.
- Public endpoints must return only published/active content.
- Define allowed enum values for `kind`, `platform`, and status fields.
- Include a locale field if multilingual content is planned. If the website is English-only, do not add unnecessary translation complexity now.
- Document maximum lengths and validation rules for every writable field.

---

## 6. Suggested database entities / relationships

A normalized backend design could use these entities:

- `site_settings` — singleton/global configuration.
- `navigation_items` — header/footer navigation.
- `social_links` — public social profiles.
- `pages` — page-level content and SEO metadata.
- `page_sections` — optional flexible section records; use only if the CMS needs section-level editing.
- `projects`
- `project_categories`
- `technologies`
- `project_technology` — many-to-many pivot.
- `project_media` — project cover/gallery media and ordering.
- `team_members`
- `team_member_links`
- `services`
- `service_features` or JSON feature arrays, depending on admin needs.
- `inquiries`
- `media` — shared uploaded image/file metadata.

Recommended relationships:
- A project belongs to one category.
- A project has many technologies; a technology can belong to many projects.
- A project has one cover and many gallery media items.
- A team member has many public links and one optional photo.
- A service has many features.
- A page has one SEO record (or SEO fields directly on the page).
- A page section belongs to a page and has a `type`, `content`, and `sort_order` if using a flexible page builder.

**Do not over-engineer a page builder prematurely.** The current website has known, fixed sections. Typed page response objects are easier to validate and render than a fully generic CMS. A `page_sections` table is optional and should only be introduced if the admin panel genuinely needs to add/reorder different section types.

---

## 7. How the Jaspr frontend should consume the API

### Recommended data flow

1. The server-rendered page requests the relevant page endpoint.
2. The backend returns the page content and SEO metadata.
3. Jaspr maps JSON into typed Dart models.
4. Page components receive models through constructors/parameters.
5. The frontend renders the same layout it currently renders, using API data instead of hardcoded content.
6. Images use the returned optimized URLs and intrinsic dimensions.
7. The browser hydrates only the interactive parts that need client-side behavior.

### SSR and SEO requirements

Because this is a Jaspr website and SEO matters:
- Fetch page content during server-side rendering where possible.
- Render meaningful page text and metadata in the initial HTML.
- Do not fetch all page content only after hydration.
- Do not put API secrets in client-side code.
- The public read API can be unauthenticated; admin/write APIs must be authenticated and authorized.
- If the API is unavailable during SSR, render a safe fallback page and log the failure. Do not render a blank page.
- Ensure the backend permits requests from the website origin if browser-side requests are used (CORS). Server-to-server requests are not governed by browser CORS.

### Frontend implementation layers

Suggested separation:

```text
lib/
  core/
    config/
      api_config.dart
    network/
      api_client.dart
      api_exception.dart
    models/
      api_response.dart
      site_settings.dart
      home_page_content.dart
      about_page_content.dart
      services_page_content.dart
      project.dart
      project_category.dart
      technology.dart
      team_member.dart
      media.dart
      inquiry_request.dart
    repositories/
      site_repository.dart
      page_repository.dart
      project_repository.dart
      team_repository.dart
      inquiry_repository.dart
  pages/
    home/
    about/
    services/
    projects/
    contact/
```

Use one API client for base URL, timeouts, headers, JSON decoding, and error mapping. Repositories should own endpoint calls. UI components should not make HTTP requests directly.

### Caching and resilience

- Use HTTP cache headers: `ETag` and/or `Last-Modified`, plus suitable `Cache-Control`.
- Cache public page data at the CDN/server layer where possible.
- Use a short cache lifetime for frequently edited content and longer caching for media.
- Invalidate page caches when an editor publishes content.
- Provide a frontend fallback for API errors and empty lists.
- Avoid requesting the same resource multiple times during one page render.
- Consider a combined `/site` endpoint to avoid separate requests for settings, navigation, footer, and shared CTA.
- Do not cache contact form submissions as public content.

### Security

- Public GET endpoints expose only public published data.
- Protect admin CRUD endpoints with authentication, role-based authorization, and audit logging.
- Validate and sanitize all submitted data server-side.
- Restrict upload types and sizes; scan uploads where appropriate.
- Use HTTPS.
- Apply rate limiting to inquiry submissions and any public search endpoints.
- Never include API keys, database credentials, mail credentials, or admin tokens in frontend bundles.
- Do not allow arbitrary script/HTML content to be stored and rendered from the CMS.

---

## 8. What the backend team must deliver

Please ask the backend team to provide:

1. **API contract** for every endpoint: method, URL, query parameters, request body, response body, status codes, and validation errors.
2. **Field definitions**: type, required/optional, nullable, maximum length, enum values, and relationships.
3. **Sample JSON responses** populated with realistic website content for every page.
4. **Media upload and delivery rules**: accepted file types, max sizes, image variants, CDN URL format, and deletion behavior.
5. **Admin management capability** for all content marked dynamic in this document.
6. **Publication workflow**: draft, publish, unpublish, sort order, and preview behavior.
7. **Contact inquiry workflow**: persistence, notification, spam protection, and status management.
8. **SEO support** that is available during server-side rendering.
9. **CORS configuration** for the production website origin if the browser calls the API directly.
10. **Caching policy** and cache invalidation after content changes.
11. **Error format** consistent across endpoints.
12. **API documentation** (OpenAPI/Swagger preferred) and a staging environment.
13. **Seed data** matching the current website content so the frontend can be integrated without waiting for manual data entry.

### Acceptance criteria

The integration is ready when:
- Every agreed dynamic field can be edited in the admin panel and appears on the website without a frontend deployment.
- All five main pages render correctly with API data.
- Project listing, category filtering, featured projects, and project details work.
- Team members and their public links are managed through the backend.
- Contact form submissions are validated, saved, and notified.
- SEO metadata is present in server-rendered HTML.
- Empty, loading, validation, and API failure states are handled.
- No private backend/admin credentials are exposed in the browser.
- The website remains usable if a non-critical content endpoint fails.

---

## 9. Recommended implementation phases

### Phase 1 — Backend foundation
- Confirm API base URL, response envelope, locale strategy, media format, and error format.
- Implement global site settings and page content endpoints.
- Implement projects, categories, technologies, and team members.
- Implement inquiry submission.
- Provide seeded sample data and API documentation.

### Phase 2 — Frontend foundation
- Add shared API client and typed models.
- Add repositories for site settings, pages, projects, team, and inquiries.
- Add SSR-safe fetching and error handling.
- Keep existing components and replace hardcoded content with model values.

### Phase 3 — Page integration
1. Global header/footer and shared CTA.
2. Home page.
3. About page and team.
4. Services page.
5. Projects listing and project details.
6. Contact form.

### Phase 4 — Quality and release
- Verify responsive layouts with short and long content.
- Test missing images, empty lists, invalid links, and API downtime.
- Verify SEO metadata in the raw server-rendered HTML.
- Test contact validation, rate limiting, and notification delivery.
- Test caching and publish-time invalidation.
- Verify that only public fields are returned by public endpoints.

---

## 10. Decisions to confirm before backend implementation

The backend team and website owner should confirm:

- Is the website English-only, or should content support Arabic/French later?
- Will there be an admin dashboard, and who can edit/publish content?
- Are project detail pages required, or only project cards linking to external destinations?
- Should services have individual detail pages?
- Should the team section support only people, or also roles/teams?
- Which contact email receives inquiry notifications?
- Will the backend host images, or will a dedicated object storage/CDN be used?
- Which pages need editable SEO metadata?
- Are testimonials, FAQs, or blog posts planned? Do not implement these until confirmed.

---

## 11. Current code observations and migration notes

Based on the supplied source:

- The project already defines API constants for `inquiries`, `entries`, and `team-members` under `https://api.mahmoudbannan.com/api/v1`. Confirm whether these are active backend routes before adopting the proposed endpoint names.
- `AppConstants.projects` currently contains hardcoded project records, including descriptions, bullet points, tags, image paths, and store links. These should move into the `projects` resource.
- `AppConstants.teamMembers` currently contains hardcoded names, roles, bios, local image paths, and LinkedIn/GitHub links. These should move into `team-members`.
- Existing models for `Project`, `Category`, `Technology`, `Cover`, and `TeamMember` are a useful starting point. Align their JSON keys and nullability with the final API contract rather than maintaining two competing schemas.
- Existing project data currently has `kind`, `slug`, `title`, `summary`, `featured`, `sort_order`, URLs, cover, category, technologies, publication date, SEO fields, and timestamps. The proposed contract extends it with full detail content, gallery, platform/store links, and publication status where needed.
- Home, About, Services, Projects, header, and footer sections contain many hardcoded labels and descriptions. These are identified in the content inventory above.
- The contact form currently has name, work email, subject, and message fields. The backend should accept those fields and return field-level validation errors in a consistent format.
- Do not blindly make every visible word API-driven. Some labels are UI language and may be better handled by frontend localization. The content owner should decide which copy needs CMS editing.

---

## 12. Short brief to send to the backend team

We need to connect the existing Brothers-Tech Jaspr website to a content API so that website content can be managed from the backend/admin panel without frontend redeployment.

Please review this document and provide:
1. A versioned REST API for global settings, page content (Home, About, Services, Projects), projects/categories/technologies, team members, SEO metadata, and contact inquiries.
2. The exact JSON schemas and sample responses for each endpoint.
3. Admin CRUD and publish/unpublish/sort-order support for all editable content.
4. A consistent media object with absolute CDN URLs, thumbnails, dimensions, and alt text.
5. Server-side validation, rate limiting, and persistence for contact inquiries.
6. SEO data available during Jaspr SSR.
7. API documentation, staging access, and seeded data matching the current website.

The frontend will keep responsibility for layout, styles, responsive behavior, and rendering. The backend should return structured content data rather than HTML.

**Please confirm the existing `/entries` and `/team-members` routes and the current inquiry API before creating duplicate endpoints.**
