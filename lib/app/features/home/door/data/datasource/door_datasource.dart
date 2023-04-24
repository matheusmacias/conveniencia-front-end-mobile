import 'dart:io';
import 'dart:convert';
import 'package:conveniencia/app/common/error/common_errors.dart';
import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/datasource/idoor_datasource.dart';
import 'package:conveniencia/app/features/home/door/domain/entities/form_door.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoorDatasource implements DoorDatasourceImpl{
  var url = Uri.parse('${const String.fromEnvironment('URL_SITE')}/door');
  late SharedPreferences _prefs;
  @override
  Future<Map<String, dynamic>> openDoor(FormDoorModel formDoorModel) async {
    try{
      _prefs = await SharedPreferences.getInstance();
      final token = _prefs.getString('token');
      final response = await http.post(url, body:{
        'token': formDoorModel.token
      },
      headers: {
        'Authorization': 'Bearer $token'
      });
      if(response.statusCode != 200){
        Map<String, dynamic> jsonObj = json.decode(response.body);
        throw CommonDesconhecidoError(message: jsonObj['message']);
      }
      final responsejson = jsonDecode(response.body);
      return responsejson;
    }on HttpException catch(e){
      throw CommonDesconhecidoError(message: e);
    }
  }

}