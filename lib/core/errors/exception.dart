class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class NetWorkException implements Exception {
  final String message;
  NetWorkException({required this.message});
}

class DuplicationException implements Exception {
  final String message;
  DuplicationException({required this.message});
}

class InvalidCepException implements Exception {}

class CacheException implements Exception {}

class LoginException implements Exception {
  final String message;
  LoginException({required this.message});
}
