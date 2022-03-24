abstract class ClientException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  ClientException(this.message, [this.stackTrace]);
}

class ClientResponseException extends ClientException {
  ClientResponseException(
    String message, [
    StackTrace? stackTrace,
  ]) : super(message, stackTrace);
}
