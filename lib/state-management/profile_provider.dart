import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  // Initial data
  String _name = 'Nasya Dzakiyah';
  String _email = 'nasyadz@example.com';
  String _phone = '+1234567890';
  String _address = 'Jembatan Ancol';

  // Getter untuk data profil
  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get address => _address;

  // Setter untuk memperbarui data profil
  void updateProfile(String name, String email, String phone, String address) {
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    notifyListeners(); // Memberitahu widget untuk memperbarui state
  }
}
