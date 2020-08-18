import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../config/global_config.dart';

Widget getLangChanger() {
  final ReactiveModel<GlobalConfig> globalConfig = RM.get<GlobalConfig>();
  return Builder(
    builder: (BuildContext context) => FlatButton(
      onPressed: () async {
        final String locale = globalConfig.state.lang == 'en' ? 'es' : 'en';
        globalConfig.setState((GlobalConfig s) => s.setGlobalLang(locale));
      },
      splashColor: Colors.deepOrange,
      shape: const CircleBorder(),
      color: Colors.black,
      child: StateBuilder<GlobalConfig>(
        observe: () => globalConfig,
        builder: (_, __) => FlareActor('assets/img/flag.flr',
            sizeFromArtboard: true,
            animation: globalConfig.state.lang == 'es' ? 'reverse' : 'forward'),
      ),
    ),
  );
}
