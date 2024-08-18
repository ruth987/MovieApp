import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/Auth/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository _authRepository;

  SignOut(this._authRepository);

  ResultFuture<void> call() async {
    return await _authRepository.signOut();
  }
}
