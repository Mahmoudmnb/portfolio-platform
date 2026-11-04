# Projects and Team Members: Website-Driven Backend Edits

## Why these edits are needed

The website now calls these public endpoints:

```http
GET /api/v1/entries?per_page=100
GET /api/v1/team-members?per_page=100
```

The response envelope and pagination already match the website: both screens read the array inside `data`. The media objects also match because the website reads `cover.url` and `photo.url`.

However, connecting the endpoints exposed a content-model mismatch. Some fields needed by the cards do not exist in the API, while several existing API fields are not displayed by the current cards. The backend should add the missing content fields without removing the existing contract fields.

## Projects

The project card in `website/lib/pages/projects/components/project_card.dart` needs the following content:

| Website card property | Current API source | Backend action |
| --- | --- | --- |
| `dataCategories` | `category.slug` | No new field is needed. |
| `imageSrc` | `cover.url` | Already supported. |
| `imageAlt` | None for the cover | Add editable cover alt text for an entry. |
| `platformLabel` | None | Add an editable short platform label, for example `Mobile • iOS & Android`. |
| `categoryLabel` | `category.name` | No new field is needed. |
| `title` | `title` | Already supported. |
| `description` | `summary` | Already supported. |
| `bulletPoints` | None | Add an ordered list of short project highlights. Do not try to derive this from Markdown `description`. |
| `tags` | `technologies[].name` | Already supported. |
| `androidUrl` | None with an Android meaning | Add labeled entry links, including an Android store link when available. |
| `iosUrl` | None with an iOS meaning | Add labeled entry links, including an iOS App Store link when available. |

The five currently hard-coded project cards show the intended data shape. Examples include platform labels such as `Mobile • iOS`, multiple highlight bullets, technology/feature tags, and separate Android and iOS destinations. `repository_url`, `demo_url`, and `external_url` are not enough for these buttons because the website must know which store label and icon to display.

### Requested project fields

Add these fields to portfolio entries:

- `platform_label`: nullable string, maximum 120 characters.
- `cover_alt_text`: nullable string, maximum 500 characters. Require a non-empty value before publishing an entry that has a cover.
- `highlights`: an ordered array of zero or more plain-text items. Limit it to 10 items and 500 characters per item.
- `links`: an ordered array of labeled HTTPS links. Each item should contain `label`, `url`, and `sort_order`; limit it to 10 links. The website currently needs stable labels or types for `android` and `ios`.

Prefer a normalized child table for highlights and links, following the existing ordered team-member links approach. Replace the complete collection when `highlights` or `links` is supplied in an admin PATCH; omission leaves it unchanged and an empty array clears it.

Expose the new fields in public entry list and detail responses because the projects page builds cards from the list endpoint. Also expose them in admin create, read, update, validation, OpenAPI, and integration documentation.

### Expected public project item

```json
{
  "id": 1,
  "kind": "project",
  "slug": "prime-medical-education-platform",
  "title": "Prime - Medical Education Platform",
  "summary": "Mobile learning platform for medical students at Aleppo University.",
  "platform_label": "Mobile • iOS & Android",
  "cover_alt_text": "Prime medical education platform on desktop and mobile devices",
  "highlights": [
    "Built question banks, previous exams, videos, PDFs, and learning resources.",
    "Integrated an AI assistant and offline content access.",
    "Implemented content encryption."
  ],
  "links": [
    {
      "label": "android",
      "url": "https://play.google.com/store/apps/details?id=com.brothers.prime",
      "sort_order": 0
    },
    {
      "label": "ios",
      "url": "https://apps.apple.com/us/app/prime/id6758918919",
      "sort_order": 1
    }
  ],
  "cover": {
    "id": 10,
    "width": 1600,
    "height": 900,
    "url": "https://api.mahmoudbannan.com/storage/example/display.webp",
    "thumbnail_url": "https://api.mahmoudbannan.com/storage/example/thumbnail.webp"
  },
  "category": {
    "slug": "mobile",
    "name": "Medical Education"
  },
  "technologies": [
    { "name": "AI Integration" },
    { "name": "Encryption" },
    { "name": "Offline Access" }
  ]
}
```

The example is abbreviated. Existing required fields must remain in the real response.

