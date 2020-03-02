import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_config.iconfig.dart';

final GetIt getIt = GetIt.instance;
@injectableInit
void configureInjections() => $initGetIt(getIt,environment: Env.prod);
abstract class Env{
  static const dev  = 'dev';
  static const prod  = 'prod';
}