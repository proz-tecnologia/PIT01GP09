import 'package:finance_app/data/repositories/authentication/auth_repository_impl.dart';
import 'package:finance_app/presentation/profile/controller/profile_controller.dart';
import 'package:finance_app/presentation/profile/controller/profile_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mock_classes.dart';

void main() {
  late AuthRepositoryImpl repository;
  late ProfileController profileController;
  late FirebaseMock firebaseAuth;
  late UserCredentialMock userCredential;
  late UserMock user;

  setUp(() {
    firebaseAuth = FirebaseMock();
    repository = AuthRepositoryImpl(firebaseAuth);
    profileController = ProfileController(authRepository: repository);
    userCredential = UserCredentialMock();
    user = UserMock();
  });

  test('profile sign out test', () async {
    expect(profileController.state, isA<ProfileInitialState>());
    when(
      () => firebaseAuth.signInWithEmailAndPassword(
          email: 'user@email.com', password: 'user@123'),
    ).thenAnswer((invocation) async => userCredential);
    when((() => userCredential.user)).thenReturn(user);
    when(
      () => firebaseAuth.signOut(),
    ).thenAnswer((invocation) async => user);
    await profileController.signOut();
    expect(profileController.state, isA<ProfileLogoutState>());
  });
}
