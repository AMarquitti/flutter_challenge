import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../env/environment_config.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;
final EnvironmentConfig envConfig = getIt<EnvironmentConfig>();

@injectableInit
Future<void> configureInjection() async {
  $initGetIt(getIt, environment: EnvironmentConfig.env);
}
