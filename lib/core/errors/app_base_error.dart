abstract class AppBaseError {
  final String message;
  final StackTrace stackTrace;
  AppBaseError(this.message, this.stackTrace);

  @override
  String toString() {
    return 'ErrorType: $runtimeType, Message: $message, StackTrace: $stackTrace';
  }
}
