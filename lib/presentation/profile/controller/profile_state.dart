import '../../../data/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitialState implements ProfileState {}

class ProfileLoadingState implements ProfileState {}

class ProfileErrorState implements ProfileState {
  final String message;
  ProfileErrorState(this.message);
}

class ProfileSuccessState implements ProfileState {
  final UserModel user;
  ProfileSuccessState(this.user);
}

class ProfileLogoutState implements ProfileState {}
