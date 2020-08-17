import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'config/global_config.dart';
import 'config/injection/injection.dart';
import 'config/router/guard/auth_guard.dart';
import 'config/router/routing.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjections();
  runApp(ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: <Injectable>[Inject<GlobalConfig>(() => globalConfig)],
        builder: (_) => MaterialApp(
      theme: globalConfig.themeData,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        globalConfig.flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: ExtendedNavigator<Router>(
        router: globalConfig.router,
        guards: <RouteGuard>[AuthGuard()],
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: globalConfig.router.onGenerateRoute,
    ))
        ;
  }
}
