import 'dart:io';

import 'package:ambulance_app/components/DriverTile.dart';
import 'package:ambulance_app/components/common_app_bar.dart';
import 'package:ambulance_app/model/Person.dart';
import 'package:ambulance_app/model/UserValues.dart';
import 'package:ambulance_app/screens/call_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_app/model/location.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  static String id = "list_screen";
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Person> driver = ModalRoute.of(context).settings.arguments;
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
                  Provider.of<UserValues>(context, listen: false)
                      .updateLastDriverUID(driver[index].getUID());
                  Navigator.pushNamed(context, CallScreen.id,
                      arguments: driver[index]);
                }),
          );
        }),
      ),
    );
  }
}
