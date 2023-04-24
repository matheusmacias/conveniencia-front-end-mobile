import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';

abstract class SplashDatasourceImpl{
  Future<void> load(SplashModel splashModel);
}