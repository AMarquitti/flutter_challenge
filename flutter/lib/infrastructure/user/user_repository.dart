import 'dart:convert';

import 'package:challange_shared/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/api.dart';

@lazySingleton
class UserRepository {
  UserRepository(this._api);

  final Api _api;

  Future<List<UserModel>> getUsersInfo() async {
    final List<UserModel> userList = <UserModel>[];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Response<dynamic> response = await _api.client
        .get('?results=10&inc=gender,name,picture,email,phone,dob,cell&nat=us');
    response.data['results'].forEach((dynamic userData) {
      userList.add(UserModel.fromJson(userData));
    });
    await prefs.setString('usersListValues', json.encode(userList));
    return userList;
  }
}
