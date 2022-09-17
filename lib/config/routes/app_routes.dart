import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../src/pages/ondoraing.dart';
import '../../src/pages/splash_screen.dart';


class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboardingScreen';
  static const String splashRoute = '/splash';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));

      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: ((context) => const OnboardingScreen()));

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
