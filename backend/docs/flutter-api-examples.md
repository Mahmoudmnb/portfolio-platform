# Request examples for Flutter and Jaspr integration

Updated 2026-11-23. All paths follow `/api/v1`. These examples use headings from the website brief and sample supporting copy. Review copy, claims, media and legal wording before publishing; they are not an import of the missing `our_website.zip`.

Send JSON with `Accept: application/json`, `Content-Type: application/json` and, for `/admin/*`, `Authorization: Bearer TOKEN_PLACEHOLDER`. Never put a real token in source control. Replace `API_BASE` with an environment-specific base URL.

## Save a fixed page

Each JSON body below is valid for its indicated PUT endpoint. It saves a draft so pasting the example does not publish sample content. Set `status` to `published` explicitly when content is approved. Page creation and update both return 200 with `{ "data": { ... } }`.

```sh
curl -sS -X PUT -H 'Accept: application/json' -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer TOKEN_PLACEHOLDER' \
  --data-binary @home.json "$API_BASE/admin/pages/home"
```

Save the home JSON below to `home.json` before running that command. `featured_entry_ids` is an ordered reference list; replace the empty list with real entry IDs returned by the admin API. `og_image_media_id` must be a ready image ID or null.

### PUT `/admin/pages/home`

<!-- page:home -->
```json
{
  "status": "draft",
  "content": {
    "hero": {
      "eyebrow": "MULTI-PLATFORM SOFTWARE STUDIO",
      "title": "We Build Software That Moves Businesses Forward.",
      "highlighted_text": "Software",
      "description": "Software development for mobile, web and desktop.",
      "primary_cta": {
        "label": "Start Your Project",
        "url": "/contact"
      },
      "secondary_cta": {
        "label": "Explore Our Work",
        "url": "/projects"
      }
    },
    "highlights": [
      {
        "title": "Real-World Products",
        "sort_order": 0
      },
      {
        "title": "Multi-Platform Dev",
        "sort_order": 1
      },
      {
        "title": "End-to-End Delivery",
        "sort_order": 2
      }
    ],
    "service_cards": [
      {
        "title": "Mobile App Development",
        "sort_order": 0
      },
      {
        "title": "Web Development",
        "sort_order": 1
      },
      {
        "title": "Desktop Applications",
        "sort_order": 2
      },
      {
        "title": "UI/UX Design",
        "sort_order": 3
      }
    ],
    "value_propositions": [
      {
        "title": "Built for Real-World Use",
        "sort_order": 0
      },
      {
        "title": "One Team, Multi-Platform",
        "sort_order": 1
      },
      {
        "title": "Scalable Architecture",
        "sort_order": 2
      },
      {
        "title": "From Idea to Release",
        "sort_order": 3
      }
    ],
    "process_steps": [
      {
        "title": "Define & Align",
        "sort_order": 0
      },
      {
        "title": "Plan & Prototype",
        "sort_order": 1
      },
      {
        "title": "Engineered Code",
        "sort_order": 2
      },
      {
        "title": "Rigorous QA",
        "sort_order": 3
      },
      {
        "title": "Deploy & Scale",
        "sort_order": 4
      }
    ],
    "metrics": [],
    "section_headings": {
      "service_cards": {
        "title": "Our Services"
      },
      "featured_projects": {
        "title": "Selected Work"
      }
    },
    "cta": {
      "title": "Have an Idea? Let’s Build It Together.",
      "button_label": "Start Your Project",
      "button_url": "/contact"
    }
  },
  "seo": {
    "title": "Brothers-Tech | Software Development Studio",
    "meta_description": "Software development for mobile, web and desktop.",
    "canonical_url": null,
    "robots_index": true,
    "robots_follow": true
  },
  "og_image_media_id": null,
  "featured_entry_ids": []
}
```

### PUT `/admin/pages/about`

