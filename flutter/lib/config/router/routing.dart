import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../../presentation/auth/auth_page.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/splash/splash.dart';
import '../../presentation/user/profile_page.dart';


@MaterialAutoRouter(
  routes: <AutoRoute<dynamic>>[
    MaterialRoute<dynamic>(page: Splash, initial: true),
    MaterialRoute<dynamic>(page: AuthPage),
    //secure
    CustomRoute<dynamic>(
        page: ProfilePage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400),
    CustomRoute<dynamic>(
        page: HomePage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400),
  ],
)
class $Router {}
