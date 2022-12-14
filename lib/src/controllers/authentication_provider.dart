import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utilitis/URL.dart';
import '../models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utilitis/constance.dart';

class AuthenticationProvider extends ChangeNotifier {

  Future<Map<String, dynamic>?> login(var loginJsonModel) async {
    String url = Url.login;
    print("this is url" );
    print(url );
    try {
      print("this is loginJsonModel");
      print(loginJsonModel);

      final response =
          await http.post( Uri.parse(url) , body: {
            "email": 'hoat@gmail.com', // loginJsonModel['email']
            "password": '1234567',
          });


      print('this is response : ');
      print(response.statusCode);
      print(response.body);

      switch (response.statusCode) {
        case 200:
        case 400:
          print("Inside switch ");
          var mJson = jsonDecode(response.body);
          bool? status = mJson['success'];
          if (status == true) {
            String token = mJson['token'];
            String name = mJson['name'];
            String email = mJson['email'];
            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString(Constance.token, token);
            preferences.setString(Constance.name, name);
            preferences.setString(Constance.email, email);
            return json.decode(response.body);
          } else {
            print("Inside switch2 ");
            return json.decode(response.body);
          }
      }

    } catch (error) {
      print("this is error");
      print(error);
      rethrow;
    }
  }


  Future<Map<String, dynamic>?> signUp(jsonLBodyRegister) async {
    try {
      const url = Url.register;
      print(url);
      final response =
          await http.post(Uri.parse(url) , body: {
            "name": "Mahmoud",
            "email": "a11123@gmail.com",
            "password": "1234567"
          });

      print(response.statusCode);
      print(response.body);

      switch (response.statusCode) {
        case 200:
          var data = jsonDecode(response.body);
          bool? status = data['success'];
          if (status == true) {
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



  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final FirebaseAuth _auth = FirebaseAuth.instance;

   googleSigInMethode() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // now well sign in firebase
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;
    final authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    //  UserCredential userCredential =
    await _auth.signInWithCredential(authCredential).then((value) {
      print("this is value ");
      print(value);


      // todo : save data to api backend
      //saveUser(value);
    });
  }

}