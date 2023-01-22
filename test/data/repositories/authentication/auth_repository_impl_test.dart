import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:finance_app/data/models/user_model.dart';
import 'package:finance_app/data/repositories/authentication/auth_repository_impl.dart';
import 'package:finance_app/core/exceptions/auth_exception.dart';

import '../../../mock/mock_classes.dart';

void main() {
  late AuthRepositoryImpl repository;
  late FirebaseMock firebaseAuth;
  late UserCredentialMock userCredential;
  late UserMock user;

  setUp(() {
    firebaseAuth = FirebaseMock();
    repository = AuthRepositoryImpl(firebaseAuth);
    userCredential = UserCredentialMock();
    user = UserMock();
  });

  //sucesso, se logou e devolveu um UserModel
  group('method login', () {
    test('success case repository', () async {
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((invocation) async => userCredential);
      when((() => userCredential.user)).thenReturn(user);
      final result = await repository.login('user@email.com', 'user@123');
      expect(result, isA<UserModel>());
      expect(result.email, 'user@email.com');
    });
    test('no user returned, throw exception', () async {
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((invocation) async => userCredential);
      expectLater(
          () => repository.login('user@email.com', 'user@123'),
          throwsA(
            predicate(
              (x) => x is ArgumentError && x.message == UserNotFoundException,
            ),
          ));
    });
    test('no connection, throw exception', () async {
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(
            named: 'password',
          ),
        ),
      ).thenThrow(Exception());
      expect(() => repository.login('user@email.com', 'user@123'),
          throwsException);
    });
  });
  group('method register', () {
    test('success case for sign up', () async {
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((invocation) async => userCredential);
      when((() => userCredential.user)).thenReturn(user);
      final result =
          await repository.register('User', 'user@email.com', 'user@123');
      expect(result, isA<UserModel>());
      expect(result.email, 'user@email.com');
    });
    test('sign up failure', () async {
      when(
        () => firebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception());
      expect(() => repository.register('User', 'user@email.com', 'user@123'),
          throwsException);
    });
  });
}
