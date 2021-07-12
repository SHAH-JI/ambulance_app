import 'package:ambulance_app/model/UserValues.dart';
import 'package:ambulance_app/screens/RideCompleted.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:ambulance_app/screens/direction_screen.dart';
import 'package:ambulance_app/screens/driver_main_screen.dart';
import 'package:ambulance_app/screens/forgot_password_screen.dart';
import 'package:ambulance_app/screens/list_screen.dart';
import 'package:ambulance_app/screens/personnal_info_screen.dart';
import 'package:ambulance_app/screens/user_main_screen.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:ambulance_app/screens/signin_screen.dart';
import 'package:ambulance_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loading_screens/main_loading_screen.dart';
import 'model/SharedPrefs.dart';

Future<void> main() async {
  //A function called to initialize
  WidgetsFlutterBinding.ensureInitialized();
  //init function is called in order to initialized the share preference of the app
  await SharedPrefs.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserValues(),
      )
    ],
    child: MyApp(),
  ));
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
        UserMainScreen.id: (context) => UserMainScreen(),
        DriverMainScreen.id: (context) => DriverMainScreen(),
        CallScreen.id: (context) => CallScreen(),
        ListScreen.id: (context) => ListScreen(),
        RideCompleted.id: (context) => RideCompleted(),
        PersonnalInfoScreen.id: (context) => PersonnalInfoScreen(),
        DirectionScreen.id: (context) => DirectionScreen(),
      },
    );
  }
}
