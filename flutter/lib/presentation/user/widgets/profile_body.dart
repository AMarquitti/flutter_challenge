import 'package:challange_shared/model/activity_model.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../application/home/home_state.dart';
import '../../core/styles/general_style.dart';
import '../../home/hooks/user_list_hook.dart';
import '../../home/widgets/home_activity_card.dart';
import '../../user/widgets/user_card.dart';

class ProfileBody extends HookWidget {
  
  const ProfileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<HomeState> homeModel = RM.get<HomeState>();
    useInitializeUserList();
    Center buildLoading() {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20),
        Txt(FlutterI18n.translate(context, 'subtitles.friends'),
            style: subtitleStyle),
        const SizedBox(height: 10),
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: const EdgeInsets.only(right: 5),
          child: StateBuilder<HomeState>(
            observe: () => homeModel,
            builder: (_, ReactiveModel<HomeState> state) {
              return state.whenConnectionState(
                onIdle: () => buildLoading(),
                onWaiting: () => buildLoading(),
                onData: (HomeState state) => buildGridView(state.activeUsers),
                onError: (dynamic error) => const Center(),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Txt(FlutterI18n.translate(context, 'subtitles.favrites'),
            style: subtitleStyle),
        const SizedBox(height: 10),
        buildListView(RM.get<HomeState>().state.activityList),
      ],
    );
  }

  Widget buildGridView(List<UserModel> userList) => Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List<Widget>.generate(userList.length, (int index) {
            return Center(
              child: UserCard(
                user: userList[index],
              ),
            );
          }),
        ),
      );

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
}
