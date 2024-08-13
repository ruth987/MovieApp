import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movie_details.dart';

class MockMovieRepository extends Mock implements MovieRepository{
}

void main(){
  late GetMovieDetails usecase;
  late MockMovieRepository mockMovieRepository;
  late GetMovieDetailsParams t;
  const int tMovieId = 1;

  setUp((){
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovieDetails(mockMovieRepository);
    t = GetMovieDetailsParams(id: tMovieId);
  });

  final tMovie = Movie(
    id: 1,
    title: "Interstellar",
    originalTitle: "Interstellar",
    overview: "A group of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    adult: false,
    backdropPath: "/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg",
    posterPath: "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
    popularity: 82.965,
    budget: 165000000,
    homepage: "http://www.interstellarmovie.net/",
    imdbId: "tt0816692",
    originalLanguage: "en",
    genres: [Genre(id: 18, name: "Drama"), Genre(id: 878, name: "Science Fiction")],
    originCountry: ["US"],
    productionCompanies: [
      ProductionCompany(
        id: 923,
        logoPath: "/5UQsZrfbfG2dYJbx8DxfoTr2bvn.jpg",
        name: "Legendary Pictures",
        originCountry: "US",
      ),
      ProductionCompany(
        id: 9996,
        logoPath: null,
        name: "Syncopy",
        originCountry: "GB",
      ),
    ],
  );

  test('should return a movie details for the given movie ID from the repository', () async {
    //arrange
    when(()=> mockMovieRepository.getMovieDetails(tMovieId)).thenAnswer((_) async => Right(tMovie));

    //act
    final result = await usecase(t);

    //assert
    expect(result.isRight(), true);
    verify(() => mockMovieRepository.getMovieDetails(tMovieId)).called(1);
    verifyNoMoreInteractions(mockMovieRepository);


  });


}