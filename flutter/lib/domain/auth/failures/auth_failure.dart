import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/failures/value_object_failure.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure extends ValueObjectFailure with _$AuthFailure {
  const factory AuthFailure.serverError({dynamic error}) = ServerError;
  const factory AuthFailure.invalidData({dynamic error}) = InvalidData;
  const factory AuthFailure.invalidCredentials() = InvalidCredentials;   
  const factory AuthFailure.unauthorized() = Unauthorized;
}
