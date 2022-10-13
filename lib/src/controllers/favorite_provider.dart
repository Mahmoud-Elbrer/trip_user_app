import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../utilitis/URL.dart';
import '../utilitis/header.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ProviderFavorite with ChangeNotifier {
  final List<TripModel> _item = [];


  List<TripModel> get items {
    return [..._item];
  }

  Future<void> fetchFavoriteTrip() async {
    _item.clear();
    SharedPreferences preferences =
    await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    ////print("my token");
    ////print(token);
    Header header = Header();
    var mheader = header.getHeaderToken(token);
    String url = Url.favoriteTrip;
    try {
      final response = await http.get(Uri.parse(url) ,headers: mheader).catchError((onError){
        throw onError;
      });
      ////print("i in fetchAndSetProducts");
      ////print(response.body);

      if(response.statusCode ==  200 ){
        var body  =  jsonDecode(response.body) ;
//        List<FavoriteTripModel> list = [];
        TripModel fb  ;
        body.forEach((e){
           fb  =  TripModel.fromJson(e);
          _item.add(fb);
          notifyListeners();
        });
       // notifyListeners();
        //return _item ;
      }
     // notifyListeners();
    } catch (error) {
      ////print("er er");
      ////print(error);
      throw error;
    }
  }


  Future<Map<String, dynamic>?> addFavoriteTripApi(var tripId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    ////print("my token");
    ////print(token);
    Header header = new Header();
    var mheader = header.getHeaderToken(token);
    String url = Url.favoriteTrip + tripId;
    ////print("my url :::");
    ////print(url);

    //////print(mheader);
    try {
      final _response = await http.post(Uri.parse(url), headers: mheader);
      ////print("res po");
      ////print(_response);
      ////print("this data");
      ////print(_response.body);
      ////print("_response.statusCode");
      ////print(_response.statusCode);
      switch (_response.statusCode) {
        case 200:
          var mJson = jsonDecode(_response.body);
          ////print("ddd ddd d ");

          int? status = mJson['code'];
          if (status == 200) {
            String? message = mJson['description'];

            return json.decode(_response.body);
          } else {
            return json.decode(_response.body);
          }
      }
      final _responseData = json.decode(_response.body);

      if (_responseData["status"] != true) {
        throw HttpException("Please use another number");
      }
    } catch (error) {
      throw error;
    }
  }

  Future<Map<String, dynamic>?> removeFavoriteTripApi(var tripId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    ////print("my token");
    ////print(token);
    Header header = new Header();
    var mheader = header.getHeaderToken(token);
    String url = Url.favoriteTrip + tripId;
    try {
      ////print("url url");
      ////print(url);
      final _response = await http.delete(Uri.parse(url), headers: mheader);
      ////print("_response.statusCode");
      ////print(_response.statusCode);
      ////print("response.body");
      ////print(_response.body);
      switch (_response.statusCode) {
        case 200:
          var data = jsonDecode(_response.body);
          ////print("ddd ddd d ");
          ////print(data);
          int? code = data['code'];
          if (code == 200) {
            String? description = data['description'];

            ////print("this description");
            ////print(description);

            return json.decode(_response.body);
          } else {
            return json.decode(_response.body);
          }
      }

      ////print(_response.body);

      final _responseData = json.decode(_response.body);

      if (_responseData["description"] != null) {
        throw HttpException(
          throw HttpException("Please use another number"),
        );
      }
    } catch (error) {
      ////print("ee ee");
      ////print(error);
      throw error;
    }
  }

  void deleteProduct(String tripId) {
    _item.removeWhere((prod) => prod.sId == tripId);
    notifyListeners();
  }

}