import 'package:conveniencia/app/features/login/domain/inject/login_inject.dart';
import 'package:conveniencia/app/features/signup/domain/inject/signup_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependece{
  static void init(){
    final getIt = GetIt.instance;
    SignupInjectDependece.init(getIt);
    LoginInjectDependece.init(getIt);
  }
}