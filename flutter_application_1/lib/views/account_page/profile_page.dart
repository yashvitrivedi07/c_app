import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/views/account_page/account_provider/provider.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  @override
  Widget build(BuildContext context) {
    final modal = ModalRoute.of(context)?.settings.arguments as AccountModal?;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Page"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("First Name: ${modal?.firstName}"),
            ),
            ListTile(
              title: Text("Last Name: ${modal?.lastName}"),
            ),
            ListTile(
              title: Text("Email: ${modal?.email}"),
            ),
            ListTile(
              title: Text("Contact: ${modal?.number}"),
            ),
          ],
        ),
      );
    }
  }

