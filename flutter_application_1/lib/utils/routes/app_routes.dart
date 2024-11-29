import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/account_page/sign_up.dart';
import 'package:flutter_application_1/views/account_page/profile_page.dart';
import 'package:flutter_application_1/views/account_page/sign_in_page.dart';
import 'package:flutter_application_1/views/add_contact_page.dart/add_contact_page.dart';
import 'package:flutter_application_1/views/add_contact_page.dart/iOS_add_contact_page.dart';
import 'package:flutter_application_1/views/bottom_navigation_screen/iOS_navigation.dart';
import 'package:flutter_application_1/views/bottom_navigation_screen/navigation.dart';
import 'package:flutter_application_1/views/hidden_contact_page/hidden_contact_page.dart';
import 'package:flutter_application_1/views/hidden_contact_page/iOS_hidden_contact_page.dart';
import 'package:flutter_application_1/views/update_contact_screen/iOS_update_contact.dart';
import 'package:flutter_application_1/views/update_contact_screen/update_contact.dart';


class AppRoutes {
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const NavigationScreen(),
    'add_contact': (context) => const AddContactPage(),
    'update_contact': (context) => const UpdateContactScreen(),
    'hidden_contact': (context) => const HiddenContactPage(),
    'account_page': (context) => const AccountPage(),
    'sign_in': (context) => const SignInPage(),
    'profile_page': (context) => const ProfilePage(),
  };
}

class iOSAppROutes{
  final Map<String, WidgetBuilder> iOSroutes = {
    '/': (context) => const IosNavigation(),
    '/add_contact': (context) => const IosAddContactPage(),
    '/update_contact': (context) => const IosUpdateContact(),
    '/hidden_contact': (context) => const IosHiddenContactPage(),
   // '/account_page': (context) => const AccountPage(),
  //  '/sign_in': (context) => const SignInPage(),
  //  '/profile_page': (context) => const ProfilePage(),
  };
}
