import 'package:ambulance_app/components/custom_list_tile.dart';
import 'package:ambulance_app/constants.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:flutter/material.dart';

class UserMainScreen extends StatefulWidget {
  static String id = "user_main_screen";
  @override
  _UserMainScreenState createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rescue 1122"),
        backgroundColor: kMainThemeColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Zakria Bacha",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "zakriabacha64@gmail.com",
                style: TextStyle(fontSize: 17.3),
              ),
              decoration: BoxDecoration(color: kMainThemeColor),
            ),
            CustomListTile(icon: Icons.person, label: "Profile", onTap: () {}),
            CustomListTile(
                icon: Icons.help_outline_outlined,
                label: "Help & Support",
                onTap: () {}),
            CustomListTile(
                icon: Icons.settings, label: "Settings", onTap: () {}),
            CustomListTile(
                icon: Icons.logout,
                label: "Logout",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainScreen.id, (route) => false);
                }),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage('images/map.jpg'),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.location_on),
                iconSize: 60.0,
                onPressed: () {
                  Navigator.pushNamed(context, CallScreen.id);
                },
                color: kMainThemeColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
