import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier {
  bool isAndroid = true;

  void changeState() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
