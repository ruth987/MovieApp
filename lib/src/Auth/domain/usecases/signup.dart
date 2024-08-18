import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/Auth/domain/entities/user.dart';
import 'package:movie_app/src/Auth/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository _authRepository;

  SignUp(this._authRepository);

  ResultFuture<User> call(String name, String email, String password) async {
    return await _authRepository.signUp(name, email, password);
  }
}

