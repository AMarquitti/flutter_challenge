import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/activity_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';
import '../../core/styles/general_style.dart';

class HomeActivityCard extends StatelessWidget {
  const HomeActivityCard({Key key, this.activity}) : super(key: key);
  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ExtendedNavigator.root.push(Routes.workoutLanding,
          arguments: WorkoutLandingArguments(activity: activity)),
      child: Parent(
        style: ParentStyle()
          ..background
              .image(path: 'assets/img/${activity.image}', fit: BoxFit.cover)
          ..height(200)
          ..width(200)
          ..padding(all: 5)
          ..margin(right: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Txt(
                FlutterI18n.translate(context, activity.title),
                style: titleWhite.clone()..fontSize(20),
              ),
              const SizedBox(height: 5),
              Row(children: <Widget>[
                Txt(
                  '${activity.workouts} Workouts',
                  style: subtitleCardStyle,
                ),
                Txt(
                  ' | ',
                  style: subtitleCardStyle,
                ),
                Txt(
                  FlutterI18n.translate(context, activity.subtitle),
                  style: subtitleCardStyle.clone()
                    ..bold()
                    ..textColor(ColorPalette.colorAccent),
                ),
              ]),
              const SizedBox(height: 15)
            ]),
      ),
    );
  }
}
