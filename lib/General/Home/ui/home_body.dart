import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../User/model/user_model.dart';
import '../../../User/widgets/user_card.dart';
import '../hooks/user_list_hook.dart';
import '../state/home_store.dart';

class HomeBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useInitializeUserList();

    Center buildLoading() {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(5),
      child: StateBuilder<HomeStore>(
        models: [Injector.getAsReactive<HomeStore>()],
        builder: (context, reactiveModel) {
          return reactiveModel.whenConnectionState(
            onIdle: () => buildLoading(),
            onWaiting: () => buildLoading(),
            onData: (userList) => buildGridView(userList.activeUsers),
            onError: (error) => Center(),
          );
        },
      ),
    );
  }

  ScrollController useScrollControllerForList() {
    final ReactiveModel<HomeStore> homeModel =
        Injector.getAsReactive<HomeStore>();

    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      final bool isEnd =
          scrollController.offset == scrollController.position.maxScrollExtent;
      if (isEnd) {
        homeModel.setState((store) => store.fetchActiveUsers());
      }
    });
    return scrollController;
  }

  Widget buildGridView(List<UserModel> userList) => Container(
        margin: const EdgeInsets.only(top: 0, right: 10, bottom: 10),
        child: GridView.count(
          primary: true,
          shrinkWrap: true,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 4,
          children: List.generate(userList.length, (index) {
            return UserCard(
              user: userList[index],
            );
          }),
        ),
      );
}
