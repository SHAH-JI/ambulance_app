import 'package:ambulance_app/components/buttons/action_button.dart';
import 'package:ambulance_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: kMainThemeColor,
        title: Text(
          "Rescue 1122",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
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
                    ActionButton(
                      textLabel: "Call",
                      iconName: Icons.add_ic_call,
                      func: () => launch("tel://123"),
                    ),
                    ActionButton(
                      textLabel: "Location",
                      iconName: Icons.location_on,
                      func: () async {
                        LocationPermission permission;
                        bool serviceEnabled =
                            await Geolocator.isLocationServiceEnabled();
                        if (!serviceEnabled) {
                          print("Location are disabled.");
                        }
                        permission = await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied) {
                          permission = await Geolocator.requestPermission();
                          if (permission == LocationPermission.deniedForever) {
                            print(
                                'Location permissions are permanently denied, we cannot request permissions.');
                          }

                          if (permission == LocationPermission.denied) {
                            print('Location permissions are denied');
                          }
                        }
                        Position position =
                            await Geolocator.getCurrentPosition();
                        print(position.latitude);
                        print(position.longitude);
                        launch("https://www.google.com/maps/place/" +
                            position.latitude.toString() +
                            "+" +
                            position.longitude.toString());
                      },
                    ),
                    ActionButton(
                      textLabel: "Direction",
                      iconName: Icons.directions_outlined,
                      func: () {},
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
