## Introduction

This document defines the first phase of integrating the Brothers-Tech website with its backend. The goal is to make reusable website data dynamic and manageable through the backend, while keeping the existing design, layout, and static content unchanged.

It identifies the required data, properties, API endpoints, and expected response structures to ensure a clear integration between the Jaspr frontend and backend.

The integration will be implemented incrementally, starting with repeated content such as projects, team members, services, and other reusable records.


### Home Page — Featured Projects

**Endpoint:** `GET /api/v1/featured-projects`

The Home page contains a Featured Projects section consisting of one primary project and multiple normal projects.

The section heading and description will remain static in the frontend. Only the project data will be retrieved from the backend.

**Response structure:**

- `data.primary`: One primary project object.
- `data.normal`: An array of normal project objects.

**Each project must provide:**

- `id`
- `categories`: Array of category names.
- `title`
- `subtitle`
- `description`
- `points`: Array of highlighted text items (optional).
- `chips`: Array of feature/tag labels.
- `links`: Array containing `label`, `url`, and `icon`.
- `primary_image`: Main image object containing `url`, `alt`, `width`, and `height`.
- `secondary_images`: Optional array of image objects, each containing `url`, `alt`, and `position` (`top`, `bottom`, `left`, `right`).
- `sort_order` for normal projects.

**Backend requirements:**

- Return one primary project and multiple normal projects.
- Return normal projects in their configured display order.
- Return absolute HTTPS image URLs.
- Support projects without secondary images or external links.
- Return only published projects.
- Use consistent JSON structures for both project types wherever possible.

The frontend will use `PrimarySelectedWorkCard` for the primary project and `SelectedWorkCard` for normal projects. All existing layouts, styles, and image-positioning behavior will remain in Jaspr.

## Home Page — What We Do (Services)

### 1. Objective

Make the four service cards dynamic by retrieving their content from the backend.

The existing section heading, subtitle, description, layout, and styling will remain static in the Jaspr frontend.

### 2. API Endpoint

**GET** `/api/v1/services`

This endpoint returns the services displayed on the Home page, ordered according to their configured display order.

### 3. Required Service Properties

Each service should contain:

| Property | Type | Description |
|---|---|---|
| `id` | Integer | Unique service identifier |
| `title` | String | Service title |
| `description` | String | Service description |
| `icon` | String | Icon identifier used by the frontend |
| `chips` | Array of strings | Small labels displayed on the service card |
| `sort_order` | Integer | Controls the card's display order |

### 4. Expected API Response

```json
{
  "data": [
    {
      "id": 1,
      "title": "Mobile App Development",
      "description": "High-quality Android and iOS applications designed for rapid performance, native gesture fidelity, and faultless offline resilience.",
      "icon": "smartphone",
      "chips": [
        "Android",
        "iOS",
        "Cross-platform"
      ],
      "sort_order": 1
    },
    {
      "id": 2,
      "title": "Web Development",
      "description": "Modern websites, dynamic web applications, dashboards, and enterprise platforms architected for ultra-low latency and search discovery.",
      "icon": "web",
      "chips": [
        "Web Apps",
        "Dashboards",
        "Business Platforms"
      ],
      "sort_order": 2
    }
  ]
}
```

*The response above shows two examples; the endpoint should return all four services.*

### 5. Frontend Integration Notes

- Fetch services from `GET /api/v1/services`.
- Generate one `ServiceCard` for each returned service.
- Map `title`, `description`, `icon`, and `chips` directly to the corresponding component properties.
- Generate `count` from the card's position in the returned list (starting from 1). It does not need to come from the backend.
- Keep the section heading and introductory text in the frontend.
- The backend should return only services intended for public display, already ordered by `sort_order`.

### 6. Scope

This integration only requires a public read endpoint. No create, update, or delete functionality is required for this phase.



## Services Page — How We Build (Process Steps)

### 1. Objective

Make the six process cards dynamic by retrieving their content from the backend.

The section heading, introductory text, layout, and styling will remain static in the Jaspr frontend.

### 2. API Endpoint

**GET** `/api/v1/process-steps`

Returns the process stages in their correct display order.

### 3. Required Properties

| Property | Type | Description |
|---|---|---|
| `id` | Integer | Unique process step identifier |
| `step_number` | Integer | Step number (1, 2, 3, etc.) |
| `stage` | String | Stage label, e.g. DISCOVERY |
| `icon` | String | Icon identifier used by the frontend |
| `title` | String | Step title, e.g. Plan |
| `description` | String | Explanation of the process step |
| `deliverable` | String | Expected output of this stage |

### 4. Expected API Response

