// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:challange_shared/model/activity_model.dart';
import 'package:challange_shared/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/auth_page.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/splash/splash.dart';
import '../../presentation/user/profile_page.dart';
import '../../presentation/workout/workout_landing.dart';
import 'guard/auth_guard.dart';

class Routes {
  static const String splash = '/';
  static const String authPage = '/auth-page';
  static const String profilePage = '/profile-page';
  static const String homePage = '/home-page';
  static const String workoutLanding = '/workout-landing';
  static const all = <String>{
    splash,
    authPage,
    profilePage,
    homePage,
    workoutLanding,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splash, page: Splash),
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.profilePage, page: ProfilePage, guards: [AuthGuard]),
    RouteDef(Routes.homePage, page: HomePage, guards: [AuthGuard]),
    RouteDef(Routes.workoutLanding, page: WorkoutLanding, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Splash: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Splash(),
        settings: data,
      );
    },
    AuthPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AuthPage().wrappedRoute(context),
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
        pageBuilder: (context, animation, secondaryAnimation) =>
            HomePage(key: args.key).wrappedRoute(context),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),
      );
    },
    WorkoutLanding: (data) {
      final args = data.getArgs<WorkoutLandingArguments>(
        orElse: () => WorkoutLandingArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WorkoutLanding(activity: args.activity),
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
  HomePageArguments({this.key});
}

/// WorkoutLanding arguments holder class
class WorkoutLandingArguments {
  final ActivityModel activity;
  WorkoutLandingArguments({this.activity});
}
