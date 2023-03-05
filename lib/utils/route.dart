// ignore_for_file: avoid_print

import 'package:demo_flutter/view/lead/lead.dart';
import 'package:demo_flutter/view/profile/profile.dart';
import 'package:demo_flutter/view/setup/login.dart';
import 'package:demo_flutter/view/setup/splash.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/view/home/home.dart';
import 'package:demo_flutter/view/setup/register.dart';

///This class contains all routing pages information - Routing manage by GetX Routing.
class RouteConst {
  //Page Route String
  static const String kSplashScreen = '/';
  static const String kRegister = '/register';
  static const String kLogin = '/login';
  static const String kHomeScreen = '/homeScreen';
  static const String kProfileScreen = '/profileScreen';
  static const String kLeadScreen = '/leadScreen';

  List<GetPage> appRoutes = [
    GetPage(
      name: kSplashScreen,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kLogin,
      page: () => const LoginScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kRegister,
      page: () => const RegisterScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kHomeScreen,
      page: () => const HomeScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kProfileScreen,
      page: () => ProfileScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kLeadScreen,
      page: () => LeadScreen(),
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
