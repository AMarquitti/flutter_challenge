import 'package:challenge/config/global_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_config.iconfig.dart';

final GetIt getIt = GetIt.instance;
GlobalConfig globalConfig;
@injectableInit
Future<void> configureInjections() async {
 $initGetIt(getIt,environment: Env.prod);
 globalConfig = getIt<GlobalConfig>();
 await globalConfig.init();
}
abstract class Env{
  static const dev  = 'dev';
  static const prod  = 'prod';
}