import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/data/models/user_model.dart';
import 'package:test/data/repositories/authentication/auth_repository_impl.dart';

class FirebaseMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

class UserMock extends Mock implements User {}

void main() {
  late AuthRepositoryImpl repository;
  late FirebaseMock firebaseAuth;
  late UserCredentialMock userCredential;
  late UserMock user;

  setUp(() {
    firebaseAuth = FirebaseMock();
    repository = AuthRepositoryImpl();
    userCredential = UserCredentialMock();
    user = UserMock();
  });

  //sucesso, se logou e devolveu um UserModel
  group('method login', () {
    test('caso de sucesso', () async {
      when(
        () => firebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((invocation) async => userCredential);
      when((() => userCredential.user)).thenReturn(user);
      final result = await repository.login('cindi@gmail.com', '123456789');
      expect(result, isA<UserModel>());
      expect(result.email, 'cindi@gmail.com');
    });
  });
}
