import 'package:flutter/material.dart';
import 'package:maternity_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:maternity_app/presentation/forgot_password/reset_password_view.dart';
import 'package:maternity_app/presentation/login/login_view.dart';
import 'package:maternity_app/presentation/onboarding/onboarding_screen.dart';
import 'package:maternity_app/presentation/register/register_view.dart';
import 'package:maternity_app/presentation/splash/splash_view.dart';


class MyApp extends StatefulWidget {
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: SplashScreen(), // Set SplashScreen as the home
    );
  }
}
