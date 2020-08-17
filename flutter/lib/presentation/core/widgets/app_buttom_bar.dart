import 'package:auto_route/auto_route.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

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
          child: AppBottomBarContent(currentIndex: currentIndex)),
    );
  }
}

class AppBottomBarContent extends BottomNavigationBar {
  static const int home = 0;
  static const int profile = 1;

  AppBottomBarContent({
    int currentIndex = 0,
  }) : super(
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
              text: 'Home',
              active: AppBottomBarContent.home == currentIndex,
              iconName: Icons.home,
            ),
            AppBottomNavigationBarItem(
              text: 'Profile',
              active: AppBottomBarContent.profile == currentIndex,
              iconName: Icons.person,
            ),
          ],
          onTap: (int index) {
            if (index == currentIndex) return false;
            switch (index) {
              case home:
                ExtendedNavigator.root.pushAndRemoveUntil(
                    Routes.homePage, (Route<dynamic> route) => false);
                break;
              case profile:
                break;
            }
          },
        );
}

class AppBottomNavigationBarItem extends BottomNavigationBarItem {
  AppBottomNavigationBarItem({
    @required this.iconName,
    @required this.text,
    @required this.active,
  }) : super(
          icon: Icon(iconName, color: ColorPalette.colorAccent, size: 22),
          title: Container(
            margin: const EdgeInsets.only(top: 2),
            child: Txt(
              text,
              style: subtitleStyle.clone()..fontSize(14),
            ),
          ),
        );

  final IconData iconName;
  final String text;
  final bool active;
}
