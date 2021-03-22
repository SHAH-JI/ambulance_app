import 'dart:io';

import 'package:ambulance_app/components/DriverTile.dart';
import 'package:ambulance_app/components/common_app_bar.dart';
import 'package:ambulance_app/model/Person.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_app/model/location.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ListScreen extends StatefulWidget {
  static String id = "list_screen";
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Person> driver = [];
  void getData() async {
    final user = await FirebaseFirestore.instance.collection('Person').get();
    for (var userData in user.docs) {
      if (userData.data()['isDriver'] == true) {
        driver.add(Person(
            userData.data()['uid'],
            userData.data()['name'],
            userData.data()['contact'],
            userData.data()['gender'],
            Location(userData.data()['last_location'].latitude,
                userData.data()['last_location'].longitude),
            userData.data()['time']));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    sleep(Duration(milliseconds: 800));
    return Scaffold(
      appBar: CommonAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        children: List.generate(driver.length, (index) {
          return Center(
            child: DriverTile(
                icon: Icons.phone_forwarded,
                heading: driver[index].getName(),
                time: driver[index].getTime(),
                onTap: () {
                  Navigator.pushNamed(context, CallScreen.id,
                      arguments: driver[index]);
                }),
          );
        }),
      ),
    );
  }
}
