import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_event.dart';
import 'package:movie_app/src/movie/domain/usecases/get_favourites.dart';


import '../../domain/entities/movie.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/get_movie_details.dart';
import '../../domain/usecases/get_movie_videos.dart';
import '../../domain/usecases/get_movies.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({
    required GetMovies getMovies,
    required GetMovieDetails getMovieDetails,
    required GetMovieVideos getMovieVideos,
    required GetFavourites getFavourites,
  })  : _getMovies = getMovies,
        _getMovieDetails = getMovieDetails,
        _getMovieVideos = getMovieVideos,
        _getFavourites = getFavourites,
        super(MovieInitial()) {
    on<GetMoviesEvent>(_getMoviesHandler);
    on<GetMovieDetailsEvent>(_getMovieDetailsHandler);
    on<GetMovieVideosEvent>(_getMovieVideosHandler);
    on<GetFavouritesEvent>(_getFavouritesHandler);
  }

  final GetMovies _getMovies;
  final GetMovieDetails _getMovieDetails;
  final GetMovieVideos _getMovieVideos;
  final GetFavourites _getFavourites;

  FutureOr<void> _getMoviesHandler(GetMoviesEvent event, Emitter<MovieState> emit) async {
    print("getting into the handler");
    emit(const GettingMovies());

    final result = await _getMovies();
    print(result);

    result.fold(
          (failure) => emit(MovieError(failure.errorMessage)),
          (movies) => emit(MovieLoaded(movies)),
    );
  }
  FutureOr<void> _getMovieDetailsHandler(GetMovieDetailsEvent event, Emitter<MovieState> emit) async {
    emit(const GettingMovieDetails());

    final params = GetMovieDetailsParams(id: event.movieId);
    final result = await _getMovieDetails(params);

    result.fold(
          (failure) => emit(MovieError(failure.errorMessage)),
          (movieDetails) => emit(MovieDetailsLoaded(movieDetails)),
    );
  }


  FutureOr<void> _getMovieVideosHandler(GetMovieVideosEvent event, Emitter<MovieState> emit) async {
    emit(const GettingMovieVideos());

    final params = GetMovieVideosParams(id: event.movieId);
    final result = await _getMovieVideos(params);

    result.fold(
          (failure) => emit(MovieError(failure.errorMessage)),
          (movieVideos) => emit(MovieVideosLoaded(movieVideos)),
    );
  }

  FutureOr<void> _getFavouritesHandler(GetFavouritesEvent event, Emitter<MovieState> emit) async {
    emit(GettingFavourites());
    print("state $state");

    final result = await _getFavourites();
    print("bloc event handler");
    print(result);
    result.fold(
          (failure) => emit(MovieError(failure.errorMessage)),
          (favourites) => emit(FavouritesLoaded(favourites)),
    );
  }

}
