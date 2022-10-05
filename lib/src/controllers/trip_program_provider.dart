import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../models/trip_program_model.dart';
import '../utilitis/URL.dart';
import 'package:http/http.dart' as http;


class TripProgramProvider with ChangeNotifier {
  final List<TripProgramModel> _item = [];


  List<TripProgramModel> get items {
    return [..._item];
  }

  Future<void> fetchTripProgram  ( {int? take , int? skip} ) async {

    try {
      //final response = await http.get ("$url/$take/$skip" as Uri ).catchError ((onError ) {});
      var url = Uri.parse('http://192.168.137.1:3000/api/tourismProgram');
      final response = await http.get (url ).catchError ((onError ) {});
      print("response");
      print(response);

      if (response.statusCode == 200) {
        var body = jsonDecode (response.body);
        TripProgramModel fb;
        body.forEach (( e ) {
          fb = TripProgramModel.fromJson (e);
          _item.add (fb);
          notifyListeners ();
        });
      }
    } catch (error) {
      throw error;
    }
  }

}