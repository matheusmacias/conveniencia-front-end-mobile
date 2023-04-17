import 'package:conveniencia/app/features/signup/data/models/form_model.dart';import 'package:conveniencia/app/features/signup/domain/usecases/register_usecase.dart';
import 'package:conveniencia/app/features/signup/presenter/controller/signup_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStatus>{
  SignupCubit({required this.registerusecase}):super(InitState());
  final RegisterUseCase registerusecase;

  Future<void> register(FormModel formModel) async{
    emit(Loading());
    final results = await registerusecase(formModel);
    emit(results.fold((error) => ErrorSignup(error), (_) => Sucessfull()));
  }

}