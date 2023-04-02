

import 'package:conveniencia/app/common/error/failure.dart';

class CommonNoInternetConnectionError extends Failure {
  CommonNoInternetConnectionError({message, stack})
      : super(
      errorMessage: message ?? "Sem conexão com a internet",
      stackTrace: stack);
}

class CommonNoDataFoundError extends Failure {
  CommonNoDataFoundError({message, stack})
      : super(
    errorMessage: message ?? "Nenhum dado encontrado",
    stackTrace: stack,
  );
}

class CommonDesconhecidoError extends Failure {
  CommonDesconhecidoError({message, stack})
      : super(
    errorMessage: message ?? "Erro desconhecido",
    stackTrace: stack,
  );
}