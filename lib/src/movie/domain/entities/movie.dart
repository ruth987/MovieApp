abstract class Movie {
  final String id;
  final String title;
  final String originalTitle;
  final PrimaryImage primaryImage;
  final String plot;
  final String releaseDate;
  final double rating;
  // final int runtime;
  // final int chartMeterRanking;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.primaryImage,
    required this.plot,
    required this.releaseDate,
    required this.rating,
    // required this.runtime,
    // required this.chartMeterRanking,
  });
}
class PrimaryImage {
  final String id;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;

  PrimaryImage({
    required this.id,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
  });

}