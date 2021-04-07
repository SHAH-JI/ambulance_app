import 'package:ambulance_app/model/location.dart';
import 'package:flutter/material.dart';

class UserValues extends ChangeNotifier {
  String _userUID = "12";
  String _userName = "Abu Bakar";
  String _userEmail = "@gmail.com";
  String _userContact = "0303";
  String _lastDriverUID = "value";
  void updateUserUID(String uid) {
    _userUID = uid;
    notifyListeners();
  }

  void updateUserEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  void updateLastDriverUID(String uid) {
    _lastDriverUID = uid;
    notifyListeners();
  }

  void updateUserContact(String contact) {
    _userContact = contact;
    notifyListeners();
  }

  void updateUserName(String a) {
    _userName = a;
  }

  String getUserName() {
    return _userName;
  }

  String getUserContact() {
    return _userContact;
  }

  String getUserUID() {
    return _userUID;
  }

  String getEmail() {
    return _userEmail;
  }

  String getLastDriverUID() {
    return _lastDriverUID;
  }
}
