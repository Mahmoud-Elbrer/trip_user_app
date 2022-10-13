import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_user_app/src/utilitis/constance.dart';

Future<void> saveSeenAuth() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(Constance.seenAuth, true);
}