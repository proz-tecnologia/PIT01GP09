import 'package:flutter/cupertino.dart';

import '../../../domain/repositories/authentication/auth_repository.dart';
import 'auth_state.dart';

class AuthController extends ValueNotifier<AuthState> {
  final AuthRepository _authRepository;

  final state = ValueNotifier<AuthState>(InitialAuthState());

  AuthController({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(InitialAuthState());

  Future<void> login(String email, String password) async {
    state.value = LoadingAuthState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      await _authRepository.login(email, password);
      state.value = SuccessAuthState();
    } catch (e) {
      state.value = ErrorAuthState();
    }
  }

  Future<void> register(String email, String password) async {
    state.value = LoadingAuthState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      await _authRepository.register(email, password);
      state.value = SuccessAuthState();
    } catch (e) {
      state.value = ErrorAuthState();
    }
  }
}
