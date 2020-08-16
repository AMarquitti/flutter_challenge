import 'package:challenge/config/injection/injection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../config/env/environment_config.dart';
import 'api.dart';

@Injectable(as: Api, env: <String>[EnvironmentConfig.dev])
class ApiDev extends Api {
  ApiDev() : super(Dio(BaseOptions(baseUrl: envConfig.baseUrl))) {
    //Custom interceptors for DEV environment
    addInterceptors(interceptorsWrapper);
  }

  final InterceptorsWrapper interceptorsWrapper =
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
    return options;
  });

  @override
  void addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    client.interceptors.add(interceptorsWrapper);
  }
}
