import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/datasource/isignup_datasource.dart';
import 'package:conveniencia/app/features/signup/domain/repositories/isignup_repository.dart';
import 'package:dartz/dartz.dart';

class SignupRepository implements SignupRepositoryImp{
  final SignupDatasourceImpl datasource;

  SignupRepository({required this.datasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(FormModel formmodel) async {
    try{
      final results = await datasource.register(formmodel);
      return Right(results);
    } on Failure catch(e){
      return Left(e);
    }
  }

}