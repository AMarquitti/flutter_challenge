import 'dart:convert';

import 'package:challenge/User/model/user_model.dart';
import 'package:challenge/core/api/api.dart';
import 'package:challenge/core/utils/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<Either<List<UserModel>, Exception>> fetchActiveUsers(
      {int activity = 1}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await _api.client.get(
          "?results=75&inc=gender,name,picture,email,phone,dob,cell&nat=us");

      if (response.data == null) return Right(CustomException(msg: "Error"));

      final List<UserModel> activeUsers = [];
      response.data["results"].forEach((user) {
        final UserModel activeUser =
            UserModel.fromJson(user as Map<String, dynamic>);
        activeUsers.add(activeUser);
      });

      prefs.setString("activeUsers", json.encode(activeUsers));

      return Left(activeUsers);
    } on DioError catch (_) {
      return Right(CustomException(msg: "Server Error"));
    }
  }
}
