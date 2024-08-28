class AppException implements Exception {
  final String message;
  final String prefix;
  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message ?? 'Error While Communcation', '');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message ?? 'Error While Connecting to Database ', '');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message ?? ' UnAuthorized Resuest', '');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message ?? 'Server Error: ', '');
}

class TimeoutException extends AppException {
  TimeoutException([String? message])
      : super(message ?? 'Request Timed Out: ', '');
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? 'Resource Not Found: ', '');
}

class RateLimitExceededException extends AppException {
  RateLimitExceededException([String? message])
      : super(message ?? 'Rate Limit Exceeded: ', '');
}
