class UseCaseResult<T> {
  RequestStatus status = RequestStatus.none;
  final T? _data;
  final Object? _exception;

  UseCaseResult(this.status, this._data, this._exception);

  T? get data => _data;
  Object? get exception => _exception;

  static UseCaseResult<T> success<T>(T data) {
    return UseCaseResult(RequestStatus.success, data, null);
  }

  static UseCaseResult<T> error<T>(Object exp) {
    return UseCaseResult(RequestStatus.error, null, exp);
  }

  static UseCaseResult<T> complete<T>() {
    return UseCaseResult(RequestStatus.complete, null, null);
  }
}

enum RequestStatus { success, error, complete, none }
