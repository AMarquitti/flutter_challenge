import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/home/home_repository.dart';

@lazySingleton
class HomeState {
  HomeState(this._homeRepository);

  final HomeRepository _homeRepository;
  UserModel currentUser;

  List<UserModel> _competitors;
  List<UserModel> _activeUsers;
  List<UserModel> get competitors => _competitors;
  List<UserModel> activeUsers;
  
  Future<void> fetchActiveUsers({int activity = 0}) async {
    final Either<List<UserModel>, Exception> result =
        await _homeRepository.fetchActiveUsers(activity: activity);
    result.fold(
      (List<UserModel> userList) {
        _activeUsers = userList;
        return activeUsers = userList;
      },
      (Exception error) => throw error,
    );
  }

  void filterUsers({@required String name}) {
    activeUsers = _activeUsers
        .where((UserModel user) =>
            '${user.name.first.toLowerCase()}${user.name.last.toLowerCase()}'
                .contains(name.toLowerCase()))
        .toList();
  }

  void filterUsersByActivity({@required int activity}) {
    if (activity >= 0) {
      activeUsers = _activeUsers
          .where((UserModel user) => user.activity == activity)
          .toList();
    } else {
      activeUsers = _activeUsers;
    }
  }
}
