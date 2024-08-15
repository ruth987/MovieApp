import 'package:equatable/equatable.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/movie/domain/entities/video.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';

class GetMovieVideos
    extends UsecaseWithParams<List<Video>, GetMovieVideosParams> {
  final MovieRepository _repository;

  const GetMovieVideos(this._repository);

  @override
  ResultFuture<List<Video>> call(GetMovieVideosParams getMovieVideosParams) {
    return _repository.getMovieVideos(getMovieVideosParams.id);
  }
}

class GetMovieVideosParams extends Equatable {
  final int id;

  GetMovieVideosParams({required this.id});

  @override
  List<Object?> get props => [id];
}
