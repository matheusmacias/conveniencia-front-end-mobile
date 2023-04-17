import 'package:bloc/bloc.dart';
import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';
import 'login_state.dart';
import 'package:conveniencia/app/features/login/domain/usecases/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login(FormLoginModel formLoginModel) async{
    emit(LoginLoading());
    final results = await loginUseCase(formLoginModel);
    results.fold((l) => emit(LoginError(l)), (r) => emit(LoginSuccessfull(r)));
  }
}
