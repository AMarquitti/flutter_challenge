
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class GlobalConfig {
  SharedPreferences prefs;
  String lang = "es";
  GlobalConfig();

  Future<void> init() async {
    prefs =  await SharedPreferences.getInstance();
    lang = prefs.getString("lang") ?? lang;
  }

  Future<void> setGlobalLang(String selectedLang) async {
    lang =selectedLang;
    prefs.setString("lang",selectedLang);
  }

}