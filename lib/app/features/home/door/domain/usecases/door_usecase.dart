import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/repositories/idoor_repository.dart';
import 'package:dartz/dartz.dart';

class DoorUseCase{
  final DoorRepositoryImp doorRepository;

  DoorUseCase({required this.doorRepository});
  Future<Either<Failure, Map<String, dynamic>>> call(FormDoorModel FormDoorModel) async{
    return await doorRepository.openDoor(FormDoorModel);
  }
}