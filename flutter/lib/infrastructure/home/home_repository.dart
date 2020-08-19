import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/custom_exception.dart';
import '../core/api/api.dart';

@lazySingleton
class HomeRepository {
  HomeRepository(this._api);

  final Api _api;

  Future<Either<Exception, List<UserModel>>> fetchActiveUsers(
      {int activity = 1}) async {
    try {
      final Response<dynamic> response = await _api.client.get(
          '?results=10&inc=gender,name,picture,email,phone,dob,cell&nat=us');

      if (response.data == null) {
        return left(CustomException(msg: 'Server Error'));
      }

      return right(List<UserModel>.from(response.data['results']
          .map((dynamic userMap) => UserModel.fromMap(userMap))));
    } catch (e) {
      return left(CustomException(msg: 'Server Error'));
    }
  }
}
