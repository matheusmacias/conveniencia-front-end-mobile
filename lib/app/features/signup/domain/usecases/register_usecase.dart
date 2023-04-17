import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/repositories/isignup_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase{
  final SignupRepositoryImp repository;

  RegisterUseCase({required this.repository});

  Future<Either<Failure, Map<String, dynamic>>> call(FormModel formModel) async{
    return await repository.register(formModel);
  }
}