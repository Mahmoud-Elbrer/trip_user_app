import 'package:flutter/material.dart';

import '../../src/pages/bottom_navigation_screen.dart';
import '../../src/pages/checkout_out_screen.dart';
import '../../src/pages/detail_group_screen.dart';
import '../../src/pages/detail_trip_screen.dart';
import '../../src/pages/favorite_screen.dart';
import '../../src/pages/group_screen.dart';
import '../../src/pages/home_screen.dart';
import '../../src/pages/login_screen.dart';
import '../../src/pages/ondoraing.dart';
import '../../src/pages/payment.dart';
import '../../src/pages/profile_screen.dart';
import '../../src/pages/select_time_pitch_group_screen.dart';
import '../../src/pages/singup_screen.dart';
import '../../src/pages/splash_screen.dart';
import '../../src/pages/test_trip.dart';
import '../../src/pages/tour_programs.dart';
import '../../src/pages/trips_screen.dart';
import '../../src/utilitis/app_strings.dart';
import '../../src/pages/emirates_trip_screen.dart';
import '../../test_image_slider.dart';

class Routes {
  static const String initialRoute = '/';
  static const String bottomNavigationRoute = '/BottomNavigation';
  static const String onBoardingRoute = '/onBoardingScreen';
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String detailTripRoute = '/detailTripScreen';
  static const String profileRoute = '/ProfileScreen';
  static const String tripsRoute = '/TripsScreen';
  static const String loginRoute = '/LoginScreen';
  static const String signUpRoute = '/SignUpScreen';
  static const String tabBarRoute = '/TabBarDemo';
  static const String checkoutOutRoute = '/CheckoutOutScreen';
  static const String tourProgramsRoute = '/TourProgramsScreen';
  static const String groupRoute = '/GroupScreen';
  static const String detailGroupRoute = '/DetailGroupScreen';
  static const String selectTimePitchGroupRoute = '/SelectTimePitchGroupScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen())); // SplashScreen
       // return MaterialPageRoute(builder: ((context) => const GroupScreen(emirateId: '63335d267384867af876cc52',))); // SplashScreen

      case Routes.bottomNavigationRoute:
        return MaterialPageRoute(
            builder: ((context) => const BottomNavigationScreen()));

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
            builder: ((context) => const OnBoardingScreen()));

      case Routes.homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));

      // case Routes.detailTripRoute:
      //   return MaterialPageRoute(
      //       builder: ((context) => const DetailTripScreen()));

      case Routes.profileRoute:
        return MaterialPageRoute(builder: ((context) => const ProfileScreen()));

      case Routes.tripsRoute:
        return MaterialPageRoute(builder: ((context) =>  const EmiratesTripScreen()));

      case Routes.loginRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: ((context) => const SignUpScreen()));

      case Routes.tabBarRoute:
        return MaterialPageRoute(builder: ((context) => const EmiratesTripScreen()));


      // case Routes.checkoutOutRoute:
      //   return MaterialPageRoute(builder: ((context) => const CheckoutOutScreen()));

      case Routes.tourProgramsRoute:
        return MaterialPageRoute(builder: ((context) => const TourProgramsScreen()));


      case Routes.groupRoute:
        return MaterialPageRoute(builder: ((context) => const GroupScreen(emirateId: '63335d267384867af876cc52',)));


      case Routes.selectTimePitchGroupRoute:
        return MaterialPageRoute(builder: ((context) => const SelectTimePitchGroupScreen()));



      // case Routes.detailGroupRoute:
      //   return MaterialPageRoute(builder: ((context) => const DetailGroupScreen()));


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