<!-- page:about -->
```json
{
  "status": "draft",
  "content": {
    "intro": {
      "title": "About Brothers-Tech",
      "description": "A software development studio."
    },
    "highlights": [
      {
        "title": "Practitioner-led",
        "sort_order": 0
      },
      {
        "title": "Direct communication",
        "sort_order": 1
      },
      {
        "title": "Multi-platform craft",
        "sort_order": 2
      }
    ],
    "principles": [
      {
        "title": "Product First",
        "sort_order": 0
      },
      {
        "title": "Built for Real Use",
        "sort_order": 1
      },
      {
        "title": "Clean Engineering",
        "sort_order": 2
      },
      {
        "title": "Long-Term Thinking",
        "sort_order": 3
      }
    ],
    "journey_phases": [
      {
        "title": "Learn",
        "sort_order": 0
      },
      {
        "title": "Build",
        "sort_order": 1
      },
      {
        "title": "Ship",
        "sort_order": 2
      },
      {
        "title": "Improve",
        "sort_order": 3
      }
    ],
    "philosophy_items": [
      {
        "title": "Solve a real problem",
        "sort_order": 0
      },
      {
        "title": "Keep it simple to use",
        "sort_order": 1
      },
      {
        "title": "Build for growth",
        "sort_order": 2
      }
    ],
    "specializations": [
      {
        "title": "Mobile",
        "sort_order": 0
      },
      {
        "title": "Web",
        "sort_order": 1
      },
      {
        "title": "Desktop",
        "sort_order": 2
      },
      {
        "title": "UI/UX",
        "sort_order": 3
      }
    ],
    "section_headings": {
      "team_members": {
        "title": "Meet the Team"
      }
    },
    "cta": {
      "title": "Have an Idea? Let’s Build It Together.",
      "button_label": "Start Your Project",
      "button_url": "/contact"
    }
  },
  "seo": {
    "title": "About | Brothers-Tech",
    "meta_description": "Software development for mobile, web and desktop.",
    "canonical_url": null,
    "robots_index": true,
    "robots_follow": true
  },
  "og_image_media_id": null,
  "featured_entry_ids": []
}
```

### PUT `/admin/pages/services`

<!-- page:services -->
```json
{
  "status": "draft",
  "content": {
    "intro": {
      "title": "Our Services",
      "description": "Mobile, web and desktop software development."
    },
    "highlights": [],
    "capabilities": [
      {
        "title": "Mobile Applications",
        "sort_order": 0
      },
      {
        "title": "Web Platforms & Applications",
        "sort_order": 1
      },
      {
        "title": "Dashboards",
        "sort_order": 2
      },
      {
        "title": "Desktop Software",
        "sort_order": 3
      },
      {
        "title": "Operations Workstations",
        "sort_order": 4
      }
    ],
    "solutions": [
      {
        "title": "Business Applications",
        "sort_order": 0
      },
      {
        "title": "Educational Platforms",
        "sort_order": 1
      },
      {
        "title": "Management Systems",
        "sort_order": 2
      },
      {
        "title": "E-commerce Solutions",
        "sort_order": 3
      },
      {
        "title": "Dashboards & Analytics",
        "sort_order": 4
      },
      {
        "title": "Admin Panels",
        "sort_order": 5
      },
      {
        "title": "Custom Software",
        "sort_order": 6
      }
    ],
    "delivery_steps": [
      {
        "title": "Plan",
        "sort_order": 0
      },
      {
        "title": "Design",
        "sort_order": 1
      },
      {
        "title": "Develop",
        "sort_order": 2
      },
      {
        "title": "Test",
        "sort_order": 3
      },
      {
        "title": "Deploy",
        "sort_order": 4
      },
      {
        "title": "Support",
        "sort_order": 5
      }
    ],
    "section_headings": {
      "services": {
        "title": "What We Build"
      }
    },
    "cta": {
      "title": "Have an Idea? Let’s Build It Together.",
      "button_label": "Start Your Project",
      "button_url": "/contact"
    }
  },
  "seo": {
    "title": "Services | Brothers-Tech",
    "meta_description": "Software development for mobile, web and desktop.",
    "canonical_url": null,
    "robots_index": true,
    "robots_follow": true
  },
  "og_image_media_id": null,
  "featured_entry_ids": []
}
```

