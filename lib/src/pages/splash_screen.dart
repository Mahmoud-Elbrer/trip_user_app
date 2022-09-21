import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trip_user_app/core/utils/app_strings.dart';
import 'package:trip_user_app/src/pages/bottom_navigation_screen.dart';
import 'package:trip_user_app/src/pages/login_screen.dart';
import 'package:trip_user_app/src/pages/singup_screen.dart';

import '../../core/utils/assets_manger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImgAssets.logo),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(AppStrings.appName,
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "PlayfairDisplay",
                      fontStyle: FontStyle.normal,
                      fontSize: 70.0),
                  textAlign: TextAlign.center),
            )
          ],
        )),
      ),
    );
  }
}
