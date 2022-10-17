import 'package:flutter/material.dart';

class FavoriteModel with ChangeNotifier {
  String? sId;
  User? user;
  Trip? trip;
  int? iV;

  FavoriteModel({this.sId, this.user, this.trip, this.iV});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.trip != null) {
      data['trip'] = this.trip!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  int? iV;

  User({this.sId, this.name, this.email, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['__v'] = this.iV;
    return data;
  }
}

class Trip {
  String? sId;
  String? emirate;
  String? company;
  String? tripTitle;
  String? tripTitleEn;
  String? tripDescription;
  String? tripDescriptionEn;
  String? cost;
  String? tripDuration;
  String? tripDurationEn;
  List<Images>? images;
  bool? isWorkHours;
  String? workHoursForm;
  String? workHoursTo;
  String? additionalNotes;
  String? additionalNotesEn;
  String? tripLocation;
  String? tripLocationEn;
  String? longitude;
  String? latitude;
  int? iV;
  String? tourismProgram;

  Trip(
      {this.sId,
      this.emirate,
      this.company,
      this.tripTitle,
      this.tripTitleEn,
      this.tripDescription,
      this.tripDescriptionEn,
      this.cost,
      this.tripDuration,
      this.tripDurationEn,
      this.images,
      this.isWorkHours,
      this.workHoursForm,
      this.workHoursTo,
      this.additionalNotes,
      this.additionalNotesEn,
      this.tripLocation,
      this.tripLocationEn,
      this.longitude,
      this.latitude,
      this.iV,
      this.tourismProgram});

  Trip.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    emirate = json['emirate'];
    company = json['company'];
    tripTitle = json['tripTitle'];
    tripTitleEn = json['tripTitleEn'];
    tripDescription = json['tripDescription'];
    tripDescriptionEn = json['tripDescriptionEn'];
    cost = json['cost'];
    tripDuration = json['tripDuration'];
    tripDurationEn = json['tripDurationEn'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isWorkHours = json['isWorkHours'];
    workHoursForm = json['workHoursForm'];
    workHoursTo = json['workHoursTo'];
    additionalNotes = json['additionalNotes'];
    additionalNotesEn = json['additionalNotesEn'];
    tripLocation = json['tripLocation'];
    tripLocationEn = json['tripLocationEn'];
    longitude = json['longitude'];
    latitude = json['Latitude'];
    iV = json['__v'];
    tourismProgram = json['tourismProgram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['emirate'] = this.emirate;
    data['company'] = this.company;
    data['tripTitle'] = this.tripTitle;
    data['tripTitleEn'] = this.tripTitleEn;
    data['tripDescription'] = this.tripDescription;
    data['tripDescriptionEn'] = this.tripDescriptionEn;
    data['cost'] = this.cost;
    data['tripDuration'] = this.tripDuration;
    data['tripDurationEn'] = this.tripDurationEn;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['isWorkHours'] = this.isWorkHours;
    data['workHoursForm'] = this.workHoursForm;
    data['workHoursTo'] = this.workHoursTo;
    data['additionalNotes'] = this.additionalNotes;
    data['additionalNotesEn'] = this.additionalNotesEn;
    data['tripLocation'] = this.tripLocation;
    data['tripLocationEn'] = this.tripLocationEn;
    data['longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['__v'] = this.iV;
    data['tourismProgram'] = this.tourismProgram;
    return data;
  }
}

class Images {
  String? sId;
  String? imageUrl;

  Images({this.sId, this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
