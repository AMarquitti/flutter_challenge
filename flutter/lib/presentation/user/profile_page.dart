import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/home/home_state.dart';
import '../../config/injection/injection.dart';
import '../core/layouts/layout.dart';
import '../core/widgets/app_buttom_bar.dart';
import 'widgets/profile_body.dart';
import 'widgets/profile_header.dart';

class ProfilePage extends StatelessWidget implements AutoRouteWrapper {
  const ProfilePage({Key key, this.currentUser}) : super(key: key);
  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    

    return Layout(
        backgroundColor: Colors.white,
        widgetTopLeft: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: const Icon(
              Icons.keyboard_backspace,
              size: 40.0,
              color: Colors.white,
            )),
        bottomNavigationBar:
            const AppBottomBar(currentIndex: AppBottomBarContent.home),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ProfileHeader(currentUser: currentUser),
            Container(
              padding: const EdgeInsets.only(left: 23),
              child: ProfileBody(),
            )
          ],
        )));
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return Injector(
        inject: <Injectable>[Inject<HomeState>(() => getIt<HomeState>())],
        builder: (_) => ProfilePage(currentUser: currentUser));
  }
}