### PUT `/admin/pages/projects`

<!-- page:projects -->
```json
{
  "status": "draft",
  "content": {
    "intro": {
      "title": "Our Projects",
      "description": "Explore selected software projects."
    },
    "highlights": [],
    "delivery_steps": [],
    "section_headings": {
      "featured_projects": {
        "title": "Selected Work"
      }
    },
    "cta": {
      "title": "Have an Idea? Let’s Build It Together.",
      "button_label": "Start Your Project",
      "button_url": "/contact"
    }
  },
  "seo": {
    "title": "Projects | Brothers-Tech",
    "meta_description": "Software development for mobile, web and desktop.",
    "canonical_url": null,
    "robots_index": true,
    "robots_follow": true
  },
  "og_image_media_id": null,
  "featured_entry_ids": []
}
```

### PUT `/admin/pages/contact`

<!-- page:contact -->
```json
{
  "status": "draft",
  "content": {
    "intro": {
      "title": "Tell Us About Your Project"
    },
    "form": {
      "name_label": "Your Name",
      "email_label": "Work Email",
      "subject_label": "Subject",
      "message_label": "Tell us about your project",
      "submit_label": "Send Message",
      "sending_label": "Sending…",
      "success_message": "Your inquiry has been received.",
      "error_message": "Please try again.",
      "confidentiality_note": "Your inquiry is handled privately.",
      "subject_options": [
        "Mobile application project",
        "Web application project",
        "Other software project"
      ]
    },
    "cta": null
  },
  "seo": {
    "title": "Contact | Brothers-Tech",
    "meta_description": "Software development for mobile, web and desktop.",
    "canonical_url": null,
    "robots_index": true,
    "robots_follow": true
  },
  "og_image_media_id": null,
  "featured_entry_ids": []
}
```

## Public page response

GET `/pages/home` returns 404 until that page is published. Below is a complete representative response captured by the contract test, with a synthetic image identifier/storage key from its disposable database. Media URLs in production come from server configuration.

```json
{
  "data": {
    "page_key": "home",
    "locale": "en",
    "content": {
      "hero": {
        "title": "Fictional studio"
      }
    },
    "seo": {
      "title": "Fictional studio",
      "meta_description": "Fictional page for integration testing.",
      "canonical_url": null,
      "og_title": "Fictional studio",
      "og_description": "Fictional page for integration testing.",
      "twitter_title": null,
      "twitter_description": null,
      "robots_index": true,
      "robots_follow": true,
      "og_image": {
        "id": 1,
        "width": 20,
        "height": 20,
        "url": "http://localhost:8000/storage/da39f1b1-660f-4bc0-8b3c-486f1c46ed5f/display.webp",
        "thumbnail_url": "http://localhost:8000/storage/da39f1b1-660f-4bc0-8b3c-486f1c46ed5f/thumbnail.webp",
        "alt": null,
        "file_size": null,
        "mime_type": "image/webp",
        "display_mime_type": "image/webp"
      }
    },
    "featured_projects": [],
    "created_at": "2026-10-21T09:00:00.000000Z",
    "updated_at": "2026-10-21T09:00:00.000000Z"
  }
}
```

## PUT `/admin/site-settings`

```json
{
  "site_title": "Brothers-Tech",
  "tagline": "Software development studio",
  "introduction": "We build software for mobile, web and desktop.",
  "contact_email": "contact@example.test",
  "availability": "available",
  "default_seo_title": "Brothers-Tech",
  "default_seo_description": "Software development studio.",
  "social_links": [
    {
      "platform": "github",
      "label": "GitHub",
      "url": "https://github.com/example",
      "sort_order": 0,
      "is_visible": true
    }
  ],
  "phone": null,
  "location": null,
  "availability_text": null,
  "logo_media_id": null,
  "logo_light_media_id": null,
  "logo_dark_media_id": null,
  "favicon_media_id": null,
  "navigation": [
    {
      "label": "Home",
      "url": "/",
      "sort_order": 0,
      "is_visible": true,
      "open_in_new_tab": false
    },
    {
      "label": "Work",
      "url": "/projects",
      "sort_order": 1,
      "is_visible": true,
      "open_in_new_tab": false
    }
  ],
  "footer": {
    "description": "Software development studio.",
    "copyright_text": "Brothers-Tech. All rights reserved.",
    "established_year": null,
    "footer_links": [],
    "practice_links": []
  },
  "shared_cta": {
    "title": "Have an Idea? Let’s Build It Together.",
    "button_label": "Start Your Project",
    "button_url": "/contact"
  },
  "legal_links": {
    "privacy_policy_url": null,
    "terms_url": null,
    "security_policy_url": null
  }
}
```

