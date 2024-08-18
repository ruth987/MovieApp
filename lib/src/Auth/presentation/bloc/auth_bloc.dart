import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/Auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/src/Auth/presentation/bloc/auth_event.dart';
import 'package:movie_app/src/Auth/presentation/bloc/auth_state.dart';
import 'package:movie_app/core/errors/failure.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<SignInEvent>(_onSignInRequested);
    on<SignUpEvent>(_onSignUpRequested);
    on<SignOutEvent>(_onSignOutRequested);
  }

  Future<void> _onSignInRequested(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _authRepository.signIn(event.email, event.password);
    result.fold(
      (failure) => emit(AuthError(_mapFailureToMessage(failure))),
      (domainUser) => emit(Authenticated(domainUser)),
    );
  }

  Future<void> _onSignUpRequested(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result =
        await _authRepository.signUp(event.email, event.password, event.name);
    result.fold(
      (failure) => emit(AuthError(_mapFailureToMessage(failure))),
      (domainUser) => emit(Authenticated(domainUser)),
    );
  }

  Future<void> _onSignOutRequested(
      SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError("Failed to sign out. Please try again."));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      default:
        return 'An unexpected error occurred';
    }
  }
}
