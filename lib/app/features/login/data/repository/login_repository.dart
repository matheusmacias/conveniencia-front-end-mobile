import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';
import 'package:conveniencia/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:conveniencia/app/features/login/domain/repositories/ilogin_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepository implements LoginRepositoryImp{
  final LoginDatasourceImpl datasource;

  LoginRepository({required this.datasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(FormLoginModel formLoginModel) async {
    try{
      final results = await datasource.login(formLoginModel);
      return Right(results);
    } on Failure catch(e){
      return Left(e);
    }
  }

}