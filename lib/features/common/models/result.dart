/// Minimal Ok/Err result type used by every use case (doc §4.3).
sealed class Result<T> {
  const Result();

  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;

  T get value => (this as Ok<T>).data;
  Object get error => (this as Err<T>).cause;

  /// User-readable message: validators put strings in [Err]; anything else
  /// falls back to toString().
  String get errorMessage {
    final cause = (this as Err<T>).cause;
    return cause is String ? cause : cause.toString();
  }
}

final class Ok<T> extends Result<T> {
  const Ok(this.data);
  final T data;
}

final class Err<T> extends Result<T> {
  const Err(this.cause);
  final Object cause;
}
