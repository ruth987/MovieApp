import 'package:movie_app/src/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.primaryImage,
    required super.plot,
    required super.releaseDate,
    required super.rating,
    // required super.runtime,
    // required super.chartMeterRanking,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['titleText']['text'] ?? '',
      originalTitle: json['originalTitleText']['text'] ?? '',
      primaryImage: PrimaryImage(
        id: json['primaryImage']['id'] ?? '',
        imageUrl: json['primaryImage']['imageUrl'] ?? '',
        imageWidth: json['primaryImage']['imageWidth'] ?? 0,
        imageHeight: json['primaryImage']['imageHeight'] ?? 0,
      ),
      plot: json['plot']['plotText']['plainText'] ?? '',
      releaseDate: '${json['releaseDate']['year'] ?? ''}-${json['releaseDate']['month'] ?? '01'}-${json['releaseDate']['day'] ?? '01'}',
      rating: json['ratingsSummary']['aggregateRating']?.toDouble() ?? 0.0,
      // runtime: json['titleRuntime']['seconds'] ?? 0,
      // chartMeterRanking: json['chartMeterRanking']??['currentRank'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleText': {'text': title},
      'originalTitleText': {'text': originalTitle},
      'primaryImage': {
        'id': primaryImage.id,
        'imageUrl': primaryImage.imageUrl,
        'imageWidth': primaryImage.imageWidth,
        'imageHeight': primaryImage.imageHeight,
      },
      'plot': {'plotText': {'plainText': plot}},
      'releaseDate': {
        'year': releaseDate.split('-')[0],
        'month': releaseDate.split('-')[1],
        'day': releaseDate.split('-')[2],
      },
      'ratingsSummary': {'aggregateRating': rating},
      // 'titleRuntime': {'seconds': runtime},
      // 'chartMeterRanking': {'currentRank': chartMeterRankingRanking},
    };
  }
}
