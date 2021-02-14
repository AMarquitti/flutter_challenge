import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/colors.dart';
import 'router/routing.gr.dart' as rt;

@singleton
class GlobalConfig {
  SharedPreferences prefs;
  String lang = 'en';
  bool themeLight = false;
  rt.Router router;
  FlutterI18nDelegate flutterI18nDelegate;

  Future<void> init() async {
    //user preferences
    prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('lang') ?? lang;
    themeLight = prefs.getBool('theme') ?? themeLight;

    //app init
    flutterI18nDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
          basePath: 'lang', forcedLocale:  Locale(lang)),
    );
  }

  Future<void> setGlobalLang(String selectedLang) async {
    lang = selectedLang;
    await prefs.setString('lang', selectedLang);
    flutterI18nDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
          basePath: 'lang', forcedLocale: Locale(selectedLang)),
    );
  }

  Future<void> setGlobalTheme({@required bool themeValue}) async {
    themeLight = !themeValue;
    await prefs.setBool('theme', themeLight);
  }

  ThemeData get themeData {
    if (themeLight) {
      return ThemeData(
          primaryColor: ColorRes.primaryColor,
          backgroundColor: ColorRes.contentColor,
          fontFamily: 'raleway');
    } else {
      return ThemeData(
          primaryColor: ColorRes.primaryColor,
          backgroundColor: ColorRes.contentDarkColor,
          fontFamily: 'raleway');
    }
  }
}
