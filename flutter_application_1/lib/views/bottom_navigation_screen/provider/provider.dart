import 'package:flutter/material.dart';

class navigationProvider with ChangeNotifier{

  int current_index = 0;
  int navigation = 0;
  

  void change_index(int index)
  {
    current_index = index;
    notifyListeners();
  }

  change_state(int index)
  {
    navigation = index;
    notifyListeners();
  }

}