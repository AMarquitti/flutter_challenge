import 'package:flutter/foundation.dart';

class CustomException implements Exception {
  CustomException({@required this.msg});

  final String msg;

  @override
  String toString() {
    return msg;
  }
}
