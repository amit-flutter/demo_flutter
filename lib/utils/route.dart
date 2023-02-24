import 'package:demo_flutter/view/setup/splash.dart';
import 'package:get/get.dart';
import 'package:demo_flutter/view/home/home.dart';
import 'package:demo_flutter/view/setup/register.dart';

///This class contains all routing pages information - Routing manage by GetX Routing.
class RouteConst {
  //Page Route String
  static const String kSplashScreen = '/';
  static const String kRegister = '/register';
  static const String kHomeScreen = '/home';

  List<GetPage> appRoutes = [
    GetPage(
      name: kSplashScreen,
      page: () => const SplashScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kRegister,
      page: () => const RegisterScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: kHomeScreen,
      page: () => HomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
