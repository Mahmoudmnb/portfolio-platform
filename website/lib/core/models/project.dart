import 'category.dart';
import 'cover.dart';
import 'technology.dart';

class Project {
  final int id;
  final String kind;
  final String slug;
  final String title;
  final String? summary;
  final bool featured;
  final int sortOrder;
  final String? repositoryUrl;
  final String? demoUrl;
  final String? externalUrl;
  final Cover cover;
  final Category category;
  final List<Technology> technologies;
  final DateTime? publishedAt;
  final String? seoTitle;
  final String? seoDescription;
  final DateTime createdAt;
  final DateTime updatedAt;

  Project({
    required this.id,
    required this.kind,
    required this.slug,
    required this.title,
    this.summary,
    required this.featured,
    required this.sortOrder,
    this.repositoryUrl,
    this.demoUrl,
    this.externalUrl,
    required this.cover,
    required this.category,
    required this.technologies,
    this.publishedAt,
    this.seoTitle,
    this.seoDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON Map to ProjectModel
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as int? ?? 0,
      kind: json['kind'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String?,
      featured: json['featured'] as bool? ?? false,
      sortOrder: json['sort_order'] as int? ?? 0,
      repositoryUrl: json['repository_url'] as String?,
      demoUrl: json['demo_url'] as String?,
      externalUrl: json['external_url'] as String?,
      cover: Cover.fromJson(json['cover'] as Map<String, dynamic>? ?? {}),
      category: Category.fromJson(json['category'] as Map<String, dynamic>? ?? {}),
      // Safely parsing list of objects
      technologies: (json['technologies'] as List<dynamic>?)
              ?.map((e) => Technology.fromJson(e as Map<String, dynamic>))
              .toList() ?? 
          [],
      publishedAt: json['published_at'] != null 
          ? DateTime.parse(json['published_at'] as String) 
          : null,
      seoTitle: json['seo_title'] as String?,
      seoDescription: json['seo_description'] as String?,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at'] as String) 
          : DateTime.now(),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at'] as String) 
          : DateTime.now(),
    );
  }

  // Convert ProjectModel to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kind': kind,
      'slug': slug,
      'title': title,
      'summary': summary,
      'featured': featured,
      'sort_order': sortOrder,
      'repository_url': repositoryUrl,
      'demo_url': demoUrl,
      'external_url': externalUrl,
      'cover': cover.toJson(),
      'category': category.toJson(),
      'technologies': technologies.map((e) => e.toJson()).toList(),
      'published_at': publishedAt?.toIso8601String(),
      'seo_title': seoTitle,
      'seo_description': seoDescription,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}