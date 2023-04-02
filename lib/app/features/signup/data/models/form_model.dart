import '../../domain/entities/form_entity.dart';

class FormModel extends FormEntity {
  FormModel({required super.email, required super.password});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> map = {};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
