import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepositoryImp{
  Future<Either<Failure, Map<String, dynamic>>> login(FormLoginModel formLoginModel);
}