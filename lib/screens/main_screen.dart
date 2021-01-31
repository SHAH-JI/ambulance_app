import 'package:ambulance_app/constants.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:flutter/material.dart';

class MainViewScreen extends StatefulWidget {
  static String id = "main_view_screen";
  @override
  _MainViewScreenState createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kMainThemeColor,
        title: Text(
          "Rescue 1122",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      child: Icon(
                        Icons.account_circle,
                        size: 70.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ali Khan",
                          style: TextStyle(
                            color: kMainThemeColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "UET Mardan",
                          style: TextStyle(
                            color: kMainThemeColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Click Here for Any Emergency",
                style: TextStyle(color: kMainThemeColor, fontSize: 16.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.add_call,
                                  size: 60.0,
                                  color: kMainThemeColor,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, CallScreen.id);
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 35.0, top: 25.0),
                            child: Text(
                              "Call",
                              style: TextStyle(
                                  color: kMainThemeColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.directions,
                                  size: 60.0,
                                  color: kMainThemeColor,
                                ),
                                onPressed: () {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0, top: 25.0),
                            child: Text(
                              "Direction",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kMainThemeColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Ambulance Available",
                style: TextStyle(color: kMainThemeColor, fontSize: 16.0),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "24",
                      style: TextStyle(
                        color: kMainThemeColor,
                        fontSize: 100.0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            ".",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 80.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Hours",
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
