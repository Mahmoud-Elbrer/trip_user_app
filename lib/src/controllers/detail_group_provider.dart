import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/detail_group_view_model.dart';
import '../models/favorite_model.dart';
import '../utilitis/URL.dart';
import '../utilitis/constance.dart';
import '../utilitis/header.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class DetailGroupProvider with ChangeNotifier {
  late DetailGroupViewModel data;


  Future<void> fetchDetailGroupProvider({required String groupId}) async {
    String url = "${Url.group}/$groupId";
    try {
      final response = await http.get(Uri.parse(url)).catchError((onError){
        throw onError;
      });
      print("i in fetchAndSetProducts");
      print(response.body);

      if(response.statusCode ==  200 ){
        var body  =  jsonDecode(response.body) ;
        data = DetailGroupViewModel.fromJson(body);
        notifyListeners();
      }
     // notifyListeners();
    } catch (error) {
      ////print("er er");
      ////print(error);
      throw error;
    }
  }

}