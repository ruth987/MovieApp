// part of 'movie_bloc.dart';


import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object> get props => [];

}

class GetMoviesEvent extends MovieEvent{
  const GetMoviesEvent();

}
class GetMovieDetailsEvent extends MovieEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetMovieVideosEvent extends MovieEvent {
  final int movieId;

  const GetMovieVideosEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetFavouritesEvent extends MovieEvent {
  const GetFavouritesEvent();
}