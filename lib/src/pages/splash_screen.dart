import 'package:flutter/material.dart';
import 'package:trip_user_app/core/utils/app_strings.dart';

import '../../core/utils/assets_manger.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
