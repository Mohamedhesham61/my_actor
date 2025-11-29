
class AppException implements Exception {
  final String message;

  AppException([this.message = 'An unknown error occurred.']);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network error occurred.']);
}

class DatabaseException extends AppException {
  DatabaseException([super.message = 'Database error occurred.']);
}
