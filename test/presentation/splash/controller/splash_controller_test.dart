import 'package:finance_app/data/repositories/authentication/auth_repository_impl.dart';
import 'package:finance_app/presentation/splash/controller/splash_controller.dart';
import 'package:finance_app/presentation/splash/controller/splash_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock/mock_classes.dart';

void main() {
  late AuthRepositoryImpl repository;
  late FirebaseMock firebaseAuth;
  late SplashController splashController;

  setUp(() {
    firebaseAuth = FirebaseMock();
    repository = AuthRepositoryImpl(firebaseAuth);
    splashController = SplashController(authRepository: repository);
  });
  test('get user authenticated user', () async {
    expect(splashController.notifier.value, isInstanceOf<SplashLoading>());
    final result =
        splashController.getUser().then((value) async => SplashAuthenticated());
    expect(result, isInstanceOf<Future<SplashAuthenticated>>());
  });

  test('get user unauthenticated user', () async {
    expect(splashController.notifier.value, isInstanceOf<SplashLoading>());
    await splashController.getUser();
    expect(
        splashController.notifier.value, isInstanceOf<SplashUnAuthenticated>());
  });
}
