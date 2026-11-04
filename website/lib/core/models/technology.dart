class Technology {
  final int id;
  final String slug;
  final String name;
  final String websiteUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Technology({
    required this.id,
    required this.slug,
    required this.name,
    required this.websiteUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON Map to CategoryModel
  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      id: json['id'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
      websiteUrl: json['website_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // Convert CategoryModel to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'website_url': websiteUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
