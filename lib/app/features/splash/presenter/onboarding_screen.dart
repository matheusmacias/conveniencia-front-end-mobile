import 'package:conveniencia/app/features/home/presenter/homeScreen.dart';
import 'package:conveniencia/app/features/login/presenter/loginScreen.dart';
import 'package:conveniencia/app/features/splash/data/models/splash_model.dart';
import 'package:conveniencia/app/features/splash/presenter/controller/splash_cubit.dart';
import 'package:conveniencia/app/features/splash/presenter/controller/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cubit = GetIt.I.get<SplashCubit>();
  late FlutterSecureStorage flutterSecureStorage;

  @override
  void initState() {
    super.initState();
    _loadSplash();
  }

  _loadSplash() async {
    flutterSecureStorage = const FlutterSecureStorage();
    String? token = await flutterSecureStorage.read(key: 'jwt_token');
    cubit.load(SplashModel(token: token!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        bloc: cubit,
        listener: (context, state){
          if(state is SplashLoggingIn){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
          if(state is SplashLoggingOut){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        },
        child: const Center(
          child: Text(
            'SplashScreen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}