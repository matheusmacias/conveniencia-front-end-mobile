import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:dartz/dartz.dart';

abstract class SplashRepositoryImp{
  Future<Either<Failure, void>> load(SplashModel splashModel);
}