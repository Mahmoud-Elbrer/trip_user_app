import 'package:flutter/material.dart';

class DetailGroupViewModel with ChangeNotifier{
  List<Group>? group;
  List<Assets>? assets;
  List<Pitch>? pitch;

  DetailGroupViewModel({this.group, this.assets, this.pitch});

  DetailGroupViewModel.fromJson(Map<String, dynamic> json) {
    if (json['group'] != null) {
      group = <Group>[];
      json['group'].forEach((v) {
        group!.add(new Group.fromJson(v));
      });
    }
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
    if (json['pitch'] != null) {
      pitch = <Pitch>[];
      json['pitch'].forEach((v) {
        pitch!.add(new Pitch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.group != null) {
      data['group'] = this.group!.map((v) => v.toJson()).toList();
    }
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    if (this.pitch != null) {
      data['pitch'] = this.pitch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Group {
  String? sId;
  Emirate? emirate;
  Company? company;
  Emirate? groupType;
  String? groupTitle;
  String? groupTitleEn;
  String? groupDescription;
  String? groupDescriptionEn;
  List<Images>? images;
  String? workHoursForm;
  String? workHoursTo;
  String? location;
  String? locationEn;
  String? longitude;
  String? latitude;
  int? iV;

  Group(
      {this.sId,
        this.emirate,
        this.company,
        this.groupType,
        this.groupTitle,
        this.groupTitleEn,
        this.groupDescription,
        this.groupDescriptionEn,
        this.images,
        this.workHoursForm,
        this.workHoursTo,
        this.location,
        this.locationEn,
        this.longitude,
        this.latitude,
        this.iV});

  Group.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    emirate =
    json['emirate'] != null ? new Emirate.fromJson(json['emirate']) : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    groupType = json['groupType'] != null
        ? new Emirate.fromJson(json['groupType'])
        : null;
    groupTitle = json['groupTitle'];
    groupTitleEn = json['groupTitleEn'];
    groupDescription = json['groupDescription'];
    groupDescriptionEn = json['groupDescriptionEn'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    workHoursForm = json['workHoursForm'];
    workHoursTo = json['workHoursTo'];
    location = json['location'];
    locationEn = json['locationEn'];
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
    if (this.groupType != null) {
      data['groupType'] = this.groupType!.toJson();
    }
    data['groupTitle'] = this.groupTitle;
    data['groupTitleEn'] = this.groupTitleEn;
    data['groupDescription'] = this.groupDescription;
    data['groupDescriptionEn'] = this.groupDescriptionEn;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['workHoursForm'] = this.workHoursForm;
    data['workHoursTo'] = this.workHoursTo;
    data['location'] = this.location;
    data['locationEn'] = this.locationEn;
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

class Assets {
  String? sId;
  String? groupId;
  AssetsId? assetsId;
  int? iV;

  Assets({this.sId, this.groupId, this.assetsId, this.iV});

  Assets.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    groupId = json['groupId'];
    assetsId = json['assetsId'] != null
        ? new AssetsId.fromJson(json['assetsId'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['groupId'] = this.groupId;
    if (this.assetsId != null) {
      data['assetsId'] = this.assetsId!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class AssetsId {
  String? sId;
  String? name;
  String? nameEn;
  int? iV;

  AssetsId({this.sId, this.name, this.nameEn, this.iV});

  AssetsId.fromJson(Map<String, dynamic> json) {
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

class Pitch {
  String? sId;
  String? groupId;
  PitchId? pitchId;
  int? iV;

  Pitch({this.sId, this.groupId, this.pitchId, this.iV});

  Pitch.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    groupId = json['groupId'];
    pitchId =
    json['pitchId'] != null ? new PitchId.fromJson(json['pitchId']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['groupId'] = this.groupId;
    if (this.pitchId != null) {
      data['pitchId'] = this.pitchId!.toJson();
    }
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
