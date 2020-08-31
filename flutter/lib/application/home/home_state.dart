import 'package:challange_shared/model/activity_model.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:challenge/application/auth/auth_state.dart';
import 'package:challenge/config/injection/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/home/home_local_repository.dart';
import '../../infrastructure/home/home_repository.dart';

@singleton
class HomeState {
  HomeState(this._homeRepository, this._homeLocalRepository);

  final HomeRepository _homeRepository;

  final HomeLocalRepository _homeLocalRepository;

  UserModel  get currentUser =>  getIt<AuthState>().authUser;
  
  List<UserModel> activeUsers;

  List<ActivityModel> activityList;

  @factoryMethod
  static Future<HomeState> load() async {
    final HomeState homeState =
        HomeState(getIt<HomeRepository>(), getIt<HomeLocalRepository>());
    await homeState.init();
    return homeState;
  }

  Future<void> init() async {
    activityList = await fetchActivityList();
  }

  Future<List<ActivityModel>> fetchActivityList() async {
   return _homeLocalRepository.getActivityList();
  }

  Future<void> fetchActiveUsers({int activity = 0}) async {
    final Either<Exception, List<UserModel>> result =
        await _homeRepository.fetchActiveUsers(activity: activity);
    result.fold((Exception error) => throw error, (List<UserModel> userList) {
      activeUsers = userList;
      return true;
    });
  }
}
