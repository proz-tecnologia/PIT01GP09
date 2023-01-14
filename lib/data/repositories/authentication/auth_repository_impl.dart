import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/exceptions/auth_exception.dart';
import '../../../domain/repositories/authentication/auth_repository.dart';
import '../../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  @override
  bool get isLogged => _firebaseAuth.currentUser != null;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        return UserModel(name: '', email: email);
      }
      throw AuthException;
    } on AuthException catch (e) {
      switch (e.statusCode) {
        case (401):
          throw InvalidCredentialsException(e.message);
        case (404):
          throw UserNotFoundException(e.message);
        default:
          throw SomethingWentWrongDefaultException(e.message);
      }
    }
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        return UserModel(name: name, email: email);
      }
      throw AuthException;
    } on AuthException catch (e) {
      switch (e.statusCode) {
        case (401):
          throw InvalidCredentialsException(e.message);
        case (404):
          throw UserNotFoundException(e.message);
        default:
          throw SomethingWentWrongDefaultException(e.message);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
