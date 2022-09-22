import 'app_base_error.dart';

class HttpError extends AppBaseError {
  final int? statusCode;

  HttpError(StackTrace stackTrace, {this.statusCode})
      : super(_httpErrorMessage(statusCode), stackTrace);
}

String _httpErrorMessage(int? statusCode) {
  switch (statusCode) {
    case 401:
      return 'Falha na autenticação.';
    case 404:
      return 'Dados não encontrados.';
    case 500:
      return 'Erro de servidor.';

    //CODIGOS FICTICIOS PARA ERROS SEM STATUSCODE (TIMEOUT E SOCKET EXCEPTION)
    case 901:
      return 'Sem acesso à internet. Verifique sua conexão e tente novamente.';
    case 902:
      return 'Tempo excedido na solicitação dos dados, verifique sua conexão com a internet.';

    default:
      return 'Erro de servidor.';
  }
}
