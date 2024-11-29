import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/account_page/account_provider/provider.dart';
import 'package:flutter_application_1/views/account_page/profile_page.dart';
import 'package:flutter_application_1/views/account_page/sign_in_page.dart';
import 'package:flutter_application_1/views/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/views/bottom_navigation_screen/provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
 

  @override
  Widget build(BuildContext context) {
    var pw = context.watch<navigationProvider>();
    var pr = context.read<navigationProvider>();

    List<Widget> screens = const [HomePage(), ProfilePage()];

    return Scaffold(
      body: screens[pw.current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pw.current_index,
        onTap: (value) {
          pr.change_index(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
