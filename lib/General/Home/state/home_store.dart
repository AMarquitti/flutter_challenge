import 'package:challenge/General/Home/repositories/home_repository.dart';
import 'package:challenge/User/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeStore {
  final HomeRepository _homeRepository;
  List<UserModel> _competitors;
  List<UserModel> _activeUsers;

  HomeStore(this._homeRepository);
  List<UserModel> get competitors => _competitors;
  List<UserModel> activeUsers;

  void fetchActiveUsers({int activity = 0}) async {
    final result = await _homeRepository.fetchActiveUsers(activity: activity);
    result.fold(
      (userList) {
        _activeUsers = userList;
        return activeUsers = userList;
      },
      (error) => throw error,
    );
  }

  void filterUsers({@required String name}) async {
    activeUsers = _activeUsers
        .where((a) =>
            "${a.name.first.toLowerCase()}${a.name.last.toLowerCase()}"
                .contains(name.toLowerCase()))
        .toList();
  }

  void filterUsersByActivity({@required int activity}) async {
    if (activity >= 0) {
      activeUsers = _activeUsers.where((a) => a.activity == activity).toList();
    } else {
      activeUsers = _activeUsers;
    }
  }
}
