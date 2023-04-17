import 'package:conveniencia/app/common/error/failure.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessfull extends LoginState {
  final Map<String, dynamic> map;

  LoginSuccessfull(this.map);
}

class LoginError extends LoginState {
  final Failure error;

  LoginError(this.error);
}