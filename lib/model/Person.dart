import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'location.dart';

class Person {
  String _uid;
  String _name;
  String _contact;
  String _gender;
  Location _lastLocation;
  int _time;

  Person(String uid, String name, String contact, String gender,
      Location location, Timestamp time) {
    _uid = uid;
    _name = name;
    _contact = contact;
    _gender = gender;
    _lastLocation = location;
    _time = returnMinuteDifference(time);
  }

  int returnMinuteDifference(Timestamp time) {
    DateTime newValue = DateTime.now();
    var oldValue = DateTime.parse(time.toDate().toString());
    return newValue.difference(oldValue).inMinutes;
  }

  void setUID(String uid) {
    _uid = uid;
  }

  void setContact(String contact) {
    _contact = contact;
  }

  void setLocation(Location loc) {
    _lastLocation.setLatitude(loc.getLatitude());
    _lastLocation.setLongitude(loc.getLongitude());
  }

  void setName(String name) {
    _name = name;
  }

  void setGender(String gender) {
    _gender = gender;
  }

  void setTime(int time) {
    _time = time;
  }

  String getUID() {
    return _uid;
  }

  Location getLocation() {
    return _lastLocation;
  }

  String getContact() {
    return _contact;
  }

  String getName() {
    return _name;
  }

  String getGender() {
    return _gender;
  }

  int getTime() {
    return _time;
  }
}
