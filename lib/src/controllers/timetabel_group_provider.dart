import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/timetable_group_view_model.dart';
import '../utilitis/URL.dart';
import 'package:http/http.dart' as http;

class TimetableGroupProvider with ChangeNotifier {
  late TimetableGroupViewModel data;

  Future<void> fetchTimetableGroupProvider({required String groupId}) async {
    String url = Url.timeTableGroup+"/"+"635447466e0e6dfa80c813ca";
    print(url);
    try {
      //final response = await http.get ("$url/$take/$skip" as Uri ).catchError ((onError ) {});
      final response = await http.get(Uri.parse(url)).catchError((onError) {});
      print("responsess");
      print(response.body);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        data = TimetableGroupViewModel.fromJson(body);
        notifyListeners();
        print("datadata");
        print(data);
      }
    } catch (error) {
      throw error;
    }
  }
}
