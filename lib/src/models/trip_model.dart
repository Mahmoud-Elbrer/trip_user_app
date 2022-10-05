import 'package:flutter/material.dart';

class TripModel with ChangeNotifier {
  String? sId;
  Emirate? emirate;
  Company? company;
  String? tourismProgram;
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

  TripModel(
      {this.sId,
      this.emirate,
      this.company,
      this.tourismProgram,
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
      this.iV});

  TripModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    emirate =
        json['emirate'] != null ? new Emirate.fromJson(json['emirate']) : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    tourismProgram = json['tourismProgram'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.emirate != null) {
      data['emirate'] = this.emirate!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['tourismProgram'] = this.tourismProgram;
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
    return data;
  }
}

class Emirate {
  String? name;
  String? nameEn;
  int? iV;

  Emirate({this.name, this.nameEn, this.iV});

  Emirate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['nameEn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['__v'] = this.iV;
    return data;
  }
}

class Company {
  String? sId;
  String? name;
  String? email;
  String? phone;
  int? iV;
  bool? isAvailable;

  Company(
      {this.sId, this.name, this.email, this.phone, this.iV, this.isAvailable});

  Company.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    iV = json['__v'];
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['__v'] = this.iV;
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

class Images {
  String? imageUrl;
  String? sId;

  Images({this.imageUrl, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    return data;
  }
}
