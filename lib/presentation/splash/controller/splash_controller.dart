import 'package:flutter/foundation.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/presentation/splash/controller/splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final AuthRepository _authRepository;

  final notifier = ValueNotifier<SplashState>(SplashLoading());

  SplashController({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SplashLoading());

  SplashState get state => notifier.value;

  Future<void> getUser() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_authRepository.isLogged) {
      notifier.value = SplashAuthenticated();
    } else {
      notifier.value = SplashUnAuthenticated();
    }
  }
}
