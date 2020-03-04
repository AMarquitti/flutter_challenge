import 'package:challenge/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GlobalConfig {
  SharedPreferences prefs;
  String lang = "en";
  bool themeLight = true;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    lang = prefs.getString("lang") ?? lang;
    themeLight = prefs.getBool("theme") ?? themeLight;
  }

  Future<void> setGlobalLang(String selectedLang) async {
    lang = selectedLang;
    prefs.setString("lang", selectedLang);
  }

  Future<void> setGlobalTheme({@required bool themeValue}) async {
    themeLight = themeValue;
    prefs.setBool("theme", themeLight);
  }

  ThemeData get themeData {
    if (themeLight) {
      return ThemeData(
          primaryColor: ColorRes.primaryColor,
          backgroundColor: ColorRes.contentColor,
          fontFamily: 'Lato');
    } else {
      return ThemeData(
          primaryColor: ColorRes.primaryColor,
          backgroundColor: ColorRes.contentDarkColor,
          fontFamily: 'Lato');
    }
  }
}
