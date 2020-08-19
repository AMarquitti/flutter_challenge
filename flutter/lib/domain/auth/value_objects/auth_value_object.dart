import 'package:challenge/domain/core/failures/value_object_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/value_objects/value_objects.dart';
import '../failures/auth_value_object_failure.dart';
import '../validators/auth_value_object_validators.dart';

class Username extends ValueObjects<String> {
  factory Username(String input) {
    assert(input != null);
    return Username._(value: validateUsername(input));
  }
  Username._({@required this.value});
  @override
  final Either<AuthValueObjectFailure, String> value;
}

class Password extends ValueObjects<String> {
  factory Password(String input) => Password._(validatePassword(input));
  Password._(this.value);
  @override
  final Either<ValueObjectFailure, String> value;
}
