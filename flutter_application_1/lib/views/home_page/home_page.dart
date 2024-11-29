import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/cprovider/provider.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var pr = context.read<HomeProvider>();
    var pw = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'hidden_contact');
            },
            icon: const Icon(Icons.private_connectivity),
          ),
          Switch(
            value: context.watch<StateProvider>().isAndroid,
            onChanged: (value) {
              context.read<StateProvider>().changeState();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pw.contact.length,
        itemBuilder: (context, index) {
          final contact = pw.contact[index];

          return ListTile(
            onTap: () {
              pr.getIndex(index);
              Navigator.pushNamed(
                context,
                'update_contact',
                arguments: contact,
              );
            },
            leading: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: contact.image == 'lib/utils/assets/icons/add-friend.png'
                    ? Image.asset(contact.image!)
                    : Image.file(
                        File(contact.image!),
                        fit: BoxFit.cover,
                        width: 55,
                        height: 80,
                      ),
              ),
            ),
            title: Text(contact.fname ?? ''),
            subtitle: Text(contact.contact ?? ''),
            trailing: IconButton(
              onPressed: () {
                launchUrl(Uri.parse("tel:${contact.contact}"));
              },
              icon: const Icon(Icons.call),
              color: Colors.green,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_contact');
        },
        child: Image.asset('lib/utils/assets/icons/phone.png',),
      ),
    );
  }
}
