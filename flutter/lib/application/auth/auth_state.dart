import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/auth/auth_repository.dart';

@lazySingleton
class AuthState {
  AuthState(this._authRepository);

  final AuthRepository _authRepository;

  UserModel _authUser;
  UserModel get authUser => _authUser;

  String username = '';
  String password = '';
  bool showPassword = false;

  /* For this demo the logged user will be a random user */
  Future<UserModel> loginUser() async {
    final Either<Exception, UserModel> result =
        await _authRepository.authUser(username: username, password: password);
    result.fold(
      (Exception e) => throw e,
      (UserModel user) => _authUser = user,
    );
    return result.getOrElse(() => null);
  }
}
