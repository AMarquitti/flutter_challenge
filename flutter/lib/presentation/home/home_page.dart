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
  HomePage({Key key}) : super(key: key);

  final ReactiveModel<double> titlePosition = RM.create(0);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<HomeState> _homeState = RM.get<HomeState>();
    final UserModel currentUser = _homeState.state.currentUser;
    final ScrollController _scrollController = useScrollController();

    //infinite scroll simulation
    final ScrollController _listScrollController = useScrollController();
    final ScrollController _listScrollControllerSecond = useScrollController();

    _scrollController.addListener(() {
      titlePosition.setState((double s) => s = _scrollController.offset);
    });

    Widget buildListView(ScrollController scrollController) =>
        StateBuilder<HomeState>(
          afterInitialBuild: (_, ReactiveModel<HomeState> model) {
            scrollController
                .addListener(() => _scrollListener(scrollController));
          },
          observe: () => _homeState,
          builder: (BuildContext context, ReactiveModel<dynamic> model) {
            return Container(
              color: Colors.transparent,
              height: 200,
              child: ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(model.state.activityList.length,
                    (int index) {
                  return Center(
                    child: HomeActivityCard(
                      activity: model.state.activityList[index],
                    ),
                  );
                }),
              ),
            );
          },
        );

    return Layout(
        drawer: true,
        widgetTopRight: UserCard(
          user: currentUser,
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
                        buildListView(_listScrollController),
                        const SizedBox(height: 20),
                        Txt(FlutterI18n.translate(context, 'subtitles.news'),
                            style: subtitleStyle.clone()
                              ..textColor(Colors.white)),
                        const SizedBox(height: 10),
                        buildListView(_listScrollControllerSecond),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  void _scrollListener(ScrollController scrollController) {
    final ReactiveModel<HomeState> _homeState = RM.get<HomeState>();
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _homeState.setState((HomeState s) => s
          .fetchActivityList()
          .then((List<ActivityModel> value) => s.activityList.addAll(value)));
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return Injector(
        inject: <Injectable>[Inject<HomeState>(() => getIt<HomeState>())],
        builder: (_) => HomePage());
  }
}
