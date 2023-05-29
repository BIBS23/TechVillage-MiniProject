import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInState extends ChangeNotifier {
  void saveLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    // You can also save other login-related information if needed
  }

  void checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // The user is logged in, navigate to the home screen or the desired screen
    } else {
      // The user is not logged in, navigate to the login screen
    }
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    notifyListeners();
    // You can also clear other login-related information if needed
  }
}
