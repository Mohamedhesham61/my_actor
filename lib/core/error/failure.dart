
class Failure {
  final String message;

  Failure([this.message = 'An unknown failure occurred.']);

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'Network failure occurred.']);
}

class DatabaseFailure extends Failure {
  DatabaseFailure([super.message = 'Database failure occurred.']);
}
