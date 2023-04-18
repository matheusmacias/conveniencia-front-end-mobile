import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
abstract class DoorDatasourceImpl{
  Future<Map<String, dynamic>> openDoor(FormDoorModel formDoorModel);

}