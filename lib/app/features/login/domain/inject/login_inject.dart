import 'package:conveniencia/app/features/login/data/repository/login_repository.dart';
import 'package:conveniencia/app/features/login/domain/repositories/ilogin_repository.dart';
import 'package:conveniencia/app/features/login/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

import 'package:conveniencia/app/features/login/data/datasource/login_datasource.dart';
import 'package:conveniencia/app/features/login/presenter/controller/login_cubit.dart';
import '../datasource/ilogin_datasource.dart';

class LoginInjectDependece {
  static void init(GetIt getIt){
    getIt.registerFactory<LoginDatasourceImpl>(
            () => LoginDatasource());
    getIt.registerFactory<LoginRepositoryImp>(
            () => LoginRepository(datasource: getIt()));
    getIt.registerFactory<LoginUseCase>(
            () => LoginUseCase(repository: getIt()));
    getIt.registerFactory<LoginCubit>(
            () => LoginCubit(loginUseCase: getIt()));
  }
}