import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:conveniencia/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../common/error/common_errors.dart';

class SplashDataSource implements SplashDatasourceImpl{

  late FlutterSecureStorage flutterSecureStorage;
  @override
  Future<void> load(SplashModel splashModel) async {
    try {
      flutterSecureStorage = const FlutterSecureStorage();
      final token = await flutterSecureStorage.read(key: 'jwt_token');

      if (token == null) {
        throw CommonDesconhecidoError(message: 'Token não encontrado');
      }

      final decodedToken = JwtDecoder.decode(token);

      if (JwtDecoder.isExpired(token)) {
        throw CommonDesconhecidoError(message: 'Token expirado');
      }

      // TODO: Faça algo com o token decodificado

    } catch (e) {
      throw CommonDesconhecidoError(message: 'Erro ao carregar: $e');
    }
  }


}