import 'dart:io';

import 'package:conveniencia/app/common/error/common_errors.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/datasource/isignup_datasource.dart';
import 'package:http/http.dart' as http;

// http://127.0.0.1:5000/user/create
class SignupDatasource implements SignupDatasourceImpl {
  var url = Uri.parse('http://192.168.15.9:3000/user/create');

  @override
  Future<void> register(FormModel formmodel) async {
    try{
      await http.post(url, body: {
        'email': formmodel.email,
        'password': formmodel.password
      });
    } on HttpException catch(e){
      print(e);
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
