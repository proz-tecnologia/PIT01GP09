import 'package:finance_app/data/models/user_model.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/presentation/profile/controller/profile_state.dart';
import 'package:flutter/foundation.dart';

class ProfileController extends ValueNotifier<ProfileState> {
  final AuthRepository _authRepository;

  final notifier = ValueNotifier<ProfileState>(ProfileInitialState());

  ProfileState get state => notifier.value;

  ProfileController({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(ProfileInitialState());

  Future<void> signOut() async {
    await _authRepository.signOut();
    notifier.value = ProfileLogoutState();
  }

  Future<UserModel> getUser() async {
    var userModel = UserModel(name: '', email: '');
    final user = _authRepository.currentUser;
    if (user != null) {
      userModel = UserModel(name: user.displayName!, email: user.email!);
    }
    notifier.value = ProfileSuccessState(userModel);
    return userModel;
  }
}
