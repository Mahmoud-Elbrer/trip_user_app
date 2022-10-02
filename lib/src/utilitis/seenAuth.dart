import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveSeenAuth() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("seenAuth", true);
}