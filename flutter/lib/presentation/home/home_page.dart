import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/activity_model.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/home/home_state.dart';
import '../../config/injection/injection.dart';
import '../../core/res/color_palette.dart';
import '../core/layouts/layout.dart';
import '../core/styles/general_style.dart';
import '../core/widgets/app_buttom_bar.dart';
import '../user/widgets/user_card.dart';
import 'widgets/home_activity_card.dart';

class HomePage extends HookWidget implements AutoRouteWrapper {
  HomePage({Key key, this.currentUser}) : super(key: key);
  final UserModel currentUser;
  final ReactiveModel<double> titlePosition = RM.create(0);

  @override
  Widget build(BuildContext context) {
    final UserModel user = RM.get<HomeState>().state.currentUser;
    final ScrollController _scrollController = useScrollController();

    _scrollController.addListener(() {
      titlePosition.setState((double s) => s = _scrollController.offset);
    });
    return Layout(
        drawer: true,
        widgetTopRight: UserCard(
          user: user,
          radius: 24,
        ),
        backgroundColor: ColorPalette.primaryColor,
        bottomNavigationBar:
            const AppBottomBar(currentIndex: AppBottomBarContent.home),
        title: StateBuilder<double>(
          observe: () => titlePosition,
          builder: (_, __) => Positioned(
              top: 100,
              left: 50,
              child: Txt(
                FlutterI18n.translate(context, 'titles.authLanding'),
                style: titleWhite..fontSize(48 - (titlePosition.state * 0.4)),
              )),
        ),
        subtitle: StateBuilder<double>(
            observe: () => titlePosition,
            builder: (_, __) => Positioned(
                top: 150,
                left: 140,
                child: Txt(
                  FlutterI18n.translate(context, 'subtitles.authLanding'),
                  style: titleGreen..fontSize(48 - (titlePosition.state * 0.4)),
                ))),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 150,
                    right: -120,
                    child: Image.asset(
                      'assets/img/green_line.png',
                      scale: 1,
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 250),
                        Txt(
                            FlutterI18n.translate(
                                context, 'subtitles.recommended'),
                            style: subtitleStyle.clone()
                              ..textColor(Colors.white)),
                        const SizedBox(height: 10),
                        buildListView(HomeState.getActivityList()),
                        const SizedBox(height: 20),
                        Txt(FlutterI18n.translate(context, 'subtitles.news'),
                            style: subtitleStyle.clone()
                              ..textColor(Colors.white)),
                        const SizedBox(height: 10),
                        buildListView(HomeState.getActivityList()),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  Widget buildListView(List<ActivityModel> activityList) => Container(
        color: Colors.transparent,
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(activityList.length, (int index) {
            return Center(
              child: HomeActivityCard(
                activity: activityList[index],
              ),
            );
          }),
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) {
    final HomeState _homeState = getIt<HomeState>();
    _homeState.currentUser = currentUser;
    return Injector(
        inject: <Injectable>[Inject<HomeState>(() => _homeState)],
        builder: (_) => HomePage(currentUser: currentUser));
  }
}
