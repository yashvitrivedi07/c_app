import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utils/cprovider/provider.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class IosHomePage extends StatefulWidget {
  const IosHomePage({super.key});

  @override
  State<IosHomePage> createState() => _IosHomePageState();
}

class _IosHomePageState extends State<IosHomePage> {
  @override
  Widget build(BuildContext context) {
    var pr = context.read<HomeProvider>();
    var pw = context.watch<HomeProvider>();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoSwitch(
          value: context.watch<StateProvider>().isAndroid,
          onChanged: (value) {
            context.read<StateProvider>().changeState(); // Triggers toggle
          },
        ),
      ),
      child: Column(
        children: [
          Text("hello"),

          Align(
            alignment: Alignment.bottomRight,
            heightFactor: 2,
            widthFactor: 1,
            child: CupertinoButton(child: Image.asset('lib/utils/assets/icons/phone.png'), onPressed: () {
              
            },),
          )
        ],
      )
    );
  }
}
