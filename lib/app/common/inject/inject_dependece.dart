import 'package:conveniencia/app/features/signup/domain/inject/signup_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependece{
  static void init(){
    final getit = GetIt.instance;
    SignupInjectDependece.init(getit);
  }
}