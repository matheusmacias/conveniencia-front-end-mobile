import 'package:conveniencia/app/features/splash/domain/entities/splash_entity.dart';


class SplashModel extends SplashEntity {
  SplashModel({required super.token});

  factory SplashModel.fromJson(Map<String, dynamic> json) {
    return SplashModel(
      token: json['token'] as String,
    );
  }
}
