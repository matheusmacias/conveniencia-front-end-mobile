import 'package:conveniencia/app/common/error/failure.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/repositories/isignup_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase{
  final SignupRepositoryImp repository;

  RegisterUsecase({required this.repository});

  Future<Either<Failure, void>> call(FormModel formmodel) async{
    return await repository.register(formmodel);
  }
}