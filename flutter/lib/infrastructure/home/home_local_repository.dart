import 'dart:convert';

import 'package:challange_shared/model/activity_model.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart' show rootBundle;

@lazySingleton
class HomeLocalRepository {
  HomeLocalRepository();

  Future<List<ActivityModel>> getActivityList() async {
    final String activitiesJson =
        await rootBundle.loadString('assets/fixtures/activities.json');

    return List<ActivityModel>.from(json
        .decode(activitiesJson)
        .map((dynamic activity) => ActivityModel.fromMap(activity)));
  }
}
