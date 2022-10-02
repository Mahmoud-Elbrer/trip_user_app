import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../utilitis/URL.dart';
import '../models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {

  Future<Map<String, dynamic>?> login(var loginJsonModel) async {
    const url = Url.login;
    try {
      final response =
          await http.post(url as Uri, body: loginJsonModel);

      switch (response.statusCode) {
        case 200:
          var mJson = jsonDecode(response.body);
          bool? status = mJson['status'];
          if (status == true) {
            String? message = mJson['description'];
            String token = mJson['token'];
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString("token", token);
            return json.decode(response.body);
          } else {
            return json.decode(response.body);
          }
      }
      final responseData = json.decode(response.body);

      if (responseData["status"] != true) {
        throw const HttpException("Please use another number");
      }
    } catch (error) {
      throw error;
    }
  }


  Future<Map<String, dynamic>?> signUp(jsonLBodyRegister) async {
    try {
      const url = Url.register;
      final response =
          await http.post(url as Uri, body: jsonLBodyRegister);
      switch (response.statusCode) {
        case 200:
          var data = jsonDecode(response.body);
          int? code = data['code'];
          if (code == 200) {
            return json.decode(response.body);
          } else {
            return json.decode(response.body);
          }
          break;
        default:
          return json.decode(response.body);
      }
    } catch (error) {
      ////print("ee ee");
      ////print(error);
      throw error;
    }
  }

  Future<Map<String, dynamic>?> reSendOtp(var reSendOTPJsonModel) async {
    const url = Url.reSendOTP;

    try {
      final response =
          await http.post(url as Uri, body: reSendOTPJsonModel);
      print("res poss");
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          var mJson = jsonDecode(response.body);
          bool? status = mJson['status'];
          if (status == true) {
            return json.decode(response.body);
          } else {
            return json.decode(response.body);
          }
      }
      final responseData = json.decode(response.body);

      if (responseData["status"] != true) {
        throw const HttpException("Please use another number");
      }
    } catch (error) {
      throw error;
    }

  }

  Future<Map<String, dynamic>?> changePassword(
      String? oldPassword, String? newPassword) async {
    const url = Url.changePassword;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");

    final jsonChangePasswordBody = jsonEncode({
      'userId': '',
      'newPassword': newPassword,
      'oldPassword': oldPassword,
    });


    try {
      final response =
          await http.post(url as Uri,  body: jsonChangePasswordBody);

      switch (response.statusCode) {
        case 200:
          var mJson = jsonDecode(response.body);

          bool? status = mJson['status'];
          if (status == true) {
            String? message = mJson['message'];
            String? token = mJson['token'];

            return json.decode(response.body);
          } else {
            return json.decode(response.body);
          }
      }
      final responseData = json.decode(response.body);

      if (responseData["status"] != true) {
        throw const HttpException("Please use another number");
      }
    } catch (error) {
      throw error;
    }

  }

}