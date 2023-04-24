import 'package:conveniencia/app/features/signup/presenter/controller/signup_state.dart';
import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:conveniencia/app/features/splash/domain/usecases/splash_usecase.dart';
import 'package:conveniencia/app/features/splash/presenter/controller/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.splashUseCase}) : super(SplashInitial());
  final SplashUseCase splashUseCase;

  Future<void> load(SplashModel splashModel) async{
    emit(SplashLoading());
    final results = await splashUseCase(splashModel);
    results.fold((_) => emit(SplashLoggingOut()), (_) => emit(SplashLoggingIn()));

  }
}
