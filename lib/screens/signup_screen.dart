import 'package:ambulance_app/components/buttons/login_button.dart';
import 'package:ambulance_app/components/input/login_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "sign_up_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmPasswordTextController = TextEditingController();

  String confirmPassword;
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
                "Sign Up",
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
              Container(
                padding: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
                child: InputField(
                  input: TextInputType.text,
                  controller: confirmPasswordTextController,
                  obsecureText: false,
                  hint: "Confirm Password ",
                  onChangedFunction: (newValue) {
                    confirmPassword = newValue;
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              LoginButton(
                icon: Text("Sign Up"),
                onPressedFunction: () {},
                value: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
