import 'package:conveniencia/app/common/inject/inject_dependece.dart';
import 'package:flutter/material.dart';
import 'package:conveniencia/app/myapp.dart';

void main() {
  InjectDependece.init();
  runApp(const MyApp());
}
