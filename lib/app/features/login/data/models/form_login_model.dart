import 'package:conveniencia/app/features/login/domain/entities/form_login.dart';

class FormLoginModel extends FormLoginEntity{
  FormLoginModel({required super.email, required super.password});

  factory FormLoginModel.fromJson(Map<String, dynamic> json) {
    return FormLoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> map = {};
    map['email'] = email;
    map['password'] =  password;
    return map;
  }
}