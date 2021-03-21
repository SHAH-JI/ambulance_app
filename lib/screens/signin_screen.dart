import 'package:ambulance_app/components/buttons/login_button.dart';
import 'package:ambulance_app/components/input/login_input.dart';
import 'package:ambulance_app/screens/user_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'package:ambulance_app/screens/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.ambulance,
                size: 50.0,
                color: kMainThemeColor,
              ),
              Text(
                "Rescue 1122",
                style: TextStyle(
                  fontSize: 25.0,
                  color: kMainThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 40.0,
                  color: kMainThemeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
                child: InputField(
                  input: TextInputType.emailAddress,
                  controller: emailTextController,
                  obsecureText: false,
                  hint: "Enter your email ",
                  onChangedFunction: (newValue) {
                    email = newValue;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
                child: InputField(
                  input: TextInputType.text,
                  controller: passwordTextController,
                  obsecureText: true,
                  hint: "Enter your password ",
                  onChangedFunction: (newValue) {
                    password = newValue;
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              LoginButton(
                icon: Text("Sign In"),
                onPressedFunction: () {
                  if (email == "zarik" && password == "1234") {
                    Navigator.pushNamed(context, UserMainScreen.id);
                  }
                },
                value: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: kMainThemeColor),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.id);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
