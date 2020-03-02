import 'package:challenge/User/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

@injectable
class AuthStore {
  final AuthRepository _authRepository;
  UserModel _authUser;
  AuthStore(this._authRepository);

  UserModel get authUser => _authUser;

  /* For this demo the logged user will be a random user */
  Future<void> loginUser({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 5));
    final result =
        await _authRepository.authUser(username: username, password: password);
    result.fold(
      (user) => _authUser = user,
      (e) => throw e,
    );
  }
}