## POST `/admin/entries`

```json
{
  "kind": "project",
  "project_type": "mobile_app",
  "title": "Fictional Field Notes",
  "summary": "An offline notebook demonstration.",
  "description": "An **offline** notebook.",
  "challenge": "Work while connectivity is unavailable.",
  "solution": "Local storage with later synchronization.",
  "outcomes": [
    "Notes can be created offline."
  ],
  "platforms": [
    "android",
    "ios"
  ],
  "store_links": [
    {
      "platform": "android",
      "label": "App listing example",
      "url": "https://example.test/app"
    }
  ],
  "status": "draft",
  "featured": false,
  "sort_order": 0,
  "cover_media_id": null,
  "category_id": null,
  "technology_ids": [],
  "contributor_ids": [],
  "gallery": [],
  "repository_url": null,
  "demo_url": null,
  "external_url": null,
  "seo_title": null,
  "seo_description": null
}
```

## POST `/admin/services`

```json
{
  "title": "Mobile App Development",
  "summary": "Cross-platform application development.",
  "description": "Application development from planning through release.",
  "icon_key": "mobile",
  "features": [
    "Offline workflows",
    "Responsive interfaces"
  ],
  "is_active": false,
  "sort_order": 0,
  "cover_media_id": null,
  "cta_label": "Discuss Your Project",
  "cta_url": "/contact",
  "seo_title": null,
  "seo_description": null
}
```

## PATCH `/admin/media/{id}`

```json
{
  "alt_text": "Mobile notebook showing an offline note"
}
```

## POST `/inquiries`

```json
{
  "name": "Fictional Visitor",
  "email": "visitor@example.test",
  "subject": "Mobile application project",
  "message": "A fictional integration test inquiry.",
  "source_page": "/contact",
  "website": ""
}
```

Entry/service POST returns 201; settings/media updates return 200. Existing entry/service PATCH accepts any subset of their writable fields. Create or select a ready cover and set `status: published` to publish an entry; set `is_active: true` to expose a service. A service cover is optional.

Multipart upload with alt text:

```sh
curl -sS -X POST -H 'Accept: application/json' \
  -H 'Authorization: Bearer TOKEN_PLACEHOLDER' \
  -F 'file=@/path/to/example.png' -F 'alt_text=Mobile notebook screen' \
  "$API_BASE/admin/media"
```

Do not set multipart Content-Type manually; let the HTTP client include its boundary. Poll `/admin/media/{id}` for readiness before attaching the image.

Public project filtering:

```sh
curl -fsS -G -H 'Accept: application/json' "$API_BASE/entries" \
  --data-urlencode 'kind=project' --data-urlencode 'project_type=mobile_app' \
  --data-urlencode 'featured=1' --data-urlencode 'sort=sort_order' \
  --data-urlencode 'page=1' --data-urlencode 'per_page=12'
```

Inquiry POST returns 201 with this unchanged envelope; no bearer token is needed:

```json
{"data":{"message":"Thank you. Your inquiry has been received."}}
```

Validation errors retain the existing shape and dotted field names:

```json
{
  "message": "The given data was invalid.",
  "code": "VALIDATION_ERROR",
  "errors": {"content.hero.title": ["The content.hero.title field is required."]},
  "request_id": "00000000-0000-4000-8000-000000000001"
}
```

Do not depend on exact human-readable validation text. Map by field name and status code. See the change guide for array replacement, nullable fields, publication behavior and unpaginated admin page lists.
