import 'package:challange_shared/model/activity_model.dart';
import 'package:challenge/core/res/color_palette.dart';
import 'package:challenge/presentation/core/styles/general_style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../core/layouts/layout.dart';

class WorkoutLanding extends StatelessWidget {
  const WorkoutLanding({Key key, this.activity}) : super(key: key);
  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    final ParentStyle _appbarStyle = ParentStyle()
      ..padding(all: 0)
      ..margin(all: 0)
      ..background.color(Colors.black)
      ..background
          .image(path: 'assets/img/${activity.image}', fit: BoxFit.cover);
    return Layout(
      stack: false,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
              titleSpacing: 0.0,
              title: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Txt(
                        FlutterI18n.translate(context, activity.title),
                        style: titleWhite.clone()..fontSize(20),
                      ),
                      Txt(
                        FlutterI18n.translate(context, activity.subtitle),
                        style: subtitleCardStyle.clone()
                          ..bold()
                          ..fontSize(36)
                          ..textColor(ColorPalette.colorAccent),
                      )
                    ],
                  )
                ],
              ),
              expandedHeight: _screen.height * 0.4,
              flexibleSpace: Parent(
                style: _appbarStyle,
                child: Container(),
              ))
        ],
      ),
    );
  }
}
