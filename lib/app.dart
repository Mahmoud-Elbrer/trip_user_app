import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trip_user_app/config/routes/app_routes.dart';
import 'package:trip_user_app/config/themes/app_theme.dart';
import 'package:trip_user_app/src/controllers/authentication_provider.dart';
import 'package:trip_user_app/src/controllers/favorite_provider.dart';
import 'package:trip_user_app/src/controllers/trip_program_provider.dart';
import 'package:trip_user_app/src/controllers/trip_provider.dart';
import 'package:trip_user_app/src/utilitis/app_strings.dart';

class TripApp extends StatelessWidget {
  const TripApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TripProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TripProgramProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderFavorite(),
        ),

      ] ,
      child: RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => const MaterialClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}