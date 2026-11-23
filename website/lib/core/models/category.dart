class Category {
  final int id;
  final String slug;
  final String name;
  final String? description;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.slug,
    required this.name,
    this.description,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      sortOrder: json['sort_order'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'description': description,
      'sort_order': sortOrder,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Category copyWith({
    int? id,
    String? slug,
    String? name,
    String? description,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      description: description ?? this.description,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}