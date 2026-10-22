// Generated from docs/openapi.yaml by tool/generate_contract.py.
// ignore_for_file: non_constant_identifier_names
// Response types never serve as write payloads.

class Media {
  final int id;
  final int width;
  final int height;
  final String? url;
  final String? thumbnail_url;
  const Media({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.thumbnail_url,
  });
  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json['id'] as int,
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] == null ? null : json['url'] as String,
    thumbnail_url: json['thumbnail_url'] == null
        ? null
        : json['thumbnail_url'] as String,
  );
}

class AdminMedia {
  final int id;
  final int width;
  final int height;
  final String? url;
  final String? thumbnail_url;
  final String status;
  final String original_filename;
  final String mime_type;
  final int bytes;
  final int usage_count;
  final String? failure_message;
  final String created_at;
  final String updated_at;
  const AdminMedia({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.thumbnail_url,
    required this.status,
    required this.original_filename,
    required this.mime_type,
    required this.bytes,
    required this.usage_count,
    required this.failure_message,
    required this.created_at,
    required this.updated_at,
  });
  factory AdminMedia.fromJson(Map<String, dynamic> json) => AdminMedia(
    id: json['id'] as int,
    width: json['width'] as int,
    height: json['height'] as int,
    url: json['url'] == null ? null : json['url'] as String,
    thumbnail_url: json['thumbnail_url'] == null
        ? null
        : json['thumbnail_url'] as String,
    status: json['status'] as String,
    original_filename: json['original_filename'] as String,
    mime_type: json['mime_type'] as String,
    bytes: json['bytes'] as int,
    usage_count: json['usage_count'] as int,
    failure_message: json['failure_message'] == null
        ? null
        : json['failure_message'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class Link {
  final String label;
  final String url;
  final int? sort_order;
  const Link({
    required this.label,
    required this.url,
    required this.sort_order,
  });
  factory Link.fromJson(Map<String, dynamic> json) => Link(
    label: json['label'] as String,
    url: json['url'] as String,
    sort_order: json['sort_order'] == null ? null : json['sort_order'] as int,
  );
}

class Category {
  final int id;
  final String slug;
  final String name;
  final String? description;
  final int sort_order;
  final String created_at;
  final String updated_at;
  const Category({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.sort_order,
    required this.created_at,
    required this.updated_at,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'] as int,
    slug: json['slug'] as String,
    name: json['name'] as String,
    description: json['description'] == null
        ? null
        : json['description'] as String,
    sort_order: json['sort_order'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class Technology {
  final int id;
  final String slug;
  final String name;
  final String? website_url;
  final String created_at;
  final String updated_at;
  const Technology({
    required this.id,
    required this.slug,
    required this.name,
    required this.website_url,
    required this.created_at,
    required this.updated_at,
  });
  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
    id: json['id'] as int,
    slug: json['slug'] as String,
    name: json['name'] as String,
    website_url: json['website_url'] == null
        ? null
        : json['website_url'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class TeamMember {
  final int id;
  final String slug;
  final String name;
  final String role_title;
  final String bio;
  final int sort_order;
  final Media? photo;
  final List<Link> links;
  final String created_at;
  final String updated_at;
  const TeamMember({
    required this.id,
    required this.slug,
    required this.name,
    required this.role_title,
    required this.bio,
    required this.sort_order,
    required this.photo,
    required this.links,
    required this.created_at,
    required this.updated_at,
  });
  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
    id: json['id'] as int,
    slug: json['slug'] as String,
    name: json['name'] as String,
    role_title: json['role_title'] as String,
    bio: json['bio'] as String,
    sort_order: json['sort_order'] as int,
    photo: json['photo'] == null
        ? null
        : Media.fromJson(Map<String, dynamic>.from(json['photo'] as Map)),
    links: (json['links'] as List)
        .map((v) => Link.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class Service {
  final int id;
  final String slug;
  final String title;
  final String summary;
  final String description;
  final String? icon_key;
  final int sort_order;
  final String created_at;
  final String updated_at;
  const Service({
    required this.id,
    required this.slug,
    required this.title,
    required this.summary,
    required this.description,
    required this.icon_key,
    required this.sort_order,
    required this.created_at,
    required this.updated_at,
  });
  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json['id'] as int,
    slug: json['slug'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    description: json['description'] as String,
    icon_key: json['icon_key'] == null ? null : json['icon_key'] as String,
    sort_order: json['sort_order'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class Settings {
  final int id;
  final String site_title;
  final String tagline;
  final String introduction;
  final String contact_email;
  final String availability;
  final String default_seo_title;
  final String default_seo_description;
  final List<Link> social_links;
  final Media? logo;
  final String created_at;
  final String updated_at;
  const Settings({
    required this.id,
    required this.site_title,
    required this.tagline,
    required this.introduction,
    required this.contact_email,
    required this.availability,
    required this.default_seo_title,
    required this.default_seo_description,
    required this.social_links,
    required this.logo,
    required this.created_at,
    required this.updated_at,
  });
  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    id: json['id'] as int,
    site_title: json['site_title'] as String,
    tagline: json['tagline'] as String,
    introduction: json['introduction'] as String,
    contact_email: json['contact_email'] as String,
    availability: json['availability'] as String,
    default_seo_title: json['default_seo_title'] as String,
    default_seo_description: json['default_seo_description'] as String,
    social_links: (json['social_links'] as List)
        .map((v) => Link.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    logo: json['logo'] == null
        ? null
        : Media.fromJson(Map<String, dynamic>.from(json['logo'] as Map)),
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class EntrySummary {
  final int id;
  final String kind;
  final String slug;
  final String title;
  final String summary;
  final bool featured;
  final int sort_order;
  final String? repository_url;
  final String? demo_url;
  final String? external_url;
  final Media? cover;
  final Category? category;
  final List<Technology> technologies;
  final String? published_at;
  final String seo_title;
  final String seo_description;
  final String created_at;
  final String updated_at;
  const EntrySummary({
    required this.id,
    required this.kind,
    required this.slug,
    required this.title,
    required this.summary,
    required this.featured,
    required this.sort_order,
    required this.repository_url,
    required this.demo_url,
    required this.external_url,
    required this.cover,
    required this.category,
    required this.technologies,
    required this.published_at,
    required this.seo_title,
    required this.seo_description,
    required this.created_at,
    required this.updated_at,
  });
  factory EntrySummary.fromJson(Map<String, dynamic> json) => EntrySummary(
    id: json['id'] as int,
    kind: json['kind'] as String,
    slug: json['slug'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    featured: json['featured'] as bool,
    sort_order: json['sort_order'] as int,
    repository_url: json['repository_url'] == null
        ? null
        : json['repository_url'] as String,
    demo_url: json['demo_url'] == null ? null : json['demo_url'] as String,
    external_url: json['external_url'] == null
        ? null
        : json['external_url'] as String,
    cover: json['cover'] == null
        ? null
        : Media.fromJson(Map<String, dynamic>.from(json['cover'] as Map)),
    category: json['category'] == null
        ? null
        : Category.fromJson(Map<String, dynamic>.from(json['category'] as Map)),
    technologies: (json['technologies'] as List)
        .map((v) => Technology.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    published_at: json['published_at'] == null
        ? null
        : json['published_at'] as String,
    seo_title: json['seo_title'] as String,
    seo_description: json['seo_description'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class EntryDetail {
  final int id;
  final String kind;
  final String slug;
  final String title;
  final String summary;
  final bool featured;
  final int sort_order;
  final String? repository_url;
  final String? demo_url;
  final String? external_url;
  final Media? cover;
  final Category? category;
  final List<Technology> technologies;
  final String? published_at;
  final String seo_title;
  final String seo_description;
  final String created_at;
  final String updated_at;
  final String description;
  final List<Map<String, dynamic>> gallery;
  final List<TeamMember> contributors;
  const EntryDetail({
    required this.id,
    required this.kind,
    required this.slug,
    required this.title,
    required this.summary,
    required this.featured,
    required this.sort_order,
    required this.repository_url,
    required this.demo_url,
    required this.external_url,
    required this.cover,
    required this.category,
    required this.technologies,
    required this.published_at,
    required this.seo_title,
    required this.seo_description,
    required this.created_at,
    required this.updated_at,
    required this.description,
    required this.gallery,
    required this.contributors,
  });
  factory EntryDetail.fromJson(Map<String, dynamic> json) => EntryDetail(
    id: json['id'] as int,
    kind: json['kind'] as String,
    slug: json['slug'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    featured: json['featured'] as bool,
    sort_order: json['sort_order'] as int,
    repository_url: json['repository_url'] == null
        ? null
        : json['repository_url'] as String,
    demo_url: json['demo_url'] == null ? null : json['demo_url'] as String,
    external_url: json['external_url'] == null
        ? null
        : json['external_url'] as String,
    cover: json['cover'] == null
        ? null
        : Media.fromJson(Map<String, dynamic>.from(json['cover'] as Map)),
    category: json['category'] == null
        ? null
        : Category.fromJson(Map<String, dynamic>.from(json['category'] as Map)),
    technologies: (json['technologies'] as List)
        .map((v) => Technology.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    published_at: json['published_at'] == null
        ? null
        : json['published_at'] as String,
    seo_title: json['seo_title'] as String,
    seo_description: json['seo_description'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    description: json['description'] as String,
    gallery: (json['gallery'] as List)
        .map((v) => Map<String, dynamic>.from(v as Map))
        .toList(),
    contributors: (json['contributors'] as List)
        .map((v) => TeamMember.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
  );
}

class AdminCategory {
  final int id;
  final String slug;
  final String name;
  final String? description;
  final int sort_order;
  final String created_at;
  final String updated_at;
  const AdminCategory({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.sort_order,
    required this.created_at,
    required this.updated_at,
  });
  factory AdminCategory.fromJson(Map<String, dynamic> json) => AdminCategory(
    id: json['id'] as int,
    slug: json['slug'] as String,
    name: json['name'] as String,
    description: json['description'] == null
        ? null
        : json['description'] as String,
    sort_order: json['sort_order'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class AdminTechnology {
  final int id;
  final String slug;
  final String name;
  final String? website_url;
  final String created_at;
  final String updated_at;
  const AdminTechnology({
    required this.id,
    required this.slug,
    required this.name,
    required this.website_url,
    required this.created_at,
    required this.updated_at,
  });
  factory AdminTechnology.fromJson(Map<String, dynamic> json) =>
      AdminTechnology(
        id: json['id'] as int,
        slug: json['slug'] as String,
        name: json['name'] as String,
        website_url: json['website_url'] == null
            ? null
            : json['website_url'] as String,
        created_at: json['created_at'] as String,
        updated_at: json['updated_at'] as String,
      );
}

class AdminService {
  final int id;
  final String slug;
  final String title;
  final String summary;
  final String description;
  final String? icon_key;
  final int sort_order;
  final String created_at;
  final String updated_at;
  final bool is_active;
  const AdminService({
    required this.id,
    required this.slug,
    required this.title,
    required this.summary,
    required this.description,
    required this.icon_key,
    required this.sort_order,
    required this.created_at,
    required this.updated_at,
    required this.is_active,
  });
  factory AdminService.fromJson(Map<String, dynamic> json) => AdminService(
    id: json['id'] as int,
    slug: json['slug'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    description: json['description'] as String,
    icon_key: json['icon_key'] == null ? null : json['icon_key'] as String,
    sort_order: json['sort_order'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    is_active: json['is_active'] as bool,
  );
}

class AdminTeamMember {
  final int id;
  final String slug;
  final String name;
  final String role_title;
  final String bio;
  final int sort_order;
  final AdminMedia? photo;
  final List<Link> links;
  final String created_at;
  final String updated_at;
  final bool is_active;
  final int? photo_media_id;
  const AdminTeamMember({
    required this.id,
    required this.slug,
    required this.name,
    required this.role_title,
    required this.bio,
    required this.sort_order,
    required this.photo,
    required this.links,
    required this.created_at,
    required this.updated_at,
    required this.is_active,
    required this.photo_media_id,
  });
  factory AdminTeamMember.fromJson(Map<String, dynamic> json) =>
      AdminTeamMember(
        id: json['id'] as int,
        slug: json['slug'] as String,
        name: json['name'] as String,
        role_title: json['role_title'] as String,
        bio: json['bio'] as String,
        sort_order: json['sort_order'] as int,
        photo: json['photo'] == null
            ? null
            : AdminMedia.fromJson(
                Map<String, dynamic>.from(json['photo'] as Map),
              ),
        links: (json['links'] as List)
            .map((v) => Link.fromJson(Map<String, dynamic>.from(v as Map)))
            .toList(),
        created_at: json['created_at'] as String,
        updated_at: json['updated_at'] as String,
        is_active: json['is_active'] as bool,
        photo_media_id: json['photo_media_id'] == null
            ? null
            : json['photo_media_id'] as int,
      );
}

class AdminSettings {
  final int id;
  final String site_title;
  final String tagline;
  final String introduction;
  final String contact_email;
  final String availability;
  final String default_seo_title;
  final String default_seo_description;
  final List<Link> social_links;
  final AdminMedia? logo;
  final String created_at;
  final String updated_at;
  final int? logo_media_id;
  const AdminSettings({
    required this.id,
    required this.site_title,
    required this.tagline,
    required this.introduction,
    required this.contact_email,
    required this.availability,
    required this.default_seo_title,
    required this.default_seo_description,
    required this.social_links,
    required this.logo,
    required this.created_at,
    required this.updated_at,
    required this.logo_media_id,
  });
  factory AdminSettings.fromJson(Map<String, dynamic> json) => AdminSettings(
    id: json['id'] as int,
    site_title: json['site_title'] as String,
    tagline: json['tagline'] as String,
    introduction: json['introduction'] as String,
    contact_email: json['contact_email'] as String,
    availability: json['availability'] as String,
    default_seo_title: json['default_seo_title'] as String,
    default_seo_description: json['default_seo_description'] as String,
    social_links: (json['social_links'] as List)
        .map((v) => Link.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    logo: json['logo'] == null
        ? null
        : AdminMedia.fromJson(Map<String, dynamic>.from(json['logo'] as Map)),
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    logo_media_id: json['logo_media_id'] == null
        ? null
        : json['logo_media_id'] as int,
  );
}

class AdminEntry {
  final int id;
  final String kind;
  final String slug;
  final String title;
  final String summary;
  final bool featured;
  final int sort_order;
  final String? repository_url;
  final String? demo_url;
  final String? external_url;
  final AdminMedia? cover;
  final Category? category;
  final List<Technology> technologies;
  final String? published_at;
  final String seo_title;
  final String seo_description;
  final String created_at;
  final String updated_at;
  final String description;
  final List<Map<String, dynamic>> gallery;
  final List<AdminTeamMember> contributors;
  final String status;
  final int? category_id;
  final int? cover_media_id;
  const AdminEntry({
    required this.id,
    required this.kind,
    required this.slug,
    required this.title,
    required this.summary,
    required this.featured,
    required this.sort_order,
    required this.repository_url,
    required this.demo_url,
    required this.external_url,
    required this.cover,
    required this.category,
    required this.technologies,
    required this.published_at,
    required this.seo_title,
    required this.seo_description,
    required this.created_at,
    required this.updated_at,
    required this.description,
    required this.gallery,
    required this.contributors,
    required this.status,
    required this.category_id,
    required this.cover_media_id,
  });
  factory AdminEntry.fromJson(Map<String, dynamic> json) => AdminEntry(
    id: json['id'] as int,
    kind: json['kind'] as String,
    slug: json['slug'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    featured: json['featured'] as bool,
    sort_order: json['sort_order'] as int,
    repository_url: json['repository_url'] == null
        ? null
        : json['repository_url'] as String,
    demo_url: json['demo_url'] == null ? null : json['demo_url'] as String,
    external_url: json['external_url'] == null
        ? null
        : json['external_url'] as String,
    cover: json['cover'] == null
        ? null
        : AdminMedia.fromJson(Map<String, dynamic>.from(json['cover'] as Map)),
    category: json['category'] == null
        ? null
        : Category.fromJson(Map<String, dynamic>.from(json['category'] as Map)),
    technologies: (json['technologies'] as List)
        .map((v) => Technology.fromJson(Map<String, dynamic>.from(v as Map)))
        .toList(),
    published_at: json['published_at'] == null
        ? null
        : json['published_at'] as String,
    seo_title: json['seo_title'] as String,
    seo_description: json['seo_description'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    description: json['description'] as String,
    gallery: (json['gallery'] as List)
        .map((v) => Map<String, dynamic>.from(v as Map))
        .toList(),
    contributors: (json['contributors'] as List)
        .map(
          (v) => AdminTeamMember.fromJson(Map<String, dynamic>.from(v as Map)),
        )
        .toList(),
    status: json['status'] as String,
    category_id: json['category_id'] == null
        ? null
        : json['category_id'] as int,
    cover_media_id: json['cover_media_id'] == null
        ? null
        : json['cover_media_id'] as int,
  );
}

class Inquiry {
  final int id;
  final String name;
  final String email;
  final String subject;
  final String message;
  final String status;
  final String? internal_note;
  final String submitted_at;
  final String? last_status_changed_at;
  final String created_at;
  final String updated_at;
  const Inquiry({
    required this.id,
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.status,
    required this.internal_note,
    required this.submitted_at,
    required this.last_status_changed_at,
    required this.created_at,
    required this.updated_at,
  });
  factory Inquiry.fromJson(Map<String, dynamic> json) => Inquiry(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    subject: json['subject'] as String,
    message: json['message'] as String,
    status: json['status'] as String,
    internal_note: json['internal_note'] == null
        ? null
        : json['internal_note'] as String,
    submitted_at: json['submitted_at'] as String,
    last_status_changed_at: json['last_status_changed_at'] == null
        ? null
        : json['last_status_changed_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

class AuditEvent {
  final int id;
  final int? actor_id;
  final String action;
  final String entity_type;
  final int entity_id;
  final Map<String, dynamic> summary;
  final String created_at;
  const AuditEvent({
    required this.id,
    required this.actor_id,
    required this.action,
    required this.entity_type,
    required this.entity_id,
    required this.summary,
    required this.created_at,
  });
  factory AuditEvent.fromJson(Map<String, dynamic> json) => AuditEvent(
    id: json['id'] as int,
    actor_id: json['actor_id'] == null ? null : json['actor_id'] as int,
    action: json['action'] as String,
    entity_type: json['entity_type'] as String,
    entity_id: json['entity_id'] as int,
    summary: Map<String, dynamic>.from(json['summary'] as Map),
    created_at: json['created_at'] as String,
  );
}

class User {
  final int id;
  final String name;
  final String email;
  const User({required this.id, required this.name, required this.email});
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

class LoginResult {
  final String token;
  final String token_type;
  final String expires_at;
  final User user;
  const LoginResult({
    required this.token,
    required this.token_type,
    required this.expires_at,
    required this.user,
  });
  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
    token: json['token'] as String,
    token_type: json['token_type'] as String,
    expires_at: json['expires_at'] as String,
    user: User.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
  );
}

class Totals {
  final int page_view;
  final int entry_view;
  final int contact_click;
  const Totals({
    required this.page_view,
    required this.entry_view,
    required this.contact_click,
  });
  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
    page_view: json['page_view'] as int,
    entry_view: json['entry_view'] as int,
    contact_click: json['contact_click'] as int,
  );
}

class AnalyticsMeta {
  final String start_date;
  final String end_date;
  final int retention_days;
  const AnalyticsMeta({
    required this.start_date,
    required this.end_date,
    required this.retention_days,
  });
  factory AnalyticsMeta.fromJson(Map<String, dynamic> json) => AnalyticsMeta(
    start_date: json['start_date'] as String,
    end_date: json['end_date'] as String,
    retention_days: json['retention_days'] as int,
  );
}

class PaginationMeta {
  final int current_page;
  final int per_page;
  final int last_page;
  final int total;
  const PaginationMeta({
    required this.current_page,
    required this.per_page,
    required this.last_page,
    required this.total,
  });
  factory PaginationMeta.fromJson(Map<String, dynamic> json) => PaginationMeta(
    current_page: json['current_page'] as int,
    per_page: json['per_page'] as int,
    last_page: json['last_page'] as int,
    total: json['total'] as int,
  );
}
