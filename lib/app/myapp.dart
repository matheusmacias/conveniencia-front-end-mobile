import 'package:conveniencia/app/features/home/presenter/homeScreen.dart';
import 'package:conveniencia/app/features/signup/presenter/signupScreen.dart';
import 'package:conveniencia/app/features/splash/presenter/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:conveniencia/app/features/login/presenter/loginScreen.dart';
import 'package:conveniencia/common/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        routes: {
          Routes.splash: (context) => const SplashScreen(),
          Routes.login: (context) => const LoginScreen(),
          Routes.signup: (context) => const SignupScreen(),
          Routes.home: (content) => const HomeScreen(),
        }
    );
  }
}
