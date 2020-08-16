import 'package:injectable/injectable.dart';

import 'environment_config.dart';

@Injectable(as: EnvironmentConfig, env: <String>[EnvironmentConfig.dev])
class EnvironmentDev extends EnvironmentConfig {
  @override
  String get baseUrl => 'https://randomuser.me/api';

  @override
  String get appEnvironment => 'dev';
}
