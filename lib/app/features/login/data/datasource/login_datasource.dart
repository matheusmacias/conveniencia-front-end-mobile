import 'dart:io';
import 'dart:convert';
import 'package:conveniencia/app/common/error/common_errors.dart';
import 'package:conveniencia/app/features/login/data/models/form_login_model.dart';
import 'package:conveniencia/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:http/http.dart' as http;

class LoginDatasource implements LoginDatasourceImpl{
  var url = Uri.parse('http://10.10.80.224:3000/user/login');

  @override
  Future<Map<String, dynamic>> login(FormLoginModel formLoginModel) async{
    try{
      final response = await http.post(url, body: {
        'email': formLoginModel.email,
        'password': formLoginModel.password
      });
      if(response.statusCode != 200){
        Map<String, dynamic> jsonObj = json.decode(response.body);
        throw CommonDesconhecidoError(message: jsonObj["message"]);
      }

      final responseJson = jsonDecode(response.body);
      return responseJson;

    } on HttpException catch(e) {
      print(e);
      throw CommonDesconhecidoError(message: e);
    }
  }
}