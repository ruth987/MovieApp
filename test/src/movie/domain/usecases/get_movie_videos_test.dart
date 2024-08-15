import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/src/movie/domain/entities/video.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movie_videos.dart';
import 'package:dartz/dartz.dart';

// Create a mock class for the MovieRepository
class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovieVideos usecase;
  late MockMovieRepository mockMovieRepository;
  late GetMovieVideosParams t;
  const int tMovieId = 1;

  setUp(() {

    mockMovieRepository = MockMovieRepository();
    usecase = GetMovieVideos(mockMovieRepository);
    t = GetMovieVideosParams(id:tMovieId );
  });


  final List<Video> tVideos = [
    Video(
      id: "65fa45831a3248017d76aec0",
      key: "MCsG9zH7DJE",
      name: "Behind The Scenes vs. Actual Movie Scene",
      site: "YouTube",
      size: 1080,
      type: "Behind the Scenes",
      official: true,
      publishedAt: DateTime.parse("2024-03-17T12:59:46.000Z"),
    ),
    Video(
      id: "65fa53605be00e01496d5493",
      key: "Rvns5DaW-ug",
      name: "Murph Saves The World - Full Scene",
      site: "YouTube",
      size: 1080,
      type: "Clip",
      official: true,
      publishedAt: DateTime.parse("2024-03-16T12:59:46.000Z"),
    ),
  ];

  test('should return a list of videos for the given movie ID from the repository', () async {
    // Arrange
    when(() => mockMovieRepository.getMovieVideos(tMovieId)).thenAnswer((_) async => Right(tVideos));

    // Act
    final result = await usecase(t);

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), tVideos);
    verify(() => mockMovieRepository.getMovieVideos(tMovieId)).called(1);
  });
}