```json
{
  "data": [
    {
      "id": 1,
      "step_number": 1,
      "stage": "DISCOVERY",
      "icon": "architecture",
      "title": "Plan",
      "description": "Requirements discovery, technical architecture blueprint, database schema planning, API specs, and a milestone-driven roadmap.",
      "deliverable": "Technical RFC & Spec"
    },
    {
      "id": 2,
      "step_number": 2,
      "stage": "PROTOTYPING",
      "icon": "palette",
      "title": "Design",
      "description": "User journey mapping, wireframing, high-fidelity UI design, tokenized design systems, and interactive clickable prototypes in Figma.",
      "deliverable": "Design Tokens & Prototypes"
    }
  ]
}
```

*The response above contains two examples. The endpoint should return all six process steps.*

### 5. Frontend Integration Notes

- Fetch the steps from `GET /api/v1/process-steps`.
- Generate one `StepCard` for each returned record.
- Format `stepTag` in the frontend using `step_number` and `stage`, for example: `01 // DISCOVERY`.
- Map `icon`, `title`, `description`, and `deliverable` to the corresponding `StepCard` properties.
- Keep the section heading and introductory text static.
- The backend must return the steps in the correct order.

### 6. Scope

Only a public read endpoint is required. No create, update, or delete functionality is needed in this phase.


## Projects Page — Projects

### 1. Objective

Make the Projects page dynamic by retrieving project information from the backend.

The page contains:
- One primary project, displayed separately.
- Multiple normal projects, displayed in the projects grid.

The existing page layout, project card design, and styling will remain in the Jaspr frontend.

### 2. API Endpoint

**GET** `/api/v1/projects`

The endpoint returns the primary project separately from the normal projects.

### 3. Required Project Properties

Both primary and normal projects should use the same data structure.

| Property | Type | Description |
|---|---|---|
| `id` | Integer | Unique project identifier |
| `title` | String | Project title |
| `description` | String | Project description |
| `type` | String | Project type: `primary` or `normal` |
| `category` | String | Category identifier used for frontend filtering, e.g. `mobile` |
| `category_label` | String | Display label, e.g. `MEDICAL EDUCATION` |
| `platform_label` | String | Platform information, e.g. `Mobile • iOS & Android` |
| `image_url` | String | Main project image URL |
| `image_alt` | String | Accessible description of the project image |
| `bullet_points` | Array of strings | Project features or key achievements |
| `tags` | Array of strings | Technology or feature labels displayed on the card |
| `android_url` | String or null | Google Play link, if available |
| `ios_url` | String or null | App Store link, if available |
| `sort_order` | Integer | Display order among normal projects |

### 4. Expected API Response

```json
{
  "data": {
    "primary": {
      "id": 1,
      "title": "Prime - Medical Education Platform",
      "description": "Mobile learning platform for medical students at Aleppo University.",
      "type": "primary",
      "category": "mobile",
      "category_label": "MEDICAL EDUCATION",
      "platform_label": "Mobile • iOS & Android",
      "image_url": "https://example.com/images/prime_all.png",
      "image_alt": "Prime medical education platform on desktop and mobile devices",
      "bullet_points": [
        "Built question banks, previous exams, videos, PDFs, and learning resources.",
        "Integrated an AI assistant and offline content access.",
        "Implemented content encryption."
      ],
      "tags": [
        "AI Integration",
        "Encryption",
        "Videos & PDFs",
        "Offline Access"
      ],
      "android_url": "https://play.google.com/store/apps/details?id=com.brothers.prime",
      "ios_url": "https://apps.apple.com/us/app/prime/id6758918919"
    },
    "projects": [
      {
        "id": 2,
        "title": "Ala Al-Nadha — Multi-Service Delivery Platform",
        "description": "Multi-service platform for food delivery, grocery shopping, and cleaning services across Aleppo.",
        "type": "normal",
        "category": "mobile",
        "category_label": "DELIVERY PLATFORM",
        "platform_label": "Mobile • iOS & Android",
        "image_url": "https://example.com/images/al-nadha_all.png",
        "image_alt": "Ala Al-Nadha delivery platform on desktop and mobile devices",
        "bullet_points": [
          "Developed restaurant, supermarket, and cleaning-service ordering flows within one application.",
          "Built smart voice search for Arabic speech.",
          "Implemented location-based delivery and order management."
        ],
        "tags": [
          "Voice Search",
          "Location Services",
          "Order Management"
        ],
        "android_url": "https://play.google.com/store/apps/details?id=com.alnadha.app",
        "ios_url": "https://play.google.com/store/apps/details?id=com.alnadha.app",
        "sort_order": 1
      }
    ]
  }
}
```

*The response contains examples. The endpoint should return all available normal projects.*

### 5. Frontend Integration Notes

