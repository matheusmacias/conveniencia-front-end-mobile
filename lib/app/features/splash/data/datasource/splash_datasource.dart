  import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
  import 'package:conveniencia/app/features/splash/domain/datasource/isplash_datasource.dart';
  import 'package:flutter_secure_storage/flutter_secure_storage.dart';
  import 'package:jwt_decoder/jwt_decoder.dart';

  import '../../../../common/error/common_errors.dart';

  class SplashDataSource implements SplashDatasourceImpl{

    @override
    Future<void> load(SplashModel splashModel) async {
      try {
        final token = splashModel.token;
        if (JwtDecoder.isExpired(token)) {
          throw CommonNoDataFoundError(message: 'Token expirado');
        }

        // TODO: Faça algo com o token decodificado
      } catch (e) {
        throw CommonDesconhecidoError(message: 'Erro ao carregar: $e');
      }
    }


  }