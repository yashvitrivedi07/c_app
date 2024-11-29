import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  Future<void> savedetail(String email, String password, String fname,
      String contact, String lname) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setStringList('account', [email, password, fname, contact, lname]);
  }

  Future<void> getdetail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.getStringList('account');
  }
}