- Fetch projects from `GET /api/v1/projects`.
- Display `data.primary` as the primary project.
- Generate normal project cards from `data.projects`.
- Map the response properties to the existing `ProjectCard` parameters:
  - `category` → `dataCategories`
  - `image_url` → `imageSrc`
  - `image_alt` → `imageAlt`
  - `platform_label` → `platformLabel`
  - `category_label` → `categoryLabel`
  - `bullet_points` → `bulletPoints`
  - `tags` → `tags`
  - `android_url` → `androidUrl`
  - `ios_url` → `iosUrl`
- Optional store links should be nullable. Do not display their buttons when no URL is available.
- Display normal projects according to `sort_order`.
- Keep the primary project separate from the normal project grid.

### 6. Backend Requirements

- Return at most one primary project.
- Return only projects intended for public display.
- Return normal projects in their configured display order.
- Use the same project properties for both project types.
- Return `null` for unavailable store links instead of empty strings.

### 7. Scope

Only a public read endpoint is required. No create, update, or delete functionality is needed in this phase.

## About Page — Team Members

### 1. Objective

Make the team member cards dynamic by retrieving team information from the backend.

The existing section heading, introductory text, layout, and styling will remain static in the Jaspr frontend.

### 2. API Endpoint

**GET** `/api/v1/team-members`

Returns the team members intended to be displayed on the About page.

### 3. Required Team Member Properties

| Property | Type | Description |
|---|---|---|
| `id` | Integer | Unique team member identifier |
| `name` | String | Full name |
| `role_tag` | String | Uppercase role label displayed on the card |
| `role_subtitle` | String | Full role description or title |
| `bio` | String | Short professional biography |
| `image_url` | String | Team member portrait URL |
| `image_alt` | String | Accessible description of the portrait |
| `social_links` | Array of objects | Social media links |
| `sort_order` | Integer | Controls the display order |

Each object inside `social_links` contains:

| Property | Type | Description |
|---|---|---|
| `label` | String | Social platform name, e.g. LinkedIn |
| `url` | String | Profile URL |

### 4. Expected API Response

```json
{
  "data": [
    {
      "id": 1,
      "name": "Mahmoud Bannan",
      "role_tag": "FOUNDER / MOBILE DEVELOPER / BACK-END DEVELOPER",
      "role_subtitle": "FOUNDER & Mobile Developer & Back-end Developer",
      "bio": "Building reliable mobile applications and robust back-end systems with a focus on clean architecture, performance, and maintainable code.",
      "image_url": "https://example.com/images/mahmoud.png",
      "image_alt": "Portrait of Mahmoud Bannan",
      "social_links": [
        {
          "label": "LinkedIn",
          "url": "https://www.linkedin.com/in/mahmoudbannan"
        },
        {
          "label": "GitHub",
          "url": "https://github.com/Mahmoudmnb"
        }
      ],
      "sort_order": 1
    },
    {
      "id": 2,
      "name": "Mohammed Deeb Jalab",
      "role_tag": "FOUNDER / MOBILE DEVELOPER / FRONT-END WEB DEVELOPER",
      "role_subtitle": "FOUNDER & Mobile Developer & Front-end Web Developer",
      "bio": "Building polished mobile applications and responsive web experiences with clean code, intuitive interfaces, and dependable performance.",
      "image_url": "https://example.com/images/mohammed.jpg",
      "image_alt": "Portrait of Mohammed Deeb Jalab",
      "social_links": [
        {
          "label": "LinkedIn",
          "url": "https://www.linkedin.com/in/mouhammed-deeb-jalab"
        },
        {
          "label": "GitHub",
          "url": "https://github.com/Mohamed-Jalab"
        }
      ],
      "sort_order": 2
    }
  ]
}
```

### 5. Frontend Integration Notes

- Fetch team members from `GET /api/v1/team-members`.
- Generate one `TeamMemberCard` for each returned record.
- Map the API properties to the existing component:
  - `name` → `name`
  - `role_tag` → `roleTag`
  - `role_subtitle` → `roleSubtitle`
  - `bio` → `bio`
  - `image_url` → `imageSrc`
  - `image_alt` → `imageAlt`
  - `social_links` → `socialLinks`
- Display members according to `sort_order`.
- Keep `badgeColorClass` as frontend presentation logic. It does not need to come from the backend.
- Keep the section heading and introductory text static.

### 6. Backend Requirements

- Return only team members intended for public display.
- Return members in their configured display order.
- Support multiple social links per member.
- Allow an empty `social_links` array when a member has no public social profiles.
- Provide a valid image URL for every displayed member.

### 7. Scope

Only a public read endpoint is required. No create, update, or delete functionality is needed in this phase.
