import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String name = 'Robert Martinez'; // patient
  String get providerName => 'Sarah Johnson'; // provider

  bool pushNotifications = true;
  bool emailNotifications = true;
  bool taskReminders = true;

  String get initials => 'SJ';

  void togglePush(bool value) {
    pushNotifications = value;
    notifyListeners();
  }

  void toggleEmail(bool value) {
    emailNotifications = value;
    notifyListeners();
  }

  void toggleReminders(bool value) {
    taskReminders = value;
    notifyListeners();
  }
}
