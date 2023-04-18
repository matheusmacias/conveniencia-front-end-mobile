import 'package:conveniencia/app/common/error/failure.dart';

abstract class DoorState {}

class DoorInitial extends DoorState {}

class DoorLoading extends DoorState {}

class DoorSuccessfull extends DoorState {
  final Map<String, dynamic> map;

  DoorSuccessfull(this.map);
}

class DoorError extends DoorState {
  final Failure error;

  DoorError(this.error);

}