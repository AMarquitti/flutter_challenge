import 'package:challenge/config/injection/injection_config.dart';
import 'package:challenge/core/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(Api, env: Env.prod)
@lazySingleton
class ApiProd extends Api {
  static final BaseOptions _baseOptions =
      BaseOptions(baseUrl: DotEnv().env['BASE_URL_PROD'].toString());

  final InterceptorsWrapper interceptorsWrapper =
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
    return options;
  });

  ApiProd() : super(Dio(_baseOptions)) {
    addInterceptors(interceptorsWrapper);
  }

  @override
  void addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    client.interceptors.add(interceptorsWrapper);
  }
}
