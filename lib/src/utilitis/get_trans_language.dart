import 'package:flutter/material.dart';
import '../../localization/language_constants.dart';

String? getTranslationLanguage(var response) {
  Locale? getMyLocale;

  getLocale().then((locale) {
    getMyLocale = locale;
    print(locale); // ar_SA  // en_US// ar_SA  // en_US
  });

  String? message = '';
  var location;
  try {
    location = response.split('|').toList();
    ////print("my x1");
  } catch (e) {
    ////print("my xxxx");
    message = response;
  }

  try {
    if (getMyLocale.toString() == "en_US") {
      ////print(location[1]);
      message = location[0];
    } else {
      ////print(location[0]);
      message = location[1];
    }
  } catch (e) {
    message = response;
  }

  return message;
}
