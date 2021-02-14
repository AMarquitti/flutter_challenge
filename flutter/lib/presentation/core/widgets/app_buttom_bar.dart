import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../../application/auth/auth_state.dart';
import '../../../config/global_config.dart';
import '../../../config/injection/injection.dart';
import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';
import '../styles/general_style.dart';
// ignore_for_file: sort_constructors_first

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key key, @required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..padding(top: 2),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
          child: AppBottomBarContent(
              context: context, currentIndex: currentIndex)),
    );
  }
}

class AppBottomBarContent extends BottomNavigationBar {
  static const int home = 0;
  static const int profile = 1;
  static UserModel currentUser = getIt<AuthState>().authUser;

  AppBottomBarContent({Key key, int currentIndex = 0, BuildContext context})
      : super(
          key: key,
          type: BottomNavigationBarType.fixed,
          fixedColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor,
          currentIndex: currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            AppBottomNavigationBarItem(
              text: '',
              active: AppBottomBarContent.home == currentIndex,
              iconImage: 'menu_icon.png',
            ),
            AppBottomNavigationBarItem(
              text: '',
              active: AppBottomBarContent.profile == currentIndex,
              iconImage: 'user_icon.png',
            ),
          ],
          onTap: (int index) {
            switch (index) {
              case home:
                Scaffold.of(context).openDrawer();
                break;
              case profile:
                ExtendedNavigator.root.pushAndRemoveUntil(
                    Routes.profilePage, (Route<dynamic> route) => true,
                    arguments: ProfilePageArguments(currentUser: currentUser));
                break;
            }
          },
        );
}

class AppBottomNavigationBarItem extends BottomNavigationBarItem {
  final GlobalConfig config = getIt<GlobalConfig>();
  AppBottomNavigationBarItem({
    @required this.iconImage,
    @required this.text,
    @required this.active,
  }) : super(
          icon: ImageIcon(AssetImage('assets/img/icons/$iconImage'),
              color: ColorPalette.colorAccent, size: 22),
          title: Container(
            margin: const EdgeInsets.only(top: 2),
            child: Txt(
              text,
              style: subtitleStyle.clone()..fontSize(14),
            ),
          ),
        );

  final String iconImage;
  final String text;
  final bool active;
}
