import 'package:ambulance_app/components/DriverTile.dart';
import 'package:ambulance_app/components/UserTile.dart';
import 'package:ambulance_app/components/common_app_bar.dart';
import 'package:ambulance_app/components/custom_list_tile.dart';
import 'package:ambulance_app/constants.dart';
import 'package:ambulance_app/model/RescueRide.dart';
import 'package:ambulance_app/model/UserValues.dart';
import 'package:ambulance_app/screens/RideCompleted.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverMainScreen extends StatefulWidget {
  static String id = "driver_main_screen";
  @override
  _DriverMainScreenState createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  @override
  Widget build(BuildContext context) {
    final List<RescueRide> rides = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CommonAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
                size: 50.0,
              ),
              accountEmail: Text(
                Provider.of<UserValues>(context, listen: false).getEmail(),
                style: GoogleFonts.mcLaren(fontSize: 17.3),
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
      body: rides.length != null
          ? ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20.0),
              children: List.generate(rides.length, (index) {
                return Center(
                  child: UserTile(
                      time: "12 minute",
                      loc: rides[index].getUserLocation(),
                      heading: "Request " + (index + 1).toString(),
                      onTap: () {
                        Navigator.pushNamed(context, RideCompleted.id,
                            arguments: rides[index]);
                      }),
                );
              }),
            )
          : Text(
              "No Active Rides",
              style: GoogleFonts.mcLaren(),
            ),
    );
  }
}
