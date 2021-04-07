import 'dart:async';
import 'dart:typed_data';

import 'package:ambulance_app/components/common_app_bar.dart';
import 'package:ambulance_app/components/custom_list_tile.dart';
import 'package:ambulance_app/constants.dart';
import 'package:ambulance_app/model/Person.dart';
import 'package:ambulance_app/model/UserValues.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:ambulance_app/screens/list_screen.dart';
import 'package:ambulance_app/screens/selection_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:ambulance_app/model/location.dart';
import 'package:location/location.dart';

class UserMainScreen extends StatefulWidget {
  static String id = "user_main_screen";
  @override
  _UserMainScreenState createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  bool showSpinner = false;

  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  CameraPosition initialLocation(Position position) {
    updateMarkerAndCircle(position);
    return CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17.5,
    );
  }

  void updateMarkerAndCircle(Position position) {
    LatLng latlng = LatLng(position.latitude, position.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("user"),
          position: latlng,
          rotation: position.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.9),
          icon: BitmapDescriptor.defaultMarkerWithHue(1.0));
      print(position.accuracy);
      circle = Circle(
          circleId: CircleId("car"),
          radius: position.accuracy,
          zIndex: 1,
          strokeColor: Colors.lightBlueAccent,
          center: latlng,
          fillColor: Colors.lightBlueAccent.withAlpha(80));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Position userPosition = ModalRoute.of(context).settings.arguments;
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: commonAppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 50.0,
                    ),
                    Text(
                      Provider.of<UserValues>(context).getUserName(),
                      style: GoogleFonts.mcLaren(
                          fontSize: 30.0, color: Colors.white),
                    )
                  ],
                ),
                accountEmail: Text(
                  Provider.of<UserValues>(context, listen: false).getEmail(),
                  style: GoogleFonts.mcLaren(fontSize: 17.3),
                ),
                decoration: BoxDecoration(color: kMainThemeColor),
              ),
              CustomListTile(
                  icon: Icons.person, label: "Profile", onTap: () {}),
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
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: initialLocation(userPosition),
                    markers: Set.of((marker != null) ? [marker] : []),
                    circles: Set.of((circle != null) ? [circle] : []),
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                  ),
                ),
                Material(
                  color: kMainThemeColor,
                  child: InkWell(
                    onTap: () async {
                      List<Person> driver = [];
                      setState(() {
                        showSpinner = true;
                      });
                      final user = await FirebaseFirestore.instance
                          .collection('Person')
                          .get();
                      for (var userData in user.docs) {
                        if (userData.data()['isDriver'] == true) {
                          driver.add(Person(
                              userData.data()['uid'],
                              userData.data()['name'],
                              userData.data()['contact'],
                              userData.data()['gender'],
                              gLocation(
                                  userData.data()['last_location'].latitude,
                                  userData.data()['last_location'].longitude),
                              userData.data()['time']));
                        }
                      }
                      Navigator.pushNamed(context, ListScreen.id,
                          arguments: driver);
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Text(
                        "All Drivers",
                        style: GoogleFonts.mcLaren(
                            fontSize: 30.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
