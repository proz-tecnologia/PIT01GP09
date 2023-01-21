import 'package:flutter/foundation.dart';
import 'package:finance_app/domain/repositories/authentication/auth_repository.dart';
import 'package:finance_app/presentation/profile/controller/profile_state.dart';

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
}
