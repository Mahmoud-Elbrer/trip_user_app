import 'package:flutter/material.dart';

import '../../src/pages/bottom_navigation_screen.dart';
import '../../src/pages/checkout_out_screen.dart';
import '../../src/pages/detail_trip_screen.dart';
import '../../src/pages/home_screen.dart';
import '../../src/pages/login_screen.dart';
import '../../src/pages/ondoraing.dart';
import '../../src/pages/profile_screen.dart';
import '../../src/pages/singup_screen.dart';
import '../../src/pages/splash_screen.dart';
import '../../src/pages/trips_screen.dart';
import '../../src/utilitis/app_strings.dart';
import '../../test.dart';

class Routes {
  static const String initialRoute = '/';
  static const String bottomNavigationRoute = '/BottomNavigation';
  static const String onboardingRoute = '/onboardingScreen';
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String detailTripRoute = '/detailTripScreen';
  static const String profileRoute = '/ProfileScreen';
  static const String tripsRoute = '/TripsScreen';
  static const String loginRoute = '/LoginScreen';
  static const String signUpRoute = '/SignUpScreen';
  static const String tabBarRoute = '/TabBarDemo';
  static const String checkoutOutRoute = '/CheckoutOutScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen())); // SplashScreen

      case Routes.bottomNavigationRoute:
        return MaterialPageRoute(
            builder: ((context) => const BottomNavigationScreen()));

      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: ((context) => const OnboardingScreen()));

      case Routes.homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));

      case Routes.detailTripRoute:
        return MaterialPageRoute(
            builder: ((context) => const DetailTripScreen()));

      case Routes.profileRoute:
        return MaterialPageRoute(builder: ((context) => const ProfileScreen()));

      case Routes.tripsRoute:
        return MaterialPageRoute(builder: ((context) => const TripsScreen()));

      case Routes.loginRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: ((context) => const SignUpScreen()));

      case Routes.tabBarRoute:
        return MaterialPageRoute(builder: ((context) => const TabBarDemo()));


      case Routes.checkoutOutRoute:
        return MaterialPageRoute(builder: ((context) => const CheckoutOutScreen()));



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
