import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../utilitis/URL.dart';
import 'package:http/http.dart' as http;


class TripProvider with ChangeNotifier {
  final List<TripModel> _item = [];


  List<TripModel> get items {
    return [..._item];
  }

  Future<void> fetchTrip ( {int? take , int? skip} ) async {
    String url = Url.trip;
    print(url);
    try {
      //final response = await http.get ("$url/$take/$skip" as Uri ).catchError ((onError ) {});
      var url = Uri.parse('http://192.168.137.1:3000/api/trip/1/4');
      final response = await http.get (url ).catchError ((onError ) {});
      print("response");
      print(response);

      if (response.statusCode == 200) {
        var body = jsonDecode (response.body);
        TripModel fb;
        body.forEach (( e ) {
          fb = TripModel.fromJson (e);
          _item.add (fb);
          notifyListeners ();
        });
      }
    } catch (error) {
      throw error;
    }
  }

}