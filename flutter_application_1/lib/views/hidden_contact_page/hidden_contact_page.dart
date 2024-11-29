import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HiddenContactPage extends StatefulWidget {
  const HiddenContactPage({super.key});

  @override
  State<HiddenContactPage> createState() => _HiddenContactPageState();
}

class _HiddenContactPageState extends State<HiddenContactPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().hidecontact.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                context.read<HomeProvider>().currentHideIndex;
                Navigator.pushNamed(context, 'update_contact',arguments: context.read<HomeProvider>().hidecontact[index]);
              },
              leading: CircleAvatar(
                radius: 40,
                child: context.watch<HomeProvider>().hidecontact[index].image == 'lib/utils/assets/icons/add-friend.png'
                ?  ClipOval(child: Image.asset('${context.watch<HomeProvider>().hidecontact[index].image}'))
                :ClipOval(
                  child: Image.file(
                    File(context.watch<HomeProvider>().hidecontact[index].image!),
                    fit: BoxFit.cover,
                    width: 55,
                    height: 80,
                  ),
                ),
              ),
              title: Text("${context.watch<HomeProvider>().hidecontact[index].fname}"),
              subtitle: Text("${context.watch<HomeProvider>().hidecontact[index].contact}"),
              trailing: IconButton(onPressed: () {
              launchUrl(Uri.parse("tel: ${context.watch<HomeProvider>().hidecontact[index].contact}"));
              }, icon: const Icon(Icons.call),color: Colors.green,)
            );
          },
        ),
      ),
    );
  }
}