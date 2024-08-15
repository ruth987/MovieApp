import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/src/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/src/movie/data/models/movie_model.dart';
import 'package:movie_app/src/movie/data/models/video_model.dart';
import 'package:movie_app/src/movie/data/repositories/movie_repository_implementation.dart';

class MockMovieRemoteDataSource extends Mock implements MovieRemoteDataSource {}

void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getMovies', () {
    final tMovieModel = MovieModel(
      id: 1,
      title: 'Test Title',
      originalTitle: 'Test Original Title',
      overview: 'Test Overview',
      adult: false,
      backdropPath: '/path/to/backdrop',
      posterPath: '/path/to/poster',
      popularity: 100.0,
      budget: 1000000,
      homepage: 'https://homepage.com',
      imdbId: 'tt1234567',
      originalLanguage: 'en',
      genres: [],
      originCountry: ['US'],
      productionCompanies: [],
    );
    final List<MovieModel> tMovieModelList = [tMovieModel];

    test(
        'should return list of movies when the call to remote data source is successful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovies())
              .thenAnswer((_) async => tMovieModelList);

          // act
          final result = await repository.getMovies();

          // assert
          verify(() => mockRemoteDataSource.getMovies()).called(1);
          expect(result, equals(Right(tMovieModelList)));
        });

    test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovies()).thenThrow(ServerException(message: 'Failed', statusCode: 400));

          // act
          final result = await repository.getMovies();

          // assert
          verify(() => mockRemoteDataSource.getMovies()).called(1);
          expect(result, equals(Left(ServerFailure(message: 'Failed', statusCode: 400))));
        });
  });

  group('getMovieDetails', () {
    final int tId = 1;
    final tMovieModel = MovieModel(
      id: tId,
      title: 'Test Title',
      originalTitle: 'Test Original Title',
      overview: 'Test Overview',
      adult: false,
      backdropPath: '/path/to/backdrop',
      posterPath: '/path/to/poster',
      popularity: 100.0,
      budget: 1000000,
      homepage: 'https://homepage.com',
      imdbId: 'tt1234567',
      originalLanguage: 'en',
      genres: [],
      originCountry: ['US'],
      productionCompanies: [],
    );

    test(
        'should return movie details when the call to remote data source is successful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovieDetails(tId))
              .thenAnswer((_) async => tMovieModel);

          // act
          final result = await repository.getMovieDetails(tId);

          // assert
          verify(() => mockRemoteDataSource.getMovieDetails(tId)).called(1);
          expect(result, equals(Right(tMovieModel)));
        });

    test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovieDetails(tId))
              .thenThrow(ServerException(message: 'Failed', statusCode: 400));

          // act
          final result = await repository.getMovieDetails(tId);

          // assert
          verify(() => mockRemoteDataSource.getMovieDetails(tId)).called(1);
          expect(result, equals(Left(ServerFailure(message: 'Failed', statusCode: 400))));
        });
  });

  group('getMovieVideos', () {
    final int tId = 1;
    final tVideoModel = VideoModel(
      id: '1',
      name: 'Test Video',
      key: 'key',
      site: 'YouTube',
      size: 720,
      type: 'Trailer',
      official: true,
      publishedAt: DateTime.parse("2023-01-01T00:00:00.000Z"),
    );
    final List<VideoModel> tVideoModelList = [tVideoModel];

    test(
        'should return list of videos when the call to remote data source is successful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovieVideos(tId))
              .thenAnswer((_) async => tVideoModelList);

          // act
          final result = await repository.getMovieVideos(tId);

          // assert
          verify(() => mockRemoteDataSource.getMovieVideos(tId)).called(1);
          expect(result, equals(Right(tVideoModelList)));
        });

    test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
            () async {
          // arrange
          when(() => mockRemoteDataSource.getMovieVideos(tId))
              .thenThrow(ServerException(message: 'Failed', statusCode: 400));

          // act
          final result = await repository.getMovieVideos(tId);

          // assert
          verify(() => mockRemoteDataSource.getMovieVideos(tId)).called(1);
          expect(result, equals(Left(ServerFailure(message: 'Failed', statusCode: 400))));
        });
  });
}
