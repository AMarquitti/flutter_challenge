import 'package:dio/dio.dart';

abstract class Api {
  
  final Dio client;

  Api(this.client);

  void addInterceptors(InterceptorsWrapper interceptorsWrapper);

}
