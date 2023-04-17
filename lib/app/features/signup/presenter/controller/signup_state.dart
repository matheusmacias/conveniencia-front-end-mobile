import 'package:conveniencia/app/common/error/failure.dart';

abstract class SignupStatus {}

class InitState extends SignupStatus {}

class Loading extends  SignupStatus{}

class Sucessfull extends SignupStatus {}

class ErrorSignup extends SignupStatus {
  final Failure error;

  ErrorSignup(this.error);

}