### Existing project fields that the card does not currently display

The current card does not display `id`, `kind`, `slug`, `featured`, `sort_order`, `repository_url`, `demo_url`, `external_url`, `published_at`, SEO fields, or timestamps. These fields are not errors and should not be removed: they support filtering, stable URLs, ordering, future detail pages, administration, and the existing API contract.

The website should request only projects by adding `kind=project`:

```http
GET /api/v1/entries?kind=project&per_page=100
```

This filtering change belongs to the website, not the backend. Without it, published products can appear in the projects grid.

## Team members

The team-member card in `website/lib/pages/about/components/team_member_card.dart` needs:

| Website card property | Current API source | Backend action |
| --- | --- | --- |
| `name` | `name` | Already supported. |
| `roleTag` | `role_title` | Already supported. |
| `roleSubtitle` | None | Add a separate optional role subtitle. |
| `bio` | `bio` | Already supported. |
| `imageSrc` | `photo.url` | Already supported. |
| `imageAlt` | None | Add editable photo alt text. |
| `socialLinks` | `links` | Already supported. |
| `badgeColorClass` | None | Do not store a Tailwind/CSS class in the backend. The website should choose presentation classes. |

### Requested team-member fields

Add these fields to team members:

- `role_subtitle`: nullable string, maximum 180 characters. This is the human-readable line shown below the member name; it is separate from the uppercase role tag.
- `photo_alt_text`: nullable string, maximum 500 characters. Require a non-empty value before activating a member with a photo.

Expose both fields in public list/detail and admin responses, and accept them in admin create/PATCH requests. Update validation, migrations, factories, tests, OpenAPI, and integration examples.

### Expected public team-member item

```json
{
  "id": 1,
  "slug": "mahmoud-bannan",
  "name": "Mahmoud Bannan",
  "role_title": "FOUNDER / MOBILE DEVELOPER / BACK-END DEVELOPER",
  "role_subtitle": "FOUNDER & Mobile Developer & Back-end Developer",
  "bio": "Building reliable mobile applications and robust back-end systems with a focus on clean architecture, performance, and maintainable code.",
  "photo_alt_text": "Portrait of Mahmoud Bannan, founder, mobile developer, and back-end developer",
  "photo": {
    "id": 20,
    "width": 1200,
    "height": 1200,
    "url": "https://api.mahmoudbannan.com/storage/example/display.webp",
    "thumbnail_url": "https://api.mahmoudbannan.com/storage/example/thumbnail.webp"
  },
  "links": [
    {
      "label": "LinkedIn",
      "url": "https://www.linkedin.com/in/mahmoudbannan",
      "sort_order": 0
    },
    {
      "label": "GitHub",
      "url": "https://github.com/Mahmoudmnb",
      "sort_order": 1
    }
  ]
}
```

The example is abbreviated. Existing required fields must remain in the real response.

### Existing team-member fields that the card does not currently display

The card does not display `id`, `slug`, `sort_order`, `created_at`, or `updated_at`. Keep them. The backend already uses `sort_order` to return members in the intended sequence, while IDs, slugs, and timestamps remain useful contract and administration fields.

## Services page

The website is the source of truth for the Services page. It currently contains three different repeatable content groups, and they should not be forced into one ambiguous service record:

1. Core service feature rows in `website/lib/pages/services/views/features_view.dart`.
2. Delivery steps in `website/lib/pages/services/views/how_we_build_view.dart`.
3. Industry/software solution cards in `website/lib/pages/services/views/solutions_view.dart`.

The existing public `/services` response documented in `docs/website-public-api.md` only contains `title`, `summary`, `description`, `icon_key`, and ordering metadata. That is enough for a simple text card, but it cannot reproduce the core service rows as they exist on the website.

### Core services and the existing `/services` endpoint

Use the existing service resource for the large core-practice rows. The current website displays these fields:

| Website `FeatureCard` property | Current API source | Backend action |
| --- | --- | --- |
| `tag` | None | Add an editable short eyebrow/tag, such as `01 • Mobile Applications`. |
| `title` | `title` | Already supported. |
| `description` | `description` | Already supported. |
| `imageSrc` | None | Add a ready media relationship for the service image. |
| `imageAlt` | None | Add editable image alt text. |
| `reversed` | None | Add a presentation-neutral layout value that supports alternating image placement. |

