// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

// ignore: unused_element
  ServerError serverError({dynamic error}) {
    return ServerError(
      error: error,
    );
  }

// ignore: unused_element
  InvalidData invalidData({dynamic error}) {
    return InvalidData(
      error: error,
    );
  }

// ignore: unused_element
  InvalidCredentials invalidCredentials() {
    return const InvalidCredentials();
  }

// ignore: unused_element
  Unauthorized unauthorized() {
    return const Unauthorized();
  }
}

// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

mixin _$AuthFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(dynamic error),
    @required Result invalidData(dynamic error),
    @required Result invalidCredentials(),
    @required Result unauthorized(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(dynamic error),
    Result invalidData(dynamic error),
    Result invalidCredentials(),
    Result unauthorized(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidData(InvalidData value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result unauthorized(Unauthorized value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidData(InvalidData value),
    Result invalidCredentials(InvalidCredentials value),
    Result unauthorized(Unauthorized value),
    @required Result orElse(),
  });
}

abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(ServerError(
      error: error == freezed ? _value.error : error as dynamic,
    ));
  }
}

class _$ServerError implements ServerError {
  const _$ServerError({this.error});

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AuthFailure.serverError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ServerError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ServerErrorCopyWith<ServerError> get copyWith =>
      _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(dynamic error),
    @required Result invalidData(dynamic error),
    @required Result invalidCredentials(),
    @required Result unauthorized(),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return serverError(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(dynamic error),
    Result invalidData(dynamic error),
    Result invalidCredentials(),
    Result unauthorized(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidData(InvalidData value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result unauthorized(Unauthorized value),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidData(InvalidData value),
    Result invalidCredentials(InvalidCredentials value),
    Result unauthorized(Unauthorized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError({dynamic error}) = _$ServerError;

  dynamic get error;
  $ServerErrorCopyWith<ServerError> get copyWith;
}

abstract class $InvalidDataCopyWith<$Res> {
  factory $InvalidDataCopyWith(
          InvalidData value, $Res Function(InvalidData) then) =
      _$InvalidDataCopyWithImpl<$Res>;
  $Res call({dynamic error});
}

class _$InvalidDataCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidDataCopyWith<$Res> {
  _$InvalidDataCopyWithImpl(
      InvalidData _value, $Res Function(InvalidData) _then)
      : super(_value, (v) => _then(v as InvalidData));

  @override
  InvalidData get _value => super._value as InvalidData;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(InvalidData(
      error: error == freezed ? _value.error : error as dynamic,
    ));
  }
}

class _$InvalidData implements InvalidData {
  const _$InvalidData({this.error});

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AuthFailure.invalidData(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidData &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $InvalidDataCopyWith<InvalidData> get copyWith =>
      _$InvalidDataCopyWithImpl<InvalidData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(dynamic error),
    @required Result invalidData(dynamic error),
    @required Result invalidCredentials(),
    @required Result unauthorized(),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return invalidData(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(dynamic error),
    Result invalidData(dynamic error),
    Result invalidCredentials(),
    Result unauthorized(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidData != null) {
      return invalidData(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidData(InvalidData value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result unauthorized(Unauthorized value),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidData(InvalidData value),
    Result invalidCredentials(InvalidCredentials value),
    Result unauthorized(Unauthorized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class InvalidData implements AuthFailure {
  const factory InvalidData({dynamic error}) = _$InvalidData;

  dynamic get error;
  $InvalidDataCopyWith<InvalidData> get copyWith;
}

abstract class $InvalidCredentialsCopyWith<$Res> {
  factory $InvalidCredentialsCopyWith(
          InvalidCredentials value, $Res Function(InvalidCredentials) then) =
      _$InvalidCredentialsCopyWithImpl<$Res>;
}

class _$InvalidCredentialsCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidCredentialsCopyWith<$Res> {
  _$InvalidCredentialsCopyWithImpl(
      InvalidCredentials _value, $Res Function(InvalidCredentials) _then)
      : super(_value, (v) => _then(v as InvalidCredentials));

  @override
  InvalidCredentials get _value => super._value as InvalidCredentials;
}

class _$InvalidCredentials implements InvalidCredentials {
  const _$InvalidCredentials();

  @override
  String toString() {
    return 'AuthFailure.invalidCredentials()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidCredentials);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(dynamic error),
    @required Result invalidData(dynamic error),
    @required Result invalidCredentials(),
    @required Result unauthorized(),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(dynamic error),
    Result invalidData(dynamic error),
    Result invalidCredentials(),
    Result unauthorized(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidData(InvalidData value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result unauthorized(Unauthorized value),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidData(InvalidData value),
    Result invalidCredentials(InvalidCredentials value),
    Result unauthorized(Unauthorized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentials implements AuthFailure {
  const factory InvalidCredentials() = _$InvalidCredentials;
}

abstract class $UnauthorizedCopyWith<$Res> {
  factory $UnauthorizedCopyWith(
          Unauthorized value, $Res Function(Unauthorized) then) =
      _$UnauthorizedCopyWithImpl<$Res>;
}

class _$UnauthorizedCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $UnauthorizedCopyWith<$Res> {
  _$UnauthorizedCopyWithImpl(
      Unauthorized _value, $Res Function(Unauthorized) _then)
      : super(_value, (v) => _then(v as Unauthorized));

  @override
  Unauthorized get _value => super._value as Unauthorized;
}

class _$Unauthorized implements Unauthorized {
  const _$Unauthorized();

  @override
  String toString() {
    return 'AuthFailure.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(dynamic error),
    @required Result invalidData(dynamic error),
    @required Result invalidCredentials(),
    @required Result unauthorized(),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(dynamic error),
    Result invalidData(dynamic error),
    Result invalidCredentials(),
    Result unauthorized(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidData(InvalidData value),
    @required Result invalidCredentials(InvalidCredentials value),
    @required Result unauthorized(Unauthorized value),
  }) {
    assert(serverError != null);
    assert(invalidData != null);
    assert(invalidCredentials != null);
    assert(unauthorized != null);
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidData(InvalidData value),
    Result invalidCredentials(InvalidCredentials value),
    Result unauthorized(Unauthorized value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements AuthFailure {
  const factory Unauthorized() = _$Unauthorized;
}
