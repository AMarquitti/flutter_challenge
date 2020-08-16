import 'package:dio/dio.dart';

abstract class Api {
  Api(this.client);

  final Dio client;

  void addInterceptors(InterceptorsWrapper interceptorsWrapper);
}
