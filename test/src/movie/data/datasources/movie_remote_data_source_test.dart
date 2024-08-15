import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/errors/exceptions.dart';
import 'package:movie_app/core/util/constants.dart';
import 'package:movie_app/src/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/src/movie/data/models/movie_model.dart';
import 'package:movie_app/src/movie/data/models/video_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MovieRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  const apiKey = 'test_api_key';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource =
        MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  test(
      'should perform a GET request and return a list of MovieModel when the response code is 200',
      () async {
    // Arrange
    final url = Uri.parse('$KBaseUrl/discover/movie?api_key=$apiKey');
    const responseJson =
        '{"results": [{"id": 1, "title": "Test Movie", "original_title": "Test Movie", "overview": "Test Overview", "adult": false, "backdrop_path": "/path.jpg", "poster_path": "/poster.jpg", "popularity": 10.0, "budget": 1000000, "homepage": "http://test.com", "imdb_id": "tt123456", "original_language": "en", "genres": [{"id": 1, "name": "Action"}], "origin_country": ["US"], "production_companies": [{"id": 1, "name": "Company", "origin_country": "US"}]}]}';

    when(() => mockHttpClient.get(url))
        .thenAnswer((_) async => http.Response(responseJson, 200));

    // Act
    final result = await dataSource.getMovies();

    // Assert
    verify(() => mockHttpClient.get(url)).called(1);
    expect(result, isA<List<MovieModel>>());
  });

  test('should throw a ServerException when the response code is not 200',
      () async {
    // Arrange
    final url = Uri.parse('$KBaseUrl/discover/movie?api_key=$apiKey');

    when(() => mockHttpClient.get(url))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));

    // Act
    final call = dataSource.getMovies;

    // Assert
    expect(() => call(), throwsA(isA<ServerException>()));
    verify(() => mockHttpClient.get(url)).called(1);
  });

  test(
      'should throw a ServerException with status code 0 when a network error occurs',
      () async {
    // Arrange
    final url = Uri.parse('$KBaseUrl/discover/movie?api_key=$apiKey');

    when(() => mockHttpClient.get(url)).thenThrow(Exception('Network error'));

    // Act
    final call = dataSource.getMovies;

    // Assert
    expect(() => call(),
        throwsA(predicate((e) => e is ServerException && e.statusCode == 0)));
    verify(() => mockHttpClient.get(url)).called(1);
  });
}
