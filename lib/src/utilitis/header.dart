import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Header {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Consumer': '254321889'
  };

  getHeader() {
    return headers;
  }

  getHeaderToken(var token) {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'x-auth-token': '$token'
    };
    return headers;
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    return token;
  }

  Map<String, String> getHttpHeader() {
    var mheader = new Header().getHeaderToken(getToken());
    return mheader;
  }

   headerToken() async {
    Timer.run(() async {
      var  token = await getToken();
      var headersMap; headersMap = {
        'Content-Type': 'application/json',
        'Consumer': '254321889',
        'Authorization': 'Bearer $token'
      };
      return headersMap;
    });

  }
}
