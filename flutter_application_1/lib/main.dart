import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/cprovider/provider.dart';
import 'package:flutter_application_1/utils/routes/app_routes.dart';
import 'package:flutter_application_1/views/account_page/account_provider/provider.dart';
import 'package:flutter_application_1/views/bottom_navigation_screen/provider/provider.dart';
import 'package:flutter_application_1/views/home_page/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => navigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AccountProvider()),
        ChangeNotifierProvider(
          create: (context) => StateProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

        final isAndroid = Provider.of<StateProvider>(context).isAndroid;

    return isAndroid ? MaterialApp(
        theme: ThemeData(
            elevatedButtonTheme: const ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber))),
            inputDecorationTheme: const InputDecorationTheme(),
            colorSchemeSeed: Colors.white,
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(shape: CircleBorder())),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: AppRoutes().routes): CupertinoApp(

          debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: iOSAppROutes().iOSroutes,
        );
  }
}
