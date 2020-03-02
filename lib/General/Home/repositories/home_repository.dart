import 'dart:convert';

import 'package:challenge/User/model/user_model.dart';
import 'package:challenge/core/api/api.dart';
import 'package:challenge/core/utils/custom_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeRepository{
  final Api _api;

  HomeRepository(this._api);


  Future<Either<List<UserModel>, Exception>> fetchCompetitors({int activity = 1}) async {
   try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final response = await _api.client.get("?results=75&inc=gender,name,picture,email,phone,dob,cell&nat=us");

      if(response.data == null) return Right(CustomException(msg:"Error"));

      final List<UserModel> competitors = [];
      response.data["results"].foreach((user){
        final UserModel userCompetitor = UserModel.fromJson(
          response.data["results"][0] as Map<String, dynamic>);
         competitors.add(userCompetitor);
      });

      prefs.setString("competitors", json.encode(competitors));

      return Left(competitors);
    } on DioError catch (_) {
      return Right(CustomException(msg:"Server Error"));
    } 
  }
}