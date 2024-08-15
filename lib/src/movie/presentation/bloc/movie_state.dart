part of 'movie_bloc.dart';

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props => [];

}
class MovieLoading extends MovieState{
  const MovieLoading();
}

class MovieInitial extends MovieState{
  const MovieInitial();
}

class GettingMovies extends MovieState{
  const GettingMovies();

}
class GettingMovieDetails extends MovieState{
  const GettingMovieDetails();

}
class GettingMovieVideos extends MovieState{
  const GettingMovieVideos();

}
class MovieLoaded extends MovieState{
  const MovieLoaded(this.movies);

  final List<Movie> movies;

  @override
  List<Object> get props => movies.map((movie) => movie.id).toList();
}


class MovieError extends MovieState{
  const MovieError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class MovieDetailsLoaded extends MovieState {
  final Movie movieDetails;

  const MovieDetailsLoaded(this.movieDetails);

  @override
  List<Object> get props => [movieDetails.id];
}

class MovieVideosLoaded extends MovieState {
  final List<Video> movieVideos;

  const MovieVideosLoaded(this.movieVideos);

  @override
  List<Object> get props => movieVideos.map((video) => video.id).toList();
}

class GettingFavourites extends MovieState {
  const GettingFavourites();
}

class FavouritesLoaded extends MovieState {
  final List<Movie> favourites;

  const FavouritesLoaded(this.favourites);

  @override
  List<Object> get props => [favourites];
}