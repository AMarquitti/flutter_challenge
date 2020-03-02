import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../config/injection/injection_config.dart';

void useInitializeDependencies() => Hook.use(const _InitializeDependencies());

class _InitializeDependencies extends Hook<void> {
  const _InitializeDependencies();

  @override
  _InitializeDependenciesState createState() =>
      _InitializeDependenciesState();
}

class _InitializeDependenciesState
    extends HookState<void, _InitializeDependencies> {
  @override
  Future<void> initHook() async {
    super.initHook();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DotEnv().load('.env');
    configureInjections();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
  }
}
