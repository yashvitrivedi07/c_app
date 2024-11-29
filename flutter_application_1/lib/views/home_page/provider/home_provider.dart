import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';

class HomeProvider with ChangeNotifier {
  List<ContactModal> contact = [];
  List<ContactModal> hidecontact = [];
  int currentIndex = 0;
  int currentHideIndex = 0;
  bool isAndroid = true;
  bool ishide = false;
  DateTime date = DateTime.now();

  // Account Modal


  //Contact Modal

  void changeDate(DateTime d1) {
    date = d1;
    notifyListeners();
  }

  void hideContact(ContactModal modal) {
    hidecontact.add(modal);
    contact.removeAt(currentIndex);
    notifyListeners();
  }

  void updateHiddenContact(ContactModal modal) {
    hidecontact[currentHideIndex] = modal;
    notifyListeners();
  }

  void updateContact(ContactModal modal) {
    contact[currentIndex] = modal;
    notifyListeners();
  }

  void unhideContact(ContactModal modal) {
    contact.add(modal);
    hidecontact.removeAt(currentHideIndex);
    notifyListeners();
  }

  void removeContact() {
    contact.removeAt(currentIndex);
    notifyListeners();
  }

  void addContact(ContactModal modal) {
    contact.add(modal);
    notifyListeners();
  }

  void getIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void getHideIndex(int index) {
    currentHideIndex = index;
    notifyListeners();
  }

  void changeState() {
    isAndroid = !isAndroid;
    notifyListeners();
  }
}
