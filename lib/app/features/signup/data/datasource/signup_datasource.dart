import 'dart:io';
import 'dart:convert';
import 'package:conveniencia/app/common/error/common_errors.dart';
import 'package:conveniencia/app/features/signup/data/models/form_model.dart';
import 'package:conveniencia/app/features/signup/domain/datasource/isignup_datasource.dart';
import 'package:http/http.dart' as http;

// http://127.0.0.1:5000/user/create
class SignupDatasource implements SignupDatasourceImpl {
  var url = Uri.parse('http://10.10.80.224:3000/user/create');

  @override
  Future<Map<String, dynamic>> register(FormModel formModel) async {
    try {
      final response = await http.post(url, body: {
        'email': formModel.email,
        'password': formModel.password
      });

      if(response.statusCode != 200){
        Map<String, dynamic> jsonObj = json.decode(response.body);
        print(jsonObj);
        throw CommonDesconhecidoError(message: jsonObj["message"]);
      }

      final responseJson = jsonDecode(response.body);
      return responseJson;

    } on HttpException catch(e) {
      print(e);
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}

