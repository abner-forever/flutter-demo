import 'package:flutter/material.dart';

class Switcher with ChangeNotifier {
  int value = 100;

  increment() {
    value++;
    notifyListeners();
  }
}
