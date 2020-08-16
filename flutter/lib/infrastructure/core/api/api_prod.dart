import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../config/env/environment_config.dart';
import '../../../config/injection/injection.dart';
import 'api.dart';

@Injectable(as: Api, env: <String>[EnvironmentConfig.prod])
class ApiProd extends Api {
  ApiProd() : super(Dio(BaseOptions(baseUrl: envConfig.baseUrl))) {
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
