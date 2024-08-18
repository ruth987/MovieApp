import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/src/Auth/domain/entities/user.dart' as domain;

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth = firebase_auth.FirebaseAuth.instance;

  Future<Either<Failure, domain.User>> signIn(String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final domain.User user = _mapFirebaseUserToDomainUser(result.user!);
      return right(user);
    } catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: 400));
    }
  }

  Future<Either<Failure, domain.User>> signUp(String email, String password) async {
    try {
      firebase_auth.UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final domain.User user = _mapFirebaseUserToDomainUser(result.user!);
      return right(user);
    } catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: 400));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  domain.User _mapFirebaseUserToDomainUser(firebase_auth.User firebaseUser) {
    return domain.User(
      id: firebaseUser.uid,
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email!,
      password: '', 
    );
  }
}
