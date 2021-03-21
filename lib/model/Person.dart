import 'dart:core';
import 'location.dart';

import 'package:flutter/material.dart';

class Person {
  String _uid;
  String _name;
  String _contact;
  String _gender;
  Location _lastLocation;
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
}
