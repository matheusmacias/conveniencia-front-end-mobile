import 'package:bloc/bloc.dart';
import 'package:conveniencia/app/features/home/door/domain/usecases/door_usecase.dart';
import '../../data/models/form_door.dart';
import 'door_state.dart';


class DoorCubit extends Cubit<DoorState> {
  DoorCubit({required this.doorUseCase}) : super(DoorInitial());
  final DoorUseCase doorUseCase;

  Future<void> openDoor(FormDoorModel formDoorModel) async{
    emit(DoorLoading());
    final results = await doorUseCase(formDoorModel);
    results.fold((l) => emit(DoorError(l)), (r) => emit(DoorSuccessfull(r)));
  }
}
