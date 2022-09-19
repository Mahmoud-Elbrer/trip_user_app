import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../src/pages/home_screen.dart';
import '../../src/pages/ondoraing.dart';
import '../../src/pages/splash_screen.dart';
import '../../test.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboardingScreen';
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: ((context) => const TestMyApp()));

      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: ((context) => const OnboardingScreen()));

      case Routes.homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));

      default:
        return underlineRoute();
    }
  }

  static Route<dynamic> underlineRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(child: Text(AppStrings.noRouteFound)),
            )));
  }
}
