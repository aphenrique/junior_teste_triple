abstract class PhotoException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  PhotoException(this.message, [this.stackTrace]);
}

class PhotoParamsException extends PhotoException {
  PhotoParamsException(
    String message, [
    StackTrace? stackTrace,
  ]) : super(message, stackTrace);
}

class PhotoRepositoryException extends PhotoException {
  PhotoRepositoryException(
    String message, [
    StackTrace? stackTrace,
  ]) : super(message, stackTrace);
}

class PhotoDatasourceException extends PhotoException {
  PhotoDatasourceException(
    String message, [
    StackTrace? stackTrace,
  ]) : super(message, stackTrace);
}

class LostInternetConnection extends PhotoException {
  LostInternetConnection(
    String message, [
    StackTrace? stackTrace,
  ]) : super(message, stackTrace);
}
