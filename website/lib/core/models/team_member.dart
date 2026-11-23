class TeamMember {
  final int id;
  final String slug;
  final String name;
  final String roleTitle;
  final String bio;
  final int sortOrder;
  final Photo? photo;
  final List<DeveloperLink> links;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TeamMember({
    required this.id,
    required this.slug,
    required this.name,
    required this.roleTitle,
    required this.bio,
    required this.sortOrder,
    this.photo,
    required this.links,
    this.createdAt,
    this.updatedAt,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
      roleTitle: json['role_title'] as String,
      bio: json['bio'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
      photo: json['photo'] != null ? Photo.fromJson(json['photo'] as Map<String, dynamic>) : null,
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => DeveloperLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'role_title': roleTitle,
        'bio': bio,
        'sort_order': sortOrder,
        'photo': photo?.toJson(),
        'links': links.map((e) => e.toJson()).toList(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class Photo {
  final int id;
  final int width;
  final int height;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'width': width,
        'height': height,
        'url': url,
        'thumbnail_url': thumbnailUrl,
      };
}

class DeveloperLink {
  final String label;
  final String url;
  final int sortOrder;

  const DeveloperLink({
    required this.label,
    required this.url,
    required this.sortOrder,
  });

  factory DeveloperLink.fromJson(Map<String, dynamic> json) {
    return DeveloperLink(
      label: json['label'] as String,
      url: json['url'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'url': url,
        'sort_order': sortOrder,
      };
}