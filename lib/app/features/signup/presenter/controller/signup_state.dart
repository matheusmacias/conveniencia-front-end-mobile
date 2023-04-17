import 'package:conveniencia/app/common/error/failure.dart';

abstract class SignupState {}

class InitState extends SignupState {}

class Loading extends  SignupState {}

class Sucessfull extends SignupState {
  final Map<String, dynamic> map;

  Sucessfull(this.map);
}

class ErrorSignup extends SignupState {
  final Failure error;

  ErrorSignup(this.error);

}
