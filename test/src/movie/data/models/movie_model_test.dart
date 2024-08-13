import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/movie/data/models/movie_model.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';

void main() {
  group('MovieModel', () {
    var testMovieModel = MovieModel(
      id: 1,
      title: 'Interstellar',
      originalTitle: 'Interstellar',
      overview: 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      adult: false,
      backdropPath: '/xJHokMbljvjADYdit5fK5VQsXEG.jpg',
      posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      popularity: 82.0,
      budget: 165000000,
      homepage: 'http://www.interstellarmovie.net/',
      imdbId: 'tt0816692',
      originalLanguage: 'en',
      genres: [GenreModel(id: 18, name: 'Drama')],
      originCountry: ['US'],
      productionCompanies: [ProductionCompanyModel(id: 923, name: 'Paramount Pictures', originCountry: 'US')],
    );

    const movieJson = {
      'id': 1,
      'title': 'Interstellar',
      'original_title': 'Interstellar',
      'overview': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      'adult': false,
      'backdrop_path': '/xJHokMbljvjADYdit5fK5VQsXEG.jpg',
      'poster_path': '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      'popularity': 82.0,
      'budget': 165000000,
      'homepage': 'http://www.interstellarmovie.net/',
      'imdb_id': 'tt0816692',
      'original_language': 'en',
      'genres': [
        {'id': 18, 'name': 'Drama'}
      ],
      'origin_country': ['US'],
      'production_companies': [
        {
          'id': 923,
          'logo_path': null,
          'name': 'Paramount Pictures',
          'origin_country': 'US'
        }
      ],
    };
    test('should be a subclass of Movie entity', () {
      expect(testMovieModel, isA<Movie>());
    });

    test('fromJson should return a valid model', () {
      final result = MovieModel.fromJson(movieJson);
      expect(result, testMovieModel);
    });

    test('toJson should return a valid JSON map', () {
      final result = testMovieModel.toJson();
      expect(result, movieJson);
    });
  });

  group('GenreModel', () {
    var testGenreModel =  GenreModel(id: 18, name: 'Drama');

    const genreJson = {
      'id': 18,
      'name': 'Drama',
    };

    test('fromJson should return a valid model', () {
      final result = GenreModel.fromJson(genreJson);
      expect(result, testGenreModel);
    });

    test('toJson should return a valid JSON map', () {
      final result = testGenreModel.toJson();
      expect(result, genreJson);
    });
  });

  group('ProductionCompanyModel', () {
    var testProductionCompanyModel = ProductionCompanyModel(
      id: 923,
      name: 'Paramount Pictures',
      originCountry: 'US',
    );

    const productionCompanyJson = {
      'id': 923,
      'logo_path': null,
      'name': 'Paramount Pictures',
      'origin_country': 'US',
    };

    test('fromJson should return a valid model', () {
      final result = ProductionCompanyModel.fromJson(productionCompanyJson);
      expect(result, testProductionCompanyModel);
    });

    test('toJson should return a valid JSON map', () {
      final result = testProductionCompanyModel.toJson();
      expect(result, productionCompanyJson);
    });
  });
}
