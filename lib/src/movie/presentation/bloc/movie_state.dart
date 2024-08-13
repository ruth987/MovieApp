part of 'movie_bloc.dart';

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props => [];

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
