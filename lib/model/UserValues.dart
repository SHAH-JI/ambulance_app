import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserValues extends ChangeNotifier {
  String _userUID = "value";
  String _userEmail = "@gmail.com";
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
