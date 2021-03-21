import 'package:ambulance_app/components/buttons/login_button.dart';
import 'package:ambulance_app/components/input/login_input.dart';
import 'package:ambulance_app/model/UserValues.dart';
import 'package:ambulance_app/screens/driver_main_screen.dart';
import 'package:ambulance_app/screens/user_main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:ambulance_app/screens/forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showSpinner = false;

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  String email;
  String password;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
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
                  onPressedFunction: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      if (user != null) {
                        Provider.of<UserValues>(context, listen: false)
                            .updateUserUID(user.user.uid);
                        Provider.of<UserValues>(context, listen: false)
                            .updateUserEmail(email);
                        final userRole = await FirebaseFirestore.instance
                            .collection('users')
                            .where('uid', isEqualTo: user.user.uid)
                            .get();
                        for (var value in userRole.docs) {
                          if (value.data()['role'] == 'user') {
                            Navigator.pushNamed(context, UserMainScreen.id);
                          } else {
                            Navigator.pushNamed(context, DriverMainScreen.id);
                          }
                        }
                      }
                      showSpinner = false;
                    } catch (e) {
                      print(e);
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
      ),
    );
  }
}
