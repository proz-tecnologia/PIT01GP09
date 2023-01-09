class AuthException implements Exception {
  final int statusCode;
  final String message;

  AuthException({
    required this.statusCode,
    required this.message,
  });

  @override
  String toString() =>
      'AuthException(statusCode: $statusCode, message: $message)';
}

class UserNotFoundException implements Exception {
  final String message;

  const UserNotFoundException(this.message);
}

class InvalidCredentialsException implements Exception {
  final String message;

  const InvalidCredentialsException(this.message);
}


class SomethingWentWrongDefaultException implements Exception {
  final String message;

  const SomethingWentWrongDefaultException(this.message);
}