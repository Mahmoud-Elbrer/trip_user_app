import 'dart:async';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:trip_user_app/src/pages/bottom_navigation_screen.dart';
import 'package:trip_user_app/src/pages/login_screen.dart';
import 'package:trip_user_app/src/pages/singup_screen.dart';

import '../utilitis/app_strings.dart';
import '../utilitis/assets_manger.dart';
import '../utilitis/is_user_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        debugPrint("onMessage:");
        log("onMessage: $message");
        final snackBar =
        SnackBar(content: Text(message.notification?.title ?? ""));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    // TODO: implement initState
    super.initState();
    isUserLogin(context);
    // Timer(const Duration(seconds: 2), () {
    //
    //   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    // });
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
