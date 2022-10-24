import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/group_view_model.dart';
import '../utilitis/URL.dart';
import 'package:http/http.dart' as http;


class GroupProvider with ChangeNotifier {
  final List<GroupViewModel> _item = [];


  List<GroupViewModel> get items {
    return [..._item];
  }

  Future<void> fetchGroup ( { int? take , int? skip} ) async {
    String url = Url.group;
    print(url);
    try {
      //final response = await http.get ("$url/$take/$skip" as Uri ).catchError ((onError ) {});
      var url = Uri.parse('http://192.168.137.1:3000/api/group/1/4');
      final response = await http.get (url ).catchError ((onError ) {});
      print("response");
      print(response);

      if (response.statusCode == 200) {
        var body = jsonDecode (response.body);
        GroupViewModel fb;
        body.forEach (( e ) {
          fb = GroupViewModel.fromJson (e);
          _item.add (fb);
          notifyListeners ();
        });
      }
    } catch (error) {
      throw error;
    }
  }

}