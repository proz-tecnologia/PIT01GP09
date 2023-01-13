abstract class AuthState {}

class InitialAuthState implements AuthState {}

class LoadingAuthState implements AuthState {}

class SuccessAuthState implements AuthState {}

class ErrorAuthState implements AuthState {}
