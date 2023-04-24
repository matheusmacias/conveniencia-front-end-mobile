import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:conveniencia/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:conveniencia/app/features/splash/domain/repositories/isplash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepository implements SplashRepositoryImp{
  final SplashDatasourceImpl splashDatasourceImpl;

  SplashRepository({required this.splashDatasourceImpl});

  @override
  Future<Either<Failure, void>> load(SplashModel splashModel) async {
    try{
      final results = splashDatasourceImpl.load(splashModel);
      return Right(results);
    }on Failure catch(e){
      return Left(e);
    }
  }

}