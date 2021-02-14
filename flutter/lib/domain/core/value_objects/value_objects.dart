import 'package:dartz/dartz.dart';

import '../failures/value_object_failure.dart';



abstract class ValueObjects<T> {
  const ValueObjects();

  Either<ValueObjectFailure, T> get value;

  bool isValid() => value.isRight();

  bool hasError() => value.isLeft();

  T getValue() => value?.getOrElse(null);

  T getError<T>() =>
      value.fold((ValueObjectFailure l) => l as T, (_) => null);

  @override
  String toString() => 'Value($value)';
}
