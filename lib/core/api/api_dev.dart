import 'package:challenge/config/injection/injection_config.dart';
import 'package:challenge/core/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@RegisterAs(Api, env: Env.dev)
@lazySingleton
class ApiDev extends Api {
  
  static final BaseOptions _baseOptions =
      BaseOptions(baseUrl: DotEnv().env['BASE_URL_DEV'].toString());

  final InterceptorsWrapper interceptorsWrapper =
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
    return options;
  });

  ApiDev() : super(Dio(_baseOptions)) {
    //Custom interceptors for DEV environment
    addInterceptors(interceptorsWrapper);
  }

  @override
  void addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    client.interceptors.add(interceptorsWrapper);
  }
}
