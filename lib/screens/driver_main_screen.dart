import 'package:ambulance_app/components/DriverTile.dart';
import 'package:ambulance_app/components/common_app_bar.dart';
import 'package:ambulance_app/components/custom_list_tile.dart';
import 'package:ambulance_app/constants.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:flutter/material.dart';

class DriverMainScreen extends StatefulWidget {
  static String id = "driver_main_screen";
  @override
  _DriverMainScreenState createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
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
              },
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        children: List.generate(8, (index) {
          return Center(
            child: DriverTile(
                icon: Icons.phone_forwarded, heading: "Driver", onTap: () {}),
          );
        }),
      ),
    );
  }
}
