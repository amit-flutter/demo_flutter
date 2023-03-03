import 'dart:async';

import 'package:demo_flutter/utils/constant/colors.dart';
import 'package:demo_flutter/utils/constant/strings.dart';
import 'package:demo_flutter/utils/route.dart';
import 'package:demo_flutter/utils/services/share_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setup();
    super.initState();
  }

  void setup() async {
    bool isLogin = await Preferences.isLogin();

    //After 2 seconds Splash screen remove and new screen will be added.(Control transfer from one to another)
    Timer(const Duration(seconds: 2), () => Get.offAllNamed(isLogin ? RouteConst.kHomeScreen : RouteConst.kRegister));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConst.kHighLight1,
      body: Center(child: Image.asset(StringConst.kLogoImage)),
    );
  }
}
