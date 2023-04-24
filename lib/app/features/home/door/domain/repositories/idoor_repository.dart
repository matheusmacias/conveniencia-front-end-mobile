import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/entities/form_door.dart';
import 'package:dartz/dartz.dart';


abstract class DoorRepositoryImp{
  Future<Either<Failure, Map<String, dynamic>>> openDoor(FormDoorModel formDoorModel);
}