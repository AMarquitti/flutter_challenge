import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../config/global_config.dart';
import '../../../config/router/routing.gr.dart';
import '../../../core/res/color_palette.dart';
import '../../core/widgets/lang_changer.dart';

class HomeDrawer extends HookWidget {
  HomeDrawer();
  final ReactiveModel<GlobalConfig> globalConfig = RM.get<GlobalConfig>();
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        color: globalConfig.state.themeLight ? Colors.black87 : Colors.white);
    final ValueNotifier<String> _langAnimation =
        useState(globalConfig.state.lang == 'es' ? 'reverse' : 'forward');

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color:
                globalConfig.state.themeLight ? Colors.white : Colors.black87),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: globalConfig.state.themeLight
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
                        color: ColorPalette.colorAccent,
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
                    value: globalConfig.state.themeLight,
                    onChanged: (bool value) {
                      globalConfig
                          .setState((GlobalConfig s) => s.themeLight = value);
                    },
                    activeTrackColor: ColorPalette.colorAccent,
                    activeColor: ColorPalette.colorAccent,
                  ),
                ],
              ),
              leading: Icon(
                Icons.palette,
                color: globalConfig.state.themeLight
                    ? Colors.black87
                    : Colors.white,
              ),
              onTap: () {},
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
                color: globalConfig.state.themeLight
                    ? Colors.black87
                    : Colors.white,
              ),
              onTap: () {
                ExtendedNavigator.root.pushAndRemoveUntil(
                    Routes.authPage, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
