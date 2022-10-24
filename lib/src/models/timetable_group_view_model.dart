import 'package:flutter/material.dart';

class TimetableGroupViewModel with ChangeNotifier{
  List<TimeTableGroup>? timeTableGroup;

  TimetableGroupViewModel({this.timeTableGroup});

  TimetableGroupViewModel.fromJson(Map<String, dynamic> json) {
    if (json['timeTableGroup'] != null) {
      timeTableGroup = <TimeTableGroup>[];
      json['timeTableGroup'].forEach((v) {
        timeTableGroup!.add(new TimeTableGroup.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timeTableGroup != null) {
      data['timeTableGroup'] =
          this.timeTableGroup!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeTableGroup {
  String? sId;
  GroupId? groupId;
  PitchId? pitchId;
  String? timeForm;
  String? timeTo;
  int? iV;

  TimeTableGroup(
      {this.sId,
        this.groupId,
        this.pitchId,
        this.timeForm,
        this.timeTo,
        this.iV});

  TimeTableGroup.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    groupId =
    json['groupId'] != null ? new GroupId.fromJson(json['groupId']) : null;
    pitchId =
    json['pitchId'] != null ? new PitchId.fromJson(json['pitchId']) : null;
    timeForm = json['timeForm'];
    timeTo = json['timeTo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.groupId != null) {
      data['groupId'] = this.groupId!.toJson();
    }
    if (this.pitchId != null) {
      data['pitchId'] = this.pitchId!.toJson();
    }
    data['timeForm'] = this.timeForm;
    data['timeTo'] = this.timeTo;
    data['__v'] = this.iV;
    return data;
  }
}

class GroupId {
  String? sId;
  String? name;
  String? nameEn;
  int? iV;

  GroupId({this.sId, this.name, this.nameEn, this.iV});

  GroupId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameEn = json['nameEn'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['__v'] = this.iV;
    return data;
  }
}

class PitchId {
  String? sId;
  String? name;
  String? nameEn;
  String? length;
  String? width;
  int? iV;
  int? price;

  PitchId(
      {this.sId,
        this.name,
        this.nameEn,
        this.length,
        this.width,
        this.iV,
        this.price});

  PitchId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameEn = json['nameEn'];
    length = json['length'];
    width = json['width'];
    iV = json['__v'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['length'] = this.length;
    data['width'] = this.width;
    data['__v'] = this.iV;
    data['price'] = this.price;
    return data;
  }
}

