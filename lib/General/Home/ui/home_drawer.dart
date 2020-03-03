import 'package:challenge/config/injection/injection_config.dart';
import 'package:challenge/core/widgets/lang_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeDrawer extends HookWidget {
  final ValueNotifier<String> _langAnimation;
  const HomeDrawer(this._langAnimation);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                  child: Column(children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Image.asset("assets/img/ic_launcher.png"),
                ),
                getLangChanger(context,_langAnimation)
              ]))),
          ListTile(
            title: Text("Text 1"),
            leading: Icon(Icons.video_library),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/onboarding');
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
