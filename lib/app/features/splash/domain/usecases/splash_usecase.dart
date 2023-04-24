import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:conveniencia/app/features/splash/domain/repositories/isplash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashUseCase{
  final SplashRepositoryImp splashRepositoryImp;

  SplashUseCase({required this.splashRepositoryImp});

  Future<Either<Failure, void>> call(SplashModel splashModel) async {
    return await splashRepositoryImp.load(splashModel);
  }
}