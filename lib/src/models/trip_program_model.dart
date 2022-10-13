import 'package:flutter/material.dart';

class TripProgramModel with ChangeNotifier {
  String? sId;
  String? name;
  String? nameEn;
  String? image;
  String? icon;
  int? iV;

  TripProgramModel(
      {this.sId, this.name, this.nameEn, this.image, this.icon, this.iV});

  TripProgramModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameEn = json['nameEn'];
    image = json['image'];
    icon = json['icon'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['image'] = this.image;
    data['icon'] = this.icon;
    data['__v'] = this.iV;
    return data;
  }
}
