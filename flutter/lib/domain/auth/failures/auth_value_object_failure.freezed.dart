// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_value_object_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthValueObjectFailureTearOff {
  const _$AuthValueObjectFailureTearOff();

// ignore: unused_element
  InvalidUsername invalidUsername() {
    return const InvalidUsername();
  }

// ignore: unused_element
  InvalidPassword invalidPassword() {
    return const InvalidPassword();
  }

// ignore: unused_element
  ShortPassword shortPassword() {
    return const ShortPassword();
  }
}

// ignore: unused_element
const $AuthValueObjectFailure = _$AuthValueObjectFailureTearOff();

mixin _$AuthValueObjectFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidUsername(),
    @required Result invalidPassword(),
    @required Result shortPassword(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidUsername(),
    Result invalidPassword(),
    Result shortPassword(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidUsername(InvalidUsername value),
    @required Result invalidPassword(InvalidPassword value),
    @required Result shortPassword(ShortPassword value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidUsername(InvalidUsername value),
    Result invalidPassword(InvalidPassword value),
    Result shortPassword(ShortPassword value),
    @required Result orElse(),
  });
}

abstract class $AuthValueObjectFailureCopyWith<$Res> {
  factory $AuthValueObjectFailureCopyWith(AuthValueObjectFailure value,
          $Res Function(AuthValueObjectFailure) then) =
      _$AuthValueObjectFailureCopyWithImpl<$Res>;
}

class _$AuthValueObjectFailureCopyWithImpl<$Res>
    implements $AuthValueObjectFailureCopyWith<$Res> {
  _$AuthValueObjectFailureCopyWithImpl(this._value, this._then);

  final AuthValueObjectFailure _value;
  // ignore: unused_field
  final $Res Function(AuthValueObjectFailure) _then;
}

abstract class $InvalidUsernameCopyWith<$Res> {
  factory $InvalidUsernameCopyWith(
          InvalidUsername value, $Res Function(InvalidUsername) then) =
      _$InvalidUsernameCopyWithImpl<$Res>;
}

class _$InvalidUsernameCopyWithImpl<$Res>
    extends _$AuthValueObjectFailureCopyWithImpl<$Res>
    implements $InvalidUsernameCopyWith<$Res> {
  _$InvalidUsernameCopyWithImpl(
      InvalidUsername _value, $Res Function(InvalidUsername) _then)
      : super(_value, (v) => _then(v as InvalidUsername));

  @override
  InvalidUsername get _value => super._value as InvalidUsername;
}

class _$InvalidUsername implements InvalidUsername {
  const _$InvalidUsername();

  @override
  String toString() {
    return 'AuthValueObjectFailure.invalidUsername()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidUsername);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidUsername(),
    @required Result invalidPassword(),
    @required Result shortPassword(),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return invalidUsername();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidUsername(),
    Result invalidPassword(),
    Result shortPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidUsername != null) {
      return invalidUsername();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidUsername(InvalidUsername value),
    @required Result invalidPassword(InvalidPassword value),
    @required Result shortPassword(ShortPassword value),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return invalidUsername(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidUsername(InvalidUsername value),
    Result invalidPassword(InvalidPassword value),
    Result shortPassword(ShortPassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidUsername != null) {
      return invalidUsername(this);
    }
    return orElse();
  }
}

abstract class InvalidUsername implements AuthValueObjectFailure {
  const factory InvalidUsername() = _$InvalidUsername;
}

abstract class $InvalidPasswordCopyWith<$Res> {
  factory $InvalidPasswordCopyWith(
          InvalidPassword value, $Res Function(InvalidPassword) then) =
      _$InvalidPasswordCopyWithImpl<$Res>;
}

class _$InvalidPasswordCopyWithImpl<$Res>
    extends _$AuthValueObjectFailureCopyWithImpl<$Res>
    implements $InvalidPasswordCopyWith<$Res> {
  _$InvalidPasswordCopyWithImpl(
      InvalidPassword _value, $Res Function(InvalidPassword) _then)
      : super(_value, (v) => _then(v as InvalidPassword));

  @override
  InvalidPassword get _value => super._value as InvalidPassword;
}

class _$InvalidPassword implements InvalidPassword {
  const _$InvalidPassword();

  @override
  String toString() {
    return 'AuthValueObjectFailure.invalidPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidUsername(),
    @required Result invalidPassword(),
    @required Result shortPassword(),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return invalidPassword();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidUsername(),
    Result invalidPassword(),
    Result shortPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPassword != null) {
      return invalidPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidUsername(InvalidUsername value),
    @required Result invalidPassword(InvalidPassword value),
    @required Result shortPassword(ShortPassword value),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidUsername(InvalidUsername value),
    Result invalidPassword(InvalidPassword value),
    Result shortPassword(ShortPassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidPassword implements AuthValueObjectFailure {
  const factory InvalidPassword() = _$InvalidPassword;
}

abstract class $ShortPasswordCopyWith<$Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword value, $Res Function(ShortPassword) then) =
      _$ShortPasswordCopyWithImpl<$Res>;
}

class _$ShortPasswordCopyWithImpl<$Res>
    extends _$AuthValueObjectFailureCopyWithImpl<$Res>
    implements $ShortPasswordCopyWith<$Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword _value, $Res Function(ShortPassword) _then)
      : super(_value, (v) => _then(v as ShortPassword));

  @override
  ShortPassword get _value => super._value as ShortPassword;
}

class _$ShortPassword implements ShortPassword {
  const _$ShortPassword();

  @override
  String toString() {
    return 'AuthValueObjectFailure.shortPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ShortPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidUsername(),
    @required Result invalidPassword(),
    @required Result shortPassword(),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return shortPassword();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidUsername(),
    Result invalidPassword(),
    Result shortPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidUsername(InvalidUsername value),
    @required Result invalidPassword(InvalidPassword value),
    @required Result shortPassword(ShortPassword value),
  }) {
    assert(invalidUsername != null);
    assert(invalidPassword != null);
    assert(shortPassword != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidUsername(InvalidUsername value),
    Result invalidPassword(InvalidPassword value),
    Result shortPassword(ShortPassword value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword implements AuthValueObjectFailure {
  const factory ShortPassword() = _$ShortPassword;
}
