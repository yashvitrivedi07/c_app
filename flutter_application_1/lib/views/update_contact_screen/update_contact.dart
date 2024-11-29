import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateContactScreen extends StatefulWidget {
  const UpdateContactScreen({super.key});

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {
  TextEditingController txtfirstname = TextEditingController();
  TextEditingController txtlastname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtcompanyName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContactModal detail =
        ModalRoute.of(context)!.settings.arguments as ContactModal;

    txtcompanyName.text = detail.cname!;
    txtfirstname.text = detail.fname!;
    txtlastname.text = detail.lname!;
    txtnumber.text = detail.contact!;
    txtemail.text = detail.mail!;
    String path = detail.image!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Detail Page", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                (!context.read<HomeProvider>().ishide)
                    ? PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              context.read<HomeProvider>().ishide = true;
                              context.read<HomeProvider>().hideContact(detail);
                            },
                            child: const Text("Hide")))
                    : PopupMenuItem(
                        child: TextButton(
                            onPressed: () {
                              context.read<HomeProvider>().ishide = false;
                              context
                                  .read<HomeProvider>()
                                  .unhideContact(detail);
                            },
                            child: const Text("Unhide"))),
                PopupMenuItem(
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Delete Contact?"),
                                content: const Text(
                                    "This contact will be permanently deleted from your device"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HomeProvider>()
                                            .removeContact();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Delete"))
                                ],
                              );
                            },
                          );
                        },
                        child: const Text("Delete")))
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.only(top: 70, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${detail.fname}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${detail.contact}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.email, color: Colors.blue),
                              onPressed: () {
                                launchUrl(Uri.parse("mailto: ${detail.mail}"));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.call, color: Colors.green),
                              onPressed: () {
                                launchUrl(Uri.parse("tel: ${detail.contact}"));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.message,
                                  color: Colors.purple),
                              onPressed: () {
                                launchUrl(Uri.parse("sms: ${detail.contact}"));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        XFile? file =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (file != null) {
                          setState(() {
                            path = file.path;
                          });
                        } else {
                          path = 'lib/utils/assets/icons/add-friend.png';
                        }

                        detail.image = path;
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            path == 'lib/utils/assets/icons/add-friend.png'
                                ? const AssetImage(
                                    'lib/utils/assets/icons/add-friend.png')
                                : FileImage(File(path)) as ImageProvider,
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text("First Name"),
                subtitle: Text("${detail.fname}"),
              ),
              ListTile(
                title: const Text("Last Name"),
                subtitle: Text("${detail.lname}"),
              ),
              ListTile(
                title: const Text("Contact"),
                subtitle: Text("${detail.contact}"),
              ),
              ListTile(
                title: const Text("E-mail"),
                subtitle: Text("${detail.mail}"),
              ),
              ListTile(
                title: const Text("Company Name"),
                subtitle: Text("${detail.cname}"),
              ),
              ListTile(
                title: const Text("date"),
                subtitle: Text(
                    "${detail.date?.day}/${detail.date?.month}/${detail.date?.year}"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: AlertDialog(
                  title: const Text("Edit Contact"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: txtfirstname,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "First Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: txtlastname,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Last Name"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: txtnumber,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Contact"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: txtemail,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "E-mail"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: txtcompanyName,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Company Name"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    String name = txtfirstname.text;
                                    String lname = txtlastname.text;
                                    String number = txtnumber.text;
                                    String email = txtemail.text;
                                    String company = txtcompanyName.text;

                                    ContactModal modal = ContactModal(
                                      cname: company,
                                      contact: number,
                                      fname: name,
                                      lname: lname,
                                      mail: email,
                                      image: path,
                                    );

                                    if (!context.read<HomeProvider>().ishide) {
                                      context
                                          .read<HomeProvider>()
                                          .updateContact(modal);

                                          Navigator.pop(context);
                                    } else {
                                      context
                                          .read<HomeProvider>()
                                          .updateHiddenContact(modal);
                                          Navigator.pop(context);
                                    }
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
            },
          );
        },
        child: Image.asset('lib/utils/assets/icons/edit.png'),
      ),
    );
  }
}
