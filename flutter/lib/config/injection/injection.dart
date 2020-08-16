import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../env/environment_config.dart';
import '../global_config.dart';
import 'injection.config.dart';


final GetIt getIt = GetIt.instance;
final EnvironmentConfig envConfig =  getIt<EnvironmentConfig>();
GlobalConfig globalConfig = getIt<GlobalConfig>();
@injectableInit
Future<void> configureInjections() async {
  $initGetIt(getIt, environment: EnvironmentConfig.env);
  await globalConfig.init();
}