import 'package:movie_app/core/util/typedef.dart';
import 'package:movie_app/src/Auth/domain/entities/user.dart';

abstract class AuthRepository {
    
    ResultFuture<User> signIn(String email, String password);
    ResultFuture<User> signUp(String name, String email, String password);
    ResultFuture<void> signOut();
    ResultFuture<User> getCurrentUser();
}
