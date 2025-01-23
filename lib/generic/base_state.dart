import 'package:equatable/equatable.dart';
import 'package:language_learning/data/exception/error.dart';

class BaseState<T> extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class BaseInitial<T> extends BaseState<T> {}

class BaseLoading<T> extends BaseState<T> {}

class BaseSuccess<T> extends BaseState<T> {
  final T data;

  const BaseSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class BaseFailure<T> extends BaseState<T> {
  final ErrorMessage errorMessage;

  const BaseFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
