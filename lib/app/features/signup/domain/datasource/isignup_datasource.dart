import 'package:conveniencia/app/features/signup/data/models/form_model.dart';

abstract class SignupDatasourceImpl{
  Future<void> register(FormModel formmodel);
}