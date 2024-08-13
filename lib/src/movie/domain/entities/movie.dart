import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final bool adult;
  final String backdropPath;
  final String posterPath;
  final double popularity;
  final int budget;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final List<Genre> genres;
  final List<String> originCountry;
  final List<ProductionCompany> productionCompanies;

  const Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.adult,
    required this.backdropPath,
    required this.posterPath,
    required this.popularity,
    required this.budget,
    required this.homepage,
    required this.imdbId,
    required this.originalLanguage,
    required this.genres,
    required this.originCountry,
    required this.productionCompanies,
  });

  @override
  List<Object?> get props => [id];
}

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id];
}

class ProductionCompany extends Equatable {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  List<Object?> get props => [id];
}
