import 'package:challange_shared/model/user_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../application/home/home_state.dart';
import '../../../config/injection/injection.dart';
import '../../../core/res/color_palette.dart';
import '../../core/styles/general_style.dart';
import '../../user/widgets/user_card.dart';
import '../hooks/user_list_hook.dart';

class HomeBody extends HookWidget {
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
        Txt(
          'Friends',
          style: subtitleStyle.clone()..padding(left: 23),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: globalConfig.themeLight ? Colors.white : Colors.black87,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          margin: const EdgeInsets.all(5),
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
        )
      ],
    );
  }

  Widget buildGridView(List<UserModel> userList) => Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: globalConfig.themeLight ? Colors.white : Colors.black87,
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
}
