import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/data/repositories/authentication/auth_repository_impl.dart';
import 'package:test/presentation/login/controller/auth_controller.dart';
import 'package:test/presentation/login/controller/auth_state.dart';

import '../../../mock/mock_classes.dart';

void main() {
  late AuthRepositoryImpl repository;
  late AuthController authController;
  late FirebaseMock firebaseAuth;
  late UserCredentialMock userCredential;
  late UserMock user;

  setUp(() {
    firebaseAuth = FirebaseMock();
    repository = AuthRepositoryImpl(firebaseAuth);
    authController = AuthController(authRepository: repository);
    userCredential = UserCredentialMock();
    user = UserMock();
  });

  group('sign in controller login', () {
    test('login controller success state', () async {
      expect(authController.state, isInstanceOf<InitialAuthState>());
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
            email: 'user@email.com', password: 'user@123'),
      ).thenAnswer((invocation) async => userCredential);
      when((() => userCredential.user)).thenReturn(user);
      await authController.login('user@email.com', 'user@123');
      expect(authController.state, isInstanceOf<SuccessAuthState>());
    });
    test('login controller no user returned, throw exception', () async {
      expect(authController.state, isInstanceOf<InitialAuthState>());
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
            email: 'user@email.com', password: 'user@123'),
      ).thenAnswer((invocation) async => userCredential);
      await authController.login('user@email.com', 'user@123');
      expect(authController.state, isInstanceOf<ErrorAuthState>());
    });

    test('no connection, throw exception controller', () async {
      expect(authController.state, isInstanceOf<InitialAuthState>());
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
            email: 'user@email.com', password: 'user@123'),
      ).thenThrow(Exception());
      await authController.login('user@email.com', 'user@123');
      expect(authController.state, isInstanceOf<ErrorAuthState>());
    });
  });

  group('sign controller register method', () {
    test('register controller success state', () async {
      expect(authController.state, isInstanceOf<InitialAuthState>());
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
            email: 'user@email.com', password: 'user@123'),
      ).thenAnswer((invocation) async => userCredential);
      when((() => userCredential.user)).thenReturn(user);
      await authController.register('User', 'user@email.com', 'user@123');
      expect(authController.state, isInstanceOf<SuccessAuthState>());
    });
    test('register controller error state', () async {
      expect(authController.state, isInstanceOf<InitialAuthState>());
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
            email: 'user@email.com', password: 'user@123'),
      ).thenThrow(Exception());
      await authController.register('User', 'user@email.com', 'user@123');
      expect(authController.state, isInstanceOf<ErrorAuthState>());
    });
  });
}
