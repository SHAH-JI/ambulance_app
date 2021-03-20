import 'package:ambulance_app/screens/call_screen.dart';
import 'package:ambulance_app/screens/forgot_password_screen.dart';
import 'package:ambulance_app/screens/main_view_screen.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:ambulance_app/screens/signin_screen.dart';
import 'package:ambulance_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'loading_screens/main_loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rescue 1122',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: MainLoadingScreen.id,
      routes: {
        MainLoadingScreen.id: (context) => MainLoadingScreen(),
        MainScreen.id: (context) => MainScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        MainViewScreen.id: (context) => MainViewScreen(),
        CallScreen.id: (context) => CallScreen()
      },
    );
  }
}
