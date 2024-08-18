import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/Auth/domain/entities/user.dart';
import 'package:movie_app/src/Auth/domain/repositories/auth_repository.dart';

class SignIn {
  final AuthRepository _authRepository;

  SignIn(this._authRepository);

  ResultFuture<User> call(String email, String password) async {
    return await _authRepository.signIn(email, password);
  }

  
}
  