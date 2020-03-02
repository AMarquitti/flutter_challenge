import 'dart:convert';

import 'package:challenge/core/utils/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/api/api.dart';
import '../../../core/models/user_model.dart';

@injectable
class AuthRepository {
  final Api _api;

  AuthRepository(this._api);

  Future<Either<UserModel, Exception>> authUser(
      {@required String username, @required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if(username.isEmpty || password.isEmpty) return Right(CustomException(msg:"Error"));

      final response = await _api.client.get("?results=1&inc=gender,name,picture,email,phone,dob,cell&nat=us");

      if(response.data == null) return Right(CustomException(msg:"Error"));

      final UserModel authUser = UserModel.fromJson(
          response.data["results"][0] as Map<String, dynamic>);
      prefs.setString("authUser", json.encode(authUser));

      return Left(authUser);
    } on DioError catch (_) {
      return Right(CustomException(msg:"Server Error"));
    } 
  }
}
