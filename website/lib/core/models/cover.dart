class Cover {
  final int id;
  final int width;
  final int height;
  final String url;
  final String thumbnailUrl;

  Cover({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.thumbnailUrl,
  });

  // Convert JSON Map to CoverModel
  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      id: json['id'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnail_url'] as String? ?? '',
    );
  }

  // Convert CoverModel to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'thumbnail_url': thumbnailUrl,
    };
  }

  // Immutability CopyWith Method
  Cover copyWith({
    int? id,
    int? width,
    int? height,
    String? url,
    String? thumbnailUrl,
  }) {
    return Cover(
      id: id ?? this.id,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}