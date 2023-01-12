import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
  bool get isLogged;
  Future<void> signOut();
  User? get currentUser;
}
