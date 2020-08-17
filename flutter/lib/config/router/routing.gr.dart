// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/auth_page.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/splash/splash.dart';
import '../../presentation/user/profile_page.dart';

class Routes {
  static const String splash = '/';
  static const String authPage = '/auth-page';
  static const String profilePage = '/profile-page';
  static const String homePage = '/home-page';
  static const all = <String>{
    splash,
    authPage,
    profilePage,
    homePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.homePage, page: HomePage),
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
    ProfilePage: (data) {
      final args = data.getArgs<ProfilePageArguments>(
        orElse: () => ProfilePageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(
          key: args.key,
          currentUser: args.currentUser,
        ).wrappedRoute(context),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(
          key: args.key,
          currentUser: args.currentUser,
        ).wrappedRoute(context),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfilePage arguments holder class
class ProfilePageArguments {
  final Key key;
  final UserModel currentUser;
  ProfilePageArguments({this.key, this.currentUser});
}

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final UserModel currentUser;
  HomePageArguments({this.key, this.currentUser});
}
