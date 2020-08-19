import 'package:dartz/dartz.dart';

import '../failures/auth_value_object_failure.dart';

Either<AuthValueObjectFailure, String> validateUsername(String value) {
  if (value.isEmpty) {
    return left(const AuthValueObjectFailure.invalidUsername());
  }
  return right(value);
}

Either<AuthValueObjectFailure, String> validatePassword(String value) {
  //Multiple validations
  if (value.isEmpty) {
    return left(const AuthValueObjectFailure.invalidPassword());
  }
  if (value.length < 6) {
    return left(const AuthValueObjectFailure.shortPassword());
  }
  return right(value);
}
