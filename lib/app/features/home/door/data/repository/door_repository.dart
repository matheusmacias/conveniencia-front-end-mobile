import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/datasource/idoor_datasource.dart';
import 'package:conveniencia/app/features/home/door/domain/entities/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/repositories/idoor_repository.dart';
import 'package:dartz/dartz.dart';

class DoorRepository implements DoorRepositoryImp{
  final DoorDatasourceImpl datasource;

  DoorRepository({required this.datasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> openDoor(FormDoorModel formDoorModel) async{
    try{
      final results = await datasource.openDoor(formDoorModel);
      return Right(results);
    }on Failure catch(e){
      return Left(e);
    }
  }
}
