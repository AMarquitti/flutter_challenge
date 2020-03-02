import 'dart:convert';

import 'package:challenge/User/model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/api/api.dart';

@lazySingleton
class UserRepository {

  final  Api _api;

  UserRepository(this._api);

  Future<List<UserModel>> getUsersInfo() async {
    final List<UserModel> userList = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =  await _api.client.get("?results=75&inc=gender,name,picture,email,phone,dob,cell&nat=us");
    response.data["results"].forEach((userData){
      userList.add(UserModel.fromJson(userData as Map<String, dynamic>));
    });
    prefs.setString("usersListValues",json.encode(userList));
    return userList;
  }

}