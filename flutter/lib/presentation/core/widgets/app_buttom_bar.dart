import 'package:auto_route/auto_route.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';
// ignore_for_file: sort_constructors_first

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key key, @required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..boxShadow(
            color: ColorPalette.primaryColor,
            offset: const Offset(2, 1),
            blur: 10,
            spread: 0.2)
        ..padding(top: 2),
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
  static const int statistics = 1;

  AppBottomBarContent({
    int currentIndex = 0,
  }) : super(
          type: BottomNavigationBarType.fixed,
          fixedColor: ColorPalette.primaryColor,
          unselectedItemColor: ColorPalette.primaryColor,
          currentIndex: currentIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.white,
          elevation: 10,
          items: <BottomNavigationBarItem>[
            AppBottomNavigationBarItem(
              text: 'Inicio',
              active: AppBottomBarContent.home == currentIndex,
              iconName: 'home_icon.png',
            ),
            AppBottomNavigationBarItem(
              text: 'Statistics',
              active: AppBottomBarContent.statistics == currentIndex,
              iconName: 'account_icon.png',
            ),
        
          ],
          onTap: (int index) {
            if(index == currentIndex) return false;
            switch (index) {
              case home:
                ExtendedNavigator.root.pushAndRemoveUntil(
                    Routes.home, (Route<dynamic> route) => false);
                break;
              case statistics:
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
          icon: Icon(Icons.home,
              color: ColorPalette.colorAccent, size: 22),
          title: Container(
            margin: const EdgeInsets.only(top: 2),
            child: Text(
              text,
            ),
          ),
        );

  final String iconName;
  final String text;
  final bool active;
}
