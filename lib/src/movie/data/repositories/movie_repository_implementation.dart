import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/entities/video.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/src/movie/data/datasources/movie_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  ResultFuture<List<Movie>> getMovies() async {
    try {
      final movies = await remoteDataSource.getMovies();
      return Right(movies);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
  @override
  ResultFuture<List<Movie>> getFavourites() async {
    try {
      final movies = await remoteDataSource.getFanFavorites();
      return Right(movies);
    }catch (e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 400));
    }
  }

  @override
  ResultFuture<Movie> getMovieDetails(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetails(id);
      return Right(movie);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<Video>> getMovieVideos(int id) async {
    try {
      final videos = await remoteDataSource.getMovieVideos(id);
      return Right(videos);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
