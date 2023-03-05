// ignore_for_file: library_private_types_in_public_api

import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Main function is from where project execution will start
void main() async {
  runApp(const MyApp());
}

//MyApp is entry point of the flutter app - Root Widget
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "New Practical Test Project",
        debugShowCheckedModeBanner: false,

        //Application theme is fully controlled by themeData which have define in separate file (class)
        theme: ThemeConst.lightTheme,
        darkTheme: ThemeConst.darkTheme,
        themeMode: _themeMode,
        initialRoute: '/',
        getPages: RouteConst().appRoutes
        // home: const SignUpScreen(),
        );
  }

  //To change theme just pass theme-mode and it will change base theme data
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
