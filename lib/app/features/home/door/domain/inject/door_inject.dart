import 'package:conveniencia/app/features/home/door/data/repository/door_repository.dart';
import 'package:conveniencia/app/features/home/door/domain/repositories/idoor_repository.dart';
import 'package:conveniencia/app/features/home/door/domain/usecases/door_usecase.dart';
import 'package:conveniencia/app/features/home/door/presenter/controller/door_cubit.dart';
import 'package:conveniencia/app/features/home/door/presenter/qrCodeScreen.dart';
import 'package:get_it/get_it.dart';

import 'package:conveniencia/app/features/home/door/data/datasource/door_datasource.dart';
import '../datasource/idoor_datasource.dart';

class DoorInjectDepence {
  static void init(GetIt getIt){
    getIt.registerFactory<DoorDatasourceImpl>(
        ()=> DoorDatasource()
    );
    getIt.registerFactory<DoorRepositoryImp>(
        () => DoorRepository(datasource: getIt())
    );
    getIt.registerFactory<DoorUseCase>(
        () => DoorUseCase(doorRepository: getIt())
    );
    getIt.registerFactory<DoorCubit>(
        () => DoorCubit(doorUseCase: getIt())
    );
  }
}