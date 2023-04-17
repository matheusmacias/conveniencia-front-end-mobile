import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';
import 'package:conveniencia/app/features/login/domain/repositories/ilogin_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase{
  final LoginRepositoryImp repository;

  LoginUseCase({required this.repository});
  Future<Either<Failure, Map<String, dynamic>>> call(FormLoginModel formLoginModel) async{
    return await repository.login(formLoginModel);
  }
}