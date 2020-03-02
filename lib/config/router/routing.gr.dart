// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:challenge/General/Home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:challenge/General/Splash/ui/splash.dart';
import 'package:challenge/General/Auth/ui/auth_page.dart';
import 'package:auto_route/transitions_builders.dart';

class Router {
  static const splash = '/';
  static const authPage = '/auth-page';
  static const homePage = '/home-page';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.splash:
        return MaterialPageRoute(
          builder: (_) => Splash(),
          settings: settings,
        );
      case Router.authPage:
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              AuthPage().wrappedRoute,
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: Duration(milliseconds: 1500),
        );
      case Router.homePage:
        return PageRouteBuilder(
          pageBuilder: (ctx, animation, secondaryAnimation) => Home(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: Duration(milliseconds: 1500),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
