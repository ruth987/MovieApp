
import '../../domain/entities/video.dart';

class VideoModel extends Video {
  VideoModel({
    required super.id,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required super.publishedAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'published_at': publishedAt.toIso8601String(),
    };
  }
}
