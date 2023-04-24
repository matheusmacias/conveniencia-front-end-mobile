import 'package:conveniencia/app/features/signup/data/models/form_model.dart';

abstract class SignupDatasourceImpl{
  Future<Map<String, dynamic>> register(FormModel formModel);
}