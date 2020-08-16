import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../config/injection/injection.dart';
import '../../core/widgets/lang_changer.dart';

class HomeDrawer extends HookWidget {
  const HomeDrawer();

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        color: globalConfig.themeLight ? Colors.black87 : Colors.white);
    final ValueNotifier<String> _langAnimation =
        useState(globalConfig.lang == 'es' ? 'reverse' : 'forward');
    final ValueNotifier<bool> _themeLight = useState(globalConfig.themeLight);
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: globalConfig.themeLight ? Colors.white : Colors.black87),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: globalConfig.themeLight
                        ? Colors.white
                        : Colors.black87),
                child: Center(
                    child: Column(children: <Widget>[
                  const SizedBox(
                    height: 80,
                    child: Text(
                      'WC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontSize: 70,
                      ),
                    ),
                  ),
                  getLangChanger(context, _langAnimation)
                ]))),
            const Divider(),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    FlutterI18n.translate(context, 'menu.changeTheme'),
                    style: textStyle,
                  ),
                  Switch(
                    value: !_themeLight.value,
                    onChanged: (bool value) {
                      _themeLight.value = !value;
                      globalConfig.setGlobalTheme(
                          themeValue: _themeLight.value);
                    },
                    activeTrackColor: Colors.deepOrange,
                    activeColor: Colors.deepOrange,
                  ),
                ],
              ),
              leading: Icon(
                Icons.palette,
                color: globalConfig.themeLight ? Colors.black87 : Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/onboarding');
              },
            ),
            const Divider(),
            ListTile(
              title: Row(
                children: <Widget>[
                  Text(
                    FlutterI18n.translate(context, 'menu.exit'),
                    style: textStyle,
                  ),
                ],
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: globalConfig.themeLight ? Colors.black87 : Colors.white,
              ),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
