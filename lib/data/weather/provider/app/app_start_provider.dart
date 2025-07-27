import 'package:flutter/material.dart';

class AppStartProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 4));
    // Login Check
    _isLoggedIn = await checkUserLoginStatus();
    notifyListeners();
  }

  Future<bool> checkUserLoginStatus() async {
    return Future.value(false);
  }
}
