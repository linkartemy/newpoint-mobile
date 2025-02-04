enum ApiClientExceptionType { network, auth, other, sessionExpired, badRequest }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  final String error;

  ApiClientException(this.type, [this.error = ""]);

  ApiClientException.fromError(this.type, this.error);
}
