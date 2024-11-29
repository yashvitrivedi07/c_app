import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController companyName = TextEditingController();
  String path = 'lib/utils/assets/icons/add-friend.png';
  DateTime? d;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create contact"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  XFile? file =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    setState(() {
                      path = file.path;
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      path == 'lib/utils/assets/icons/add-friend.png'
                          ? AssetImage(path)
                          : FileImage(File(path)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: TextFormField(
                    controller: firstname,
                    decoration: const InputDecoration(
                        label: Text("First Name"),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: TextFormField(
                    controller: lastname,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Last Name"), border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: TextFormField(
                    controller: number,
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Add contact"),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: TextFormField(
                    controller: email,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        label: Text("E-mail"), border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: TextFormField(
                    controller: companyName,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Company Name"),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ElevatedButton(onPressed: () async{
                    d = await showDatePicker(context: context, firstDate: DateTime(2001), lastDate: DateTime(2030));
                    context.read<HomeProvider>().changeDate(d!);
                  }, child: const Text("Date")),
                   ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          ContactModal modal = ContactModal(
                              fname: firstname.text,
                              lname: lastname.text,
                              cname: companyName.text,
                              contact: number.text,
                              image: path,
                              date: d,
                              mail: email.text);

                          context.read<HomeProvider>().addContact(modal);
                          Navigator.pop(context);
                        },
                        child: const Text("Save")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
