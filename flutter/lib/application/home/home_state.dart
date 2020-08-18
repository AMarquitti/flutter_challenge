import 'package:challange_shared/model/activity_model.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/home/home_repository.dart';

@lazySingleton
class HomeState {
  HomeState(this._homeRepository);

  final HomeRepository _homeRepository;

  UserModel currentUser;
  List<UserModel> activeUsers;

  static final List<ActivityModel> activityList = <ActivityModel>[
    ActivityModel(
        workouts: 8,
        title: 'activitiesOne.title',
        subtitle: 'activitiesOne.subtitle',
        image: 'athlete.png'),
    ActivityModel(
        workouts: 8,
        title: 'activitiesTwo.title',
        subtitle: 'activitiesTwo.subtitle',
        image: 'athlete2.png'),
    ActivityModel(
        workouts: 8,
        title: 'activitiesThree.title',
        subtitle: 'activitiesThree.subtitle',
        image: 'athlete3.png'),
    ActivityModel(
        workouts: 8,
        title: 'activitiesOne.title',
        subtitle: 'activitiesOne.subtitle',
        image: 'athlete4.png'),
  ];

  

  static List<ActivityModel> getActivityList() {
    activityList.shuffle();
    return activityList;
  }

  Future<void> fetchActiveUsers({int activity = 0}) async {
    final Either<List<UserModel>, Exception> result =
        await _homeRepository.fetchActiveUsers(activity: activity);
    result.fold(
      (List<UserModel> userList) {
        activeUsers = userList;
        return true;
      },
      (Exception error) => throw error,
    );
  }
}
