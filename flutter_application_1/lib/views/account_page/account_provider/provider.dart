import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountProvider with ChangeNotifier {
  List<AccountModal> account = [];
  bool accountExists = false;
  bool islistempty = false;

  Future<void> signup(AccountModal modal) async {
    account.add(modal);
    notifyListeners();
  }

  bool doesAccountExist(String email) {
    return account.any((account) => account.email == email);
  }

  void listempty() {
    if (account.isEmpty) {
      islistempty = false;
    } else {
      islistempty = true;
    }
    notifyListeners();
  }
}
