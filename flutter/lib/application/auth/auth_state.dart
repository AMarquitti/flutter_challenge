import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/failures/auth_failure.dart';
import '../../domain/auth/value_objects/auth_value_object.dart';
import '../../domain/core/failures/value_object_failure.dart';
import '../../infrastructure/auth/auth_repository.dart';

@lazySingleton
class AuthState {
  AuthState(this._authRepository);

  final AuthRepository _authRepository;

  UserModel _authUser;
  UserModel get authUser => _authUser;

  Username username = Username('');
  Password password = Password('');
  bool showPassword = false;

  bool isSubmitted = false;

  /* For this demo the logged user will be a random user */
  Future<Either<ValueObjectFailure, UserModel>> loginUser() async {
    isSubmitted = true;
    if (username.hasError() || password.hasError()) {
      return left(const AuthFailure.invalidData());
    }
    final Either<Exception, UserModel> result = await _authRepository.authUser(
        username: username.getValue(), password: password.getValue());

    return result.fold(
      (Exception e) => left(AuthFailure.serverError(error: e)),
      (UserModel user) => right(_authUser = user),
    );
  }
}
