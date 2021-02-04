import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 999;

  increment() {
    value++;
    notifyListeners();
  }

  decrease() {
    value--;
    notifyListeners();
  }
}
