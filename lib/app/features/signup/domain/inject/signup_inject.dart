import 'package:conveniencia/app/features/signup/data/repository/signup_repository.dart';
import 'package:conveniencia/app/features/signup/domain/repositories/isignup_repository.dart';
import 'package:conveniencia/app/features/signup/domain/usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';

import 'package:conveniencia/app/features/signup/data/datasource/signup_datasource.dart';
import 'package:conveniencia/app/features/signup/presenter/controller/signup_cubit.dart';
import '../datasource/isignup_datasource.dart';

class SignupInjectDependence {
  static void init(GetIt getIt) {
    getIt.registerFactory<SignupDatasourceImpl>(
        () => SignupDatasource());
    getIt.registerFactory<SignupRepositoryImp>(
        () => SignupRepository(datasource: getIt()));
    getIt.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(repository: getIt()));
    getIt.registerFactory<SignupCubit>(
        () => SignupCubit(registerusecase: getIt()));
  }
}
