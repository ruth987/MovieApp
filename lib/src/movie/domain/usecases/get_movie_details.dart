import 'package:equatable/equatable.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';

class GetMovieDetails extends UsecaseWithParams<Movie, GetMovieDetailsParams> {
  final MovieRepository _repository;

  const GetMovieDetails(this._repository);

  @override
  ResultFuture<Movie> call(GetMovieDetailsParams getMovieDetailsParams) {
    return _repository.getMovieDetails(getMovieDetailsParams.id);
  }
}

class GetMovieDetailsParams extends Equatable {
  final int id;

  const GetMovieDetailsParams({required this.id});

  @override
  List<Object?> get props => [id];
}
