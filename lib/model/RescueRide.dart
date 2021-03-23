import 'package:ambulance_app/model/location.dart';

class RescueRide {
  String _userUID;
  String _driverUID;
  String _userContact;
  Location _userLocation;

  RescueRide(String a, String b, String c, Location d) {
    _userUID = a;
    _driverUID = b;
    _userContact = c;
    _userLocation = d;
  }

  void setUserUID(String uid) {
    _userUID = uid;
  }

  void setDriverUID(String uid) {
    _driverUID = uid;
  }

  void setUserContact(String contact) {
    _userContact = contact;
  }

  void setUserLocation(Location loc) {
    _userLocation = loc;
  }

  String getUserUID() {
    return _userUID;
  }

  String getDriverUID() {
    return _driverUID;
  }

  String getUserContact() {
    return _userContact;
  }

  Location getUserLocation() {
    return _userLocation;
  }
}
