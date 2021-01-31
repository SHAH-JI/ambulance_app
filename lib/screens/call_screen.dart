import 'package:ambulance_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CallScreen extends StatefulWidget {
  static String id = "call_screen";
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rescue 1122"),
        backgroundColor: kMainThemeColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 40.0,
                    child: Icon(
                      Icons.add_ic_call_outlined,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Calling...",
                  style: TextStyle(
                    color: kMainThemeColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "01:56",
                  style: TextStyle(
                    color: kMainThemeColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
