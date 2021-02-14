import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'config/global_config.dart';
import 'config/injection/injection.dart';
import 'config/router/guard/auth_guard.dart';
import 'config/router/routing.gr.dart' as rt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  final GlobalConfig globalConfig = getIt<GlobalConfig>();
  await globalConfig.init();
  runApp(ChallengeApp(globalConfig));
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp(this.globalConfig, {Key key}) : super(key: key);
  final GlobalConfig globalConfig;

  @override
  Widget build(BuildContext context) {
    final rt.Router router = rt.Router();
    return Injector(
        inject: <Injectable>[Inject<GlobalConfig>(() => globalConfig)],
        builder: (_) => StateBuilder<GlobalConfig>(
            observe: () => RM.get<GlobalConfig>(),
            watch: (ReactiveModel<GlobalConfig> config) => config.state.lang,
            builder: (_, ReactiveModel<GlobalConfig> config) => MaterialApp(
                  theme: config.state.themeData,
                  localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                    config.state.flutterI18nDelegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  builder: ExtendedNavigator<rt.Router>(
                    router: router,
                    guards: <RouteGuard>[AuthGuard()],
                  ),
                  initialRoute: rt.Routes.splash,
                  onGenerateRoute: router.onGenerateRoute,
                )));
  }
}
