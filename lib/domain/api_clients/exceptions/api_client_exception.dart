enum ApiClientExceptionType { network, auth, other, sessionExpired }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  late final String error;

  ApiClientException(this.type);

  ApiClientException.fromError(this.type, this.error);
}