abstract class Failures {
  final String errorMessage;
  final StackTrace? stack;
  final Object? error;
  Failures(
    this.errorMessage,
    this.stack,
    this.error,
  );
}

class UnknownError extends Failures {
  UnknownError({
    String errorMessage = 'Unknown Error',
    StackTrace? stack,
    Object? error,
  }) : super(errorMessage, stack, error);
}
