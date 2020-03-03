import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/router/routing.gr.dart';

void main() => runApp(ChallengeApp());


class ChallengeApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      useCountryCode: false, fallbackFile: "es", path: 'lang', forcedLocale: const Locale("es"));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange, fontFamily: 'Lato'),
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
