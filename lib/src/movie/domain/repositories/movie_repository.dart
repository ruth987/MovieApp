import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/entities/video.dart';
import '../../../../core/util/typedef.dart';

abstract class MovieRepository {
  const MovieRepository();

  ResultFuture<List<Movie>> getMovies();

  ResultFuture<List<Video>> getMovieVideos(int id);

  ResultFuture<Movie> getMovieDetails(int id);

  ResultFuture<List<Movie>> getFavourites();

}
