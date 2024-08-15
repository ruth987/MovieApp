import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/src/movie/data/repositories/movie_repository_implementation.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/movie/domain/usecases/get_favourites.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movie_details.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movie_videos.dart';
import 'package:movie_app/src/movie/domain/usecases/get_movies.dart';
import 'package:movie_app/src/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/src/movie/presentation/bloc/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Client>(() => Client());

  // Data Sources
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: sl()));

  // Repositories
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetMovies(sl()));
  sl.registerLazySingleton(() => GetFavourites(sl()));
  sl.registerLazySingleton(() => GetMovieDetails(sl()));
  sl.registerLazySingleton(() => GetMovieVideos(sl()));

  // BLoC
  sl.registerFactory(() => MovieBloc(
    getMovies: sl(),
    getMovieDetails: sl(),
    getMovieVideos: sl(),
    getFavourites: sl(),
  ));
}

