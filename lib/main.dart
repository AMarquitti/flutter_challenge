import 'package:challenge/config/injection/injection_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/router/routing.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load('.env');
  await configureInjections();
  runApp(ChallengeApp());
}


class ChallengeApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      useCountryCode: false, fallbackFile: globalConfig.lang, path: 'lang', forcedLocale: Locale(globalConfig.lang));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalConfig.themeData,
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: Router.splash,
      onGenerateRoute: Router.onGenerateRoute,
      navigatorKey: Router.navigatorKey,
    );
  }
}
