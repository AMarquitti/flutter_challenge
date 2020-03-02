import 'package:challenge/config/injection/injection_config.dart';
import 'package:challenge/core/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(Api, env: Env.prod)
@injectable
class ApiProd implements Api {
  static final BaseOptions _baseOptions =
      BaseOptions(baseUrl: DotEnv().env['BASE_URL_PROD'].toString());
  @override
  Dio get client => Dio(_baseOptions);

  ApiProd() {
    //Custom interceptors for DEV environment
    client.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      return options;
    }));
  }
}
