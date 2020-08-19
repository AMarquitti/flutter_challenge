import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/failures/value_object_failure.dart';
part 'auth_value_object_failure.freezed.dart';

@freezed
abstract class AuthValueObjectFailure extends ValueObjectFailure
    with _$AuthValueObjectFailure {
  const factory AuthValueObjectFailure.invalidUsername() = InvalidUsername;
  const factory AuthValueObjectFailure.invalidPassword() = InvalidPassword;
  const factory AuthValueObjectFailure.shortPassword() = ShortPassword;
}
