import 'package:movie_app/src/movie/domain/entities/movie.dart';

class MovieModel extends Movie  {
  MovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.adult,
    required super.backdropPath,
    required super.posterPath,
    required super.popularity,
    required super.budget,
    required super.homepage,
    required super.imdbId,
    required super.originalLanguage,
    required List<GenreModel> super.genres,
    required super.originCountry,
    required List<ProductionCompanyModel> super.productionCompanies,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      popularity: json['popularity'],
      budget: json['budget'],
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      genres: (json['genres'] as List)
          .map((genre) => GenreModel.fromJson(genre))
          .toList(),
      originCountry: List<String>.from(json['origin_country']),
      productionCompanies: (json['production_companies'] as List)
          .map((company) => ProductionCompanyModel.fromJson(company))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'adult': adult,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'popularity': popularity,
      'budget': budget,
      'homepage': homepage,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'genres': genres.map((genre) => (genre as GenreModel).toJson()).toList(),
      'origin_country': originCountry,
      'production_companies': productionCompanies
          .map((company) => (company as ProductionCompanyModel).toJson())
          .toList(),
    };
  }
}



class GenreModel extends Genre {
  GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class ProductionCompanyModel extends ProductionCompany {
  ProductionCompanyModel({
    required super.id,
    super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}