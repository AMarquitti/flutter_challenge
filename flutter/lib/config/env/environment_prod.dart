import 'package:injectable/injectable.dart';

import 'environment_config.dart';

@Injectable(as: EnvironmentConfig, env: <String>[EnvironmentConfig.prod])
class EnvironmentProd extends EnvironmentConfig {
  @override
  String get baseUrl => 'https://randomuser.me/api';

  @override
  String get appEnvironment => 'prod';
}
