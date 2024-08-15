import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/movie/domain/entities/movie.dart';
import 'package:movie_app/src/movie/domain/repositories/movie_repository.dart';

class GetFavourites extends UsecaseWithoutParams<List<Movie>> {
  final MovieRepository _repository;

  const GetFavourites(this._repository);

  @override
  ResultFuture<List<Movie>> call() async => _repository.getFavourites();
}

