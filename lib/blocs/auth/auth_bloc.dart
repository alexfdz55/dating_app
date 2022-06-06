import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    _userSubscription = authRepository.user.listen(
      (user) => add(AuthUserChanged(user: user)),
    );

    on<AuthUserChanged>(_onAuthUserChanged);
    // on<AuthUserChanged>((event, emit) {
    //   emit(AuthState.authenticated(user: event.user));
    // });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.user != null
        ? emit(AuthState.authenticated(user: event.user!))
        : emit(const AuthState.anauthenticated());
  }

  @override
  Future<void> close() async {
    await _userSubscription?.cancel();
    return super.close();
  }
}
