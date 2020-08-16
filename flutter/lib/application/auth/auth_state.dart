import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/auth/auth_repository.dart';

@lazySingleton
class AuthState {
  AuthState(this._authRepository);

  final AuthRepository _authRepository;

  UserModel _authUser;
  UserModel get authUser => _authUser;

  /* For this demo the logged user will be a random user */
  Future<void> loginUser({
    @required String username,
    @required String password,
  }) async {
    final Either<UserModel, Exception> result =
        await _authRepository.authUser(username: username, password: password);
    result.fold(
      (UserModel user) => _authUser = user,
      (Exception e) => throw e,
    );
  }
}