The website currently defines three core services:

- Mobile Applications.
- Web Platforms, Applications & High-Density Dashboards.
- Desktop Software & Operations Workstations.

The page introduction says `5 Core Practices`, but only three core `FeatureCard` records currently exist. Because the website is the base, the backend must not invent two services. Either the website copy should be corrected to three, or two additional website-approved core services must be supplied before they are seeded.

### Requested service fields

Add these fields to the existing `services` resource:

- `eyebrow`: nullable string, maximum 120 characters. This supplies the card's `tag` text.
- `image_media_id`: nullable foreign key to media.
- `image_alt_text`: nullable string, maximum 500 characters.
- `image_position`: enum/string with only `left` or `right`, defaulting to `right`. This replaces the website-specific `reversed` boolean with a value that describes the content layout without storing CSS.

An active core service must have a ready image, non-empty image alt text, title, and description. The existing `summary` remains useful for compact home-page cards and SEO previews even though the large Services-page row does not currently display it. The existing `icon_key` also remains useful for compact service cards; do not remove either field.

Expose `eyebrow`, `image`, `image_alt_text`, and `image_position` in public service list/detail responses. The `image` object should use the existing public media shape with `id`, `width`, `height`, `url`, and `thumbnail_url`. Admin responses should additionally expose `image_media_id`.

### Expected public service item

```json
{
  "id": 1,
  "slug": "mobile-applications",
  "eyebrow": "01 • Mobile Applications",
  "title": "Mobile Applications",
  "summary": "Reliable Android and iOS application development.",
  "description": "Reliable Android and iOS applications designed around your users and business goals. We handle the full journey from planning and design to store release and ongoing improvements.",
  "icon_key": "smartphone",
  "image": {
    "id": 30,
    "width": 1600,
    "height": 900,
    "url": "https://api.mahmoudbannan.com/storage/example/display.webp",
    "thumbnail_url": "https://api.mahmoudbannan.com/storage/example/thumbnail.webp"
  },
  "image_alt_text": "Brothers-Tech mobile application portfolio",
  "image_position": "right",
  "sort_order": 0,
  "created_at": "2026-11-04T10:00:00.000000Z",
  "updated_at": "2026-11-04T10:00:00.000000Z"
}
```

### Delivery steps

The six `StepCard` records under “How We Build” are a process, not services. Create a separate ordered `delivery_steps` resource rather than adding process-only columns to `services`.

Each delivery step needs:

- `slug`: unique stable identifier.
- `step_label`: the website's `stepTag`, for example `01 // DISCOVERY`.
- `icon_key`: a validated Material Symbols identifier, for example `architecture`.
- `title`: for example `Plan`.
- `description`: plain text or untrusted Markdown returned as text.
- `deliverable`: for example `Technical RFC & Spec`.
- `is_active`: controls public visibility.
- `sort_order`: controls the six-step sequence.
- Standard `created_at` and `updated_at` timestamps.

Add public `GET /api/v1/delivery-steps` and protected admin CRUD under `/api/v1/admin/delivery-steps`. Public responses must include active steps only, ordered by `sort_order` and then ID. Do not add a public detail endpoint unless the website later adds a delivery-step detail page.

Example:

```json
{
  "id": 1,
  "slug": "discovery",
  "step_label": "01 // DISCOVERY",
  "icon_key": "architecture",
  "title": "Plan",
  "description": "Requirements discovery, technical architecture blueprint, database schema planning, API specs, and a milestone-driven roadmap.",
  "deliverable": "Technical RFC & Spec",
  "sort_order": 0,
  "created_at": "2026-11-04T10:00:00.000000Z",
  "updated_at": "2026-11-04T10:00:00.000000Z"
}
```

Do not return `is_active` publicly; expose it only through admin responses.

### Software solution cards

The cards under “Software Solutions Tailored to Your Industry” are solution categories, not core services or delivery steps. Create a separate ordered `solutions` resource.

Each solution needs:

