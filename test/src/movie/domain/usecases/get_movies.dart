import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovies(mockMovieRepository);
  });

  final List<Movie> tMovies = [
    Movie(
      id: 1,
      title: 'Interstellar',
      originalTitle: 'Interstellar',
      overview: 'A group of explorers make use of a newly discovered wormhole...',
      adult: false,
      backdropPath: '/xJHokMbljvjADYdit5fK5VQsXEG.jpg',
      posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      popularity: 215.514,
      budget: 165000000,
      homepage: 'http://www.interstellarmovie.net/',
      imdbId: 'tt0816692',
      originalLanguage: 'en',
      genres: [Genre(id: 12, name: 'Adventure'), Genre(id: 18, name: 'Drama')],
      originCountry: ['US'],
      productionCompanies: [
        ProductionCompany(
          id: 923,
          logoPath: '/8M99Dkt23MjQMTTWukq4m5XsEuo.png',
          name: 'Legendary Pictures',
          originCountry: 'US',
        ),
      ],
    ),
  ];

  test('should return a list of movies from the repository', () async {
    // Arrange
    when(() => mockMovieRepository.getMovies()).thenAnswer((_) async => Right(tMovies));

    // Act
    final result = await usecase();

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), tMovies);
    // expect(result, equals(tMovies));
    verify(() => mockMovieRepository.getMovies()).called(1);
    verifyNoMoreInteractions(MockMovieRepository());
  });
}
