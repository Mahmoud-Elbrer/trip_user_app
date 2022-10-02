import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:trip_user_app/config/routes/app_routes.dart';
import 'package:trip_user_app/config/themes/app_theme.dart';
import 'package:trip_user_app/src/utilitis/app_strings.dart';

class TripApp extends StatelessWidget {
  const TripApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}
