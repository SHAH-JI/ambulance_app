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
      appBar: AppBar(
        title: Text("Rescue 1122"),
        centerTitle: true,
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
            child: NewWidget(),
          );
        }),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.phone_forwarded,
                size: 80.0,
                color: kMainThemeColor,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Driver",
                  style: null,
                  textAlign: TextAlign.left,
                  maxLines: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
