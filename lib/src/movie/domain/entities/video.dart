import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;

  Video({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [id];

}