- `slug`: unique stable identifier.
- `icon_key`: a validated Material Symbols identifier, such as `school` or `shopping_cart`.
- `title`: the card heading.
- `description`: the card body.
- `footer_text`: the compact capability line, for example `LMS • Interactive Portals`.
- `emphasis`: enum/string with `normal` or `wide`, defaulting to `normal`.
- `is_active`: controls public visibility.
- `sort_order`: controls card ordering.
- Standard timestamps.

Add public `GET /api/v1/solutions` and protected admin CRUD under `/api/v1/admin/solutions`. Public responses must include active solutions only, ordered by `sort_order` and then ID. Do not add a public detail endpoint unless the website later adds a solution detail page.

The website's `customClasses` and `iconBgClass` must not be stored in the API. Use `emphasis: "wide"` for the final “Custom Software & Bespoke Engines” card, and let the website translate that semantic value into its responsive grid classes. Icon background colors remain website presentation logic.

Example:

```json
{
  "id": 1,
  "slug": "educational-platforms",
  "icon_key": "school",
  "title": "Educational Platforms",
  "description": "Interactive Learning Management Systems (LMS), real-time virtual classroom software, student portals, and grading pipelines.",
  "footer_text": "LMS • Interactive Portals",
  "emphasis": "normal",
  "sort_order": 1,
  "created_at": "2026-11-04T10:00:00.000000Z",
  "updated_at": "2026-11-04T10:00:00.000000Z"
}
```

### Services-page content that should remain in the website

The following are page composition or visual-design concerns and should not be added to backend records:

- Tailwind classes, grid column spans, background color classes, and the `reversed` component implementation.
- The hero gradient, decorative dots, headings, section labels, and general explanatory copy.
- `GetInTouchView`, header, footer, and navigation composition.
- Material icon rendering and CSS color selection. The backend only supplies a validated `icon_key`.

If the owner later needs to edit all section headings and hero copy from the dashboard, that should be a separately designed typed Services-page settings resource. Do not turn the existing singleton settings into an arbitrary key/value or HTML store.

### Existing service fields that the website does not currently display

The large feature rows do not currently display `id`, `slug`, `summary`, `icon_key`, `sort_order`, or timestamps. Keep them. They support compact home-page cards, stable detail URLs, ordering, administration, and API compatibility. `is_active` must remain admin-only.

### Website integration notes

- `FeaturesView`, `HowWeBuildView`, and `SolutionsView` are currently fully hard-coded and do not call the public API. After the backend work is complete, the website must fetch and map the three collections.
- The current API guide correctly documents pagination. The website should request up to 100 records or implement pagination rather than assuming every record is in the first page.
- Empty, loading, malformed-response, and API-error states are needed for each dynamic section.
- Public service and media Markdown/text must continue to be treated as untrusted content; the website must not render unsafe raw HTML.

## Important compatibility notes found in the website models

These are website parsing issues and should not be fixed by making the backend contract less accurate:

- An entry category is nullable in the backend, but the website's `Project` model currently treats it as required.
- A technology's `website_url` is nullable in the backend, but the website's `Technology` model currently casts it to a required `String`.
- The project parser creates an empty cover object when `cover` is null. Published entries currently require a ready cover, but the website should still model the API nullability correctly.
- The projects screen currently fetches real entries but passes hard-coded title, description, bullets, tags, labels, and store URLs to every card. After the backend fields above are available, the website must map each fetched project's values into its `ProjectCard`.
- The team screen already maps most API values correctly, but `roleSubtitle` and `imageAlt` are still hard-coded. `badgeColorClass` should remain website presentation logic.

## Backend completion checklist

- Add MySQL/MariaDB migrations for the new columns and ordered child records.
- Update models, relationships, factories, admin requests, content writing, API resources, and publication/activation guards for projects, team members, services, delivery steps, and solutions.
- Add public and admin behavior tests using real MySQL/MariaDB.
- Keep public ordering, visibility rules, response envelopes, and existing fields backward compatible.
- Update `docs/openapi.yaml`, `docs/api-integration.md`, `docs/website-public-api.md`, and `docs/backend-progress.md` with actual behavior and verification evidence.
- Do not modify `website/`, `dashboard/`, or `packages/portfolio_api/` as part of the backend implementation.
