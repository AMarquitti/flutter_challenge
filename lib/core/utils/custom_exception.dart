import 'package:flutter/foundation.dart';

class CustomException implements Exception{
  final String msg;

  CustomException({@required this.msg});

  @override
  String toString() {
    return msg;
  }
}