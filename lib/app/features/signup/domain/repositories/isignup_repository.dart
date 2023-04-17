import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepositoryImp{
  Future<Either<Failure, Map<String, dynamic>>> register(FormModel formModel);
}