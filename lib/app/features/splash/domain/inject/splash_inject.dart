import 'package:conveniencia/app/features/splash/data/datasource/splash_datasource.dart';
import 'package:conveniencia/app/features/splash/data/repository/splash_repository.dart';
import 'package:conveniencia/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:conveniencia/app/features/splash/domain/repositories/isplash_repository.dart';
import 'package:conveniencia/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:conveniencia/app/features/splash/presenter/controller/splash_cubit.dart';
import 'package:get_it/get_it.dart';

class SplashInjectDependence {
  static void init(GetIt getIt) {
    getIt.registerFactory<SplashDatasourceImpl>(() => SplashDataSource());
    getIt.registerFactory<SplashRepositoryImp>(
        () => SplashRepository(splashDatasourceImpl: getIt()));
    getIt.registerFactory<SplashUseCase>(
        () => SplashUseCase(splashRepositoryImp: getIt()));
    getIt.registerFactory<SplashCubit>(
        () => SplashCubit(splashUseCase: getIt()));
  }
}
