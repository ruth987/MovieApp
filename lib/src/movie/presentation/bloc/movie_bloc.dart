import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_event.dart';

import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_movie_videos.dart';
import '../../domain/usecases/get_movies.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({
    required GetMovies getMovies,
    required GetMovieDetails getMovieDetails,
    required GetMovieVideos getMovieVideos,
  })  : _getMovies = getMovies,
        _getMovieDetails = getMovieDetails,
        _getMovieVideos = getMovieVideos,
        super(MovieInitial()) {
    on<GetMoviesEvent>(_getMoviesHandler);
    on<GetMovieDetailsEvent>(_getMovieDetailsHandler);
    on<GetMovieVideosEvent>(_getMovieVideosHandler);
  }

  final GetMovies _getMovies;
  final GetMovieDetails _getMovieDetails;
  final GetMovieVideos _getMovieVideos;

  FutureOr<void> _getMoviesHandler(GetMoviesEvent event, Emitter<MovieState> emit) async {
    emit(const GettingMovies());

    final result = await _getMovies();

    result.fold(
          (failure) => emit(MovieError(failure.errorMessage)),
          (movies) => emit(MovieLoaded(movies)),
    );
  }

  FutureOr<void> _getMovieDetailsHandler(GetMovieDetailsEvent event, Emitter<MovieState> emit) {
  }

  FutureOr<void> _getMovieVideosHandler(GetMovieVideosEvent event, Emitter<MovieState> emit) {
  }
}
