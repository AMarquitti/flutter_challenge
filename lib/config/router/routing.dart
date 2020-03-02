import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route/transitions_builders.dart';
import 'package:challenge/General/Auth/ui/auth_page.dart';
import 'package:challenge/views/home.dart';

import '../../General/Splash/ui/splash.dart';

@autoRouter
class $Router {
  @initial
  Splash splash;
  @CustomRoute(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 1500,
  )
  AuthPage authPage;
  @CustomRoute(
    transitionsBuilder: TransitionsBuilders.fadeIn,
    durationInMilliseconds: 1500,
  )
  Home homePage;
}
