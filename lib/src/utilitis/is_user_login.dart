import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../pages/bottom_navigation_screen.dart';
import '../pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/ondoraing.dart';

isUserLogin(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? seenAuth = preferences.getBool("seenAuth");
  bool? seenOnBoarding = preferences.getBool("seenOnBoarding");
  bool? seenOtp = preferences.getBool("seenOtp");

  seenAuth ??= false;
  seenOtp ??= false;
  seenOnBoarding ??= false;

  print("seenAuth");
  print(seenAuth);

  Timer(const Duration(seconds: 3), () {
    if (seenAuth == true) {
      Navigator.pushReplacementNamed(context, BottomNavigationScreen.routeName);
    } else {
      if(seenOnBoarding == true ){
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }else {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }

    }
  });
}