import 'package:conveniencia/app/features/home/door/domain/entities/form_door.dart';

class FormDoorModel extends FormDoorEntity{
  FormDoorModel({required super.token});

  factory FormDoorModel.fromJson(Map<String, dynamic> json){
    return FormDoorModel(
      token: json['token'] as String,
    );
  }
}