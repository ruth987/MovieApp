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
class GetMovieVideosEvent extends MovieEvent{
  const GetMovieVideosEvent();

}
class GetMovieDetailsEvent extends MovieEvent{
  const GetMovieDetailsEvent();

}