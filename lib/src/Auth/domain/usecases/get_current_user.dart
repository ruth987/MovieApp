import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/src/Auth/domain/entities/user.dart';
import 'package:movie_app/src/Auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository _authRepository;

  GetCurrentUser(this._authRepository);

  Future<Either<Failure, User>> call() async {
    return await _authRepository.getCurrentUser();
  }
}


