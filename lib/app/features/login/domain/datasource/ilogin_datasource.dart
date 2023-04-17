import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';

abstract class LoginDatasourceImpl{
  Future<Map<String, dynamic>> login(FormLoginModel formLoginModel);
}