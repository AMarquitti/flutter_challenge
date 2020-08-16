// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/auth_page.dart';
import '../../presentation/home/home.dart';
import '../../presentation/splash/splash.dart';

class Routes {
  static const String splash = '/';
  static const String authPage = '/auth-page';
  static const String home = '/Home';
  static const all = <String>{
    splash,
    authPage,
    home,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.home, page: Home),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Splash(),
        settings: data,
      );
    },
    AuthPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthPage().wrappedRoute(context),
        settings: data,
      );
    },
    Home: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Home().wrappedRoute(context),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
  };
}
