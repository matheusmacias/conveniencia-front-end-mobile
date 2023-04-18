import 'dart:io';
import 'dart:convert';
import 'package:conveniencia/app/common/error/common_errors.dart';
import 'package:conveniencia/app/features/home/door/data/models/form_door.dart';
import 'package:conveniencia/app/features/home/door/domain/datasource/idoor_datasource.dart';
import 'package:http/http.dart' as http;

class DoorDatasource implements DoorDatasourceImpl{
  var url = Uri.parse('http://10.15.26.119:3000/door');

  @override
  Future<Map<String, dynamic>> openDoor(FormDoorModel formDoorModel) async {
    try{
      final response = await http.post(url, body:{
        'token': formDoorModel.token
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