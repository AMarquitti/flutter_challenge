import 'dart:convert';

import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/custom_exception.dart';
import '../core/api/api.dart';

@lazySingleton
class HomeRepository {
  HomeRepository(this._api);

  final Api _api;

  Future<Either<List<UserModel>, Exception>> fetchActiveUsers(
      {int activity = 1}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final Response<dynamic> response = await _api.client.get(
          '?results=75&inc=gender,name,picture,email,phone,dob,cell&nat=us');

      if (response.data == null) return right(CustomException(msg: 'Error'));

      final List<UserModel> activeUsers = <UserModel>[];
      response.data['results'].forEach((dynamic user) {
        final UserModel activeUser = UserModel.fromMap(user);
        activeUsers.add(activeUser);
      });

      prefs.setString('activeUsers', json.encode(activeUsers));

      return left(activeUsers);
    } on DioError catch (_) {
      return right(CustomException(msg: 'Server Error'));
    }
  }
}
