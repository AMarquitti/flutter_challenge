import 'dart:convert';

import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/custom_exception.dart';
import '../core/api/api.dart';

@injectable
class AuthRepository {
  AuthRepository(this._api);
  final Api _api;

  Future<Either<Exception, UserModel>> authUser(
      {@required String username, @required String password}) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        return left(CustomException(msg: 'Error'));
      }

      final Response<dynamic> response = await _api.client.get(
          '?results=1&inc=gender,name,picture,email,phone,dob,cell&nat=us');

      if (response.data == null) return left(CustomException(msg: 'Error'));

      final UserModel authUser = UserModel.fromMap(response.data['results'][0]);
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('authUser', json.encode(authUser));
      await prefs.setString('token', 'somerandomtoken');

      return right(authUser);
    } on DioError catch (_) {
      return left(CustomException(msg: 'Server Error'));
    }
  }
}
