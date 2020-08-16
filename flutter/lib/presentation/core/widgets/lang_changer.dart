import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../config/injection/injection.dart';


Widget getLangChanger(
    BuildContext context, ValueNotifier<String> _langAnimation) {
  return FlatButton(
    onPressed: () async {
      final String locale = _langAnimation.value == 'forward' ? 'es' : 'en';
      globalConfig.setGlobalLang(locale);
      await FlutterI18n.refresh(context, Locale(locale));
      _langAnimation.value =
          _langAnimation.value == 'forward' ? 'reverse' : 'forward';
    },
    splashColor: Colors.deepOrange,
    shape: const CircleBorder(),
    color: Colors.black,
    child: FlareActor('assets/img/flag.flr',
        sizeFromArtboard: true,
        animation: _langAnimation.value),
  );
}
