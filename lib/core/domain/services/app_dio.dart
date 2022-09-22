import 'package:dio/dio.dart';

abstract class AppDio {
  Future<Response> get(String path, [Options? options]);
}
