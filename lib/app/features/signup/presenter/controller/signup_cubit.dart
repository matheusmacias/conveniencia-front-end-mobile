import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/usecases/register_usecase.dart';
import 'package:conveniencia/app/features/signup/presenter/controller/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState>{
  SignupCubit({required this.registerusecase}):super(InitState());
  final RegisterUseCase registerusecase;

  Future<void> register(FormModel formModel) async{
    emit(Loading());
    final results = await registerusecase(formModel);
    emit(results.fold((error) => ErrorSignup(error), (r) => Sucessfull(r)));
  }

}