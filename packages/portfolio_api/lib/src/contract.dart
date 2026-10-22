// Generated contract metadata; no response serialization.
const writeSchemas = <String, Map<String, dynamic>>{
  "EntryCreate": {
    "type": "object",
    "properties": {
      "kind": {
        "type": "string",
        "enum": ["project", "product"],
      },
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "title": {"type": "string", "maxLength": 180},
      "summary": {"type": "string", "maxLength": 500},
      "featured": {"type": "boolean"},
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "repository_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "demo_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "external_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "description": {"type": "string", "maxLength": 50000},
      "status": {
        "type": "string",
        "enum": ["draft", "published", "archived"],
      },
      "published_at": {
        "type": ["string", "null"],
        "format": "date-time",
      },
      "category_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "cover_media_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "technology_ids": {
        "type": "array",
        "items": {"type": "integer", "minimum": 1},
        "maxItems": 30,
        "uniqueItems": true,
      },
      "contributor_ids": {
        "type": "array",
        "items": {"type": "integer", "minimum": 1},
        "maxItems": 30,
        "uniqueItems": true,
      },
      "gallery": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "media_id": {"type": "integer", "minimum": 1},
            "alt_text": {"type": "string", "maxLength": 500},
            "sort_order": {
              "type": "integer",
              "minimum": -1000000,
              "maximum": 1000000,
            },
          },
          "required": ["media_id", "alt_text"],
          "additionalProperties": false,
        },
        "maxItems": 20,
      },
    },
    "required": ["kind", "title", "summary", "description"],
    "additionalProperties": false,
  },
  "EntryPatch": {
    "type": "object",
    "properties": {
      "kind": {
        "type": "string",
        "enum": ["project", "product"],
      },
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "title": {"type": "string", "maxLength": 180},
      "summary": {"type": "string", "maxLength": 500},
      "featured": {"type": "boolean"},
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "repository_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "demo_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "external_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
      "description": {"type": "string", "maxLength": 50000},
      "status": {
        "type": "string",
        "enum": ["draft", "published", "archived"],
      },
      "published_at": {
        "type": ["string", "null"],
        "format": "date-time",
      },
      "category_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "cover_media_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "technology_ids": {
        "type": "array",
        "items": {"type": "integer", "minimum": 1},
        "maxItems": 30,
        "uniqueItems": true,
      },
      "contributor_ids": {
        "type": "array",
        "items": {"type": "integer", "minimum": 1},
        "maxItems": 30,
        "uniqueItems": true,
      },
      "gallery": {
        "type": "array",
        "items": {
          "type": "object",
          "properties": {
            "media_id": {"type": "integer", "minimum": 1},
            "alt_text": {"type": "string", "maxLength": 500},
            "sort_order": {
              "type": "integer",
              "minimum": -1000000,
              "maximum": 1000000,
            },
          },
          "required": ["media_id", "alt_text"],
          "additionalProperties": false,
        },
        "maxItems": 20,
      },
    },
    "required": [],
    "additionalProperties": false,
    "description": "Omitted fields remain unchanged. Null clears only nullable fields. Supplied relation/link arrays replace the entire set; [] clears. Last write wins; refetch after update. Related media must be ready. Explicit slugs must be unique; title updates never regenerate slugs.",
  },
  "CategoryCreate": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "description": {
        "type": ["string", "null"],
        "maxLength": 1000,
      },
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
    },
    "required": ["name"],
    "additionalProperties": false,
  },
  "CategoryPatch": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "description": {
        "type": ["string", "null"],
        "maxLength": 1000,
      },
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
    },
    "required": [],
    "additionalProperties": false,
    "description": "Omitted fields remain unchanged. Null clears only nullable fields. Supplied relation/link arrays replace the entire set; [] clears. Last write wins; refetch after update. Related media must be ready. Explicit slugs must be unique; title updates never regenerate slugs.",
  },
  "TechnologyCreate": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "website_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
    },
    "required": ["name"],
    "additionalProperties": false,
  },
  "TechnologyPatch": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "website_url": {
        "type": ["string", "null"],
        "maxLength": 2048,
        "format": "uri",
      },
    },
    "required": [],
    "additionalProperties": false,
    "description": "Omitted fields remain unchanged. Null clears only nullable fields. Supplied relation/link arrays replace the entire set; [] clears. Last write wins; refetch after update. Related media must be ready. Explicit slugs must be unique; title updates never regenerate slugs.",
  },
  "TeamMemberCreate": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "role_title": {"type": "string", "maxLength": 180},
      "bio": {"type": "string", "maxLength": 10000},
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "links": {
        "type": "array",
        "items": {"\$ref": "#/components/schemas/Link"},
        "maxItems": 10,
      },
      "photo_media_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "is_active": {"type": "boolean"},
    },
    "required": ["name", "role_title", "bio"],
    "additionalProperties": false,
  },
  "TeamMemberPatch": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "name": {"type": "string", "maxLength": 120},
      "role_title": {"type": "string", "maxLength": 180},
      "bio": {"type": "string", "maxLength": 10000},
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "links": {
        "type": "array",
        "items": {"\$ref": "#/components/schemas/Link"},
        "maxItems": 10,
      },
      "photo_media_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
      "is_active": {"type": "boolean"},
    },
    "required": [],
    "additionalProperties": false,
    "description": "Omitted fields remain unchanged. Null clears only nullable fields. Supplied relation/link arrays replace the entire set; [] clears. Last write wins; refetch after update. Related media must be ready. Explicit slugs must be unique; title updates never regenerate slugs.",
  },
  "ServiceCreate": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "title": {"type": "string", "maxLength": 180},
      "summary": {"type": "string", "maxLength": 500},
      "description": {"type": "string", "maxLength": 20000},
      "icon_key": {
        "type": ["string", "null"],
        "maxLength": 80,
        "pattern": "^[a-z][a-z0-9_-]*\$",
      },
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "is_active": {"type": "boolean"},
    },
    "required": ["title", "summary", "description"],
    "additionalProperties": false,
  },
  "ServicePatch": {
    "type": "object",
    "properties": {
      "slug": {
        "type": "string",
        "maxLength": 160,
        "pattern": "^[a-z0-9]+(?:-[a-z0-9]+)*\$",
      },
      "title": {"type": "string", "maxLength": 180},
      "summary": {"type": "string", "maxLength": 500},
      "description": {"type": "string", "maxLength": 20000},
      "icon_key": {
        "type": ["string", "null"],
        "maxLength": 80,
        "pattern": "^[a-z][a-z0-9_-]*\$",
      },
      "sort_order": {
        "type": "integer",
        "minimum": -1000000,
        "maximum": 1000000,
      },
      "is_active": {"type": "boolean"},
    },
    "required": [],
    "additionalProperties": false,
    "description": "Omitted fields remain unchanged. Null clears only nullable fields. Supplied relation/link arrays replace the entire set; [] clears. Last write wins; refetch after update. Related media must be ready. Explicit slugs must be unique; title updates never regenerate slugs.",
  },
  "SettingsCreate": {
    "type": "object",
    "properties": {
      "site_title": {"type": "string", "maxLength": 180},
      "tagline": {"type": "string", "maxLength": 500},
      "introduction": {"type": "string", "maxLength": 10000},
      "contact_email": {"type": "string", "maxLength": 254, "format": "email"},
      "availability": {
        "type": "string",
        "enum": ["available", "limited", "unavailable"],
      },
      "default_seo_title": {"type": "string", "maxLength": 180},
      "default_seo_description": {"type": "string", "maxLength": 500},
      "social_links": {
        "type": "array",
        "items": {"\$ref": "#/components/schemas/Link"},
        "maxItems": 10,
      },
      "logo_media_id": {
        "type": ["integer", "null"],
        "minimum": 1,
      },
    },
    "required": [
      "site_title",
      "tagline",
      "introduction",
      "contact_email",
      "availability",
      "default_seo_title",
      "default_seo_description",
      "social_links",
    ],
    "additionalProperties": false,
  },
  "InquiryUpdate": {
    "type": "object",
    "properties": {
      "status": {
        "type": "string",
        "enum": ["new", "read", "replied", "archived"],
      },
      "internal_note": {
        "type": ["string", "null"],
        "maxLength": 5000,
      },
    },
    "required": [],
    "additionalProperties": false,
  },
  "Login": {
    "type": "object",
    "properties": {
      "email": {"type": "string", "maxLength": 254, "format": "email"},
      "password": {"type": "string", "maxLength": 1024},
      "device_name": {"type": "string", "maxLength": 120},
    },
    "required": ["email", "password", "device_name"],
    "additionalProperties": false,
  },
  "PasswordUpdate": {
    "type": "object",
    "properties": {
      "current_password": {"type": "string", "maxLength": 1024},
      "password": {
        "type": "string",
        "maxLength": 72,
        "minLength": 12,
        "description": "At least 12 characters, mixed case and numbers; maximum 72 UTF-8 bytes for bcrypt.",
      },
      "password_confirmation": {"type": "string", "maxLength": 1024},
    },
    "required": ["current_password", "password", "password_confirmation"],
    "additionalProperties": false,
  },
};
