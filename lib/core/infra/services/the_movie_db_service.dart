import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/utils/api_paths.dart';

import '../../domain/services/app_dio.dart';

final $MovieService = GetIt.I.registerLazySingleton<AppDio>(
  () => TheMovieDBService(),
);

class TheMovieDBService extends AppDio {
  final Dio _dio = Dio()..options.baseUrl = ApiPath().baseURL;
  // ..options.sendTimeout = 20000
  // ..options.receiveTimeout = 20000
  // ..options.connectTimeout = 20000;

  @override
  Future<Response> get(String path, [Options? options]) async {
    return await _dio.get(path, options: options);
  }
}
