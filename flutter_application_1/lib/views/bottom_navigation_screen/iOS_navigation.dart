import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/views/add_contact_page.dart/iOS_add_contact_page.dart';
import 'package:flutter_application_1/views/home_page/iOS_home_page.dart';

class IosNavigation extends StatefulWidget {
  const IosNavigation({super.key});

  @override
  State<IosNavigation> createState() => _IosNavigationState();
}

class _IosNavigationState extends State<IosNavigation> {
  @override
  Widget build(BuildContext context) {
    List screens = [IosHomePage() , IosAddContactPage()];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
      ]),
      tabBuilder: (context, index) {
        return screens[index];
      },
    );
  }
}
