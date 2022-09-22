import 'dart:io';
import 'package:dio/dio.dart';

import '../errors/data_error.dart';
import '../errors/http_error.dart';

class ErrorHandler {
  static handleErrors(Object error, StackTrace stackTrace) {
    if (error is DioError) {
      if (error.response?.statusCode == 401) return;

      if (error.error is SocketException) {
        throw HttpError(statusCode: 901, stackTrace);
      }

      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout) {
        throw HttpError(statusCode: 902, stackTrace);
      }

      throw HttpError(statusCode: error.response?.statusCode, stackTrace);
    }

    if (error is TypeError || error is FormatException) {
      throw DataError('Erro no tratamento de dados.', stackTrace);
    }

    throw Exception('Erro desconhecido');
  }
}
