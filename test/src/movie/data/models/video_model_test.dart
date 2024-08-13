import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/movie/data/models/video_model.dart';
import 'package:movie_app/src/movie/domain/entities/video.dart';

void main() {
  final tVideoModel = VideoModel(
    id: '123',
    name: 'Sample Video',
    key: 'abc123',
    site: 'YouTube',
    size: 1080,
    type: 'Trailer',
    official: true,
    publishedAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
  );

  final tJson = {
    'id': '123',
    'name': 'Sample Video',
    'key': 'abc123',
    'site': 'YouTube',
    'size': 1080,
    'type': 'Trailer',
    'official': true,
    'published_at': '2023-01-01T00:00:00.000Z',
  };

  group('VideoModel', () {
    test('should be a subclass of Video entity', () {
      expect(tVideoModel, isA<Video>());
    });

    test('fromJson should return a valid model', () {
      // Act
      final result = VideoModel.fromJson(tJson);

      // Assert
      expect(result, tVideoModel);
    });

    test('toJson should return a valid JSON map', () {
      // Act
      final result = tVideoModel.toJson();

      // Assert
      expect(result, tJson);
    });
  });

}
