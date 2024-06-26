import 'package:clint_store/models/product_model_client.dart';

import '../app_manager/local_data.dart';
// class Designer {
//   String? message;
//   List<Engs>? engs;
//
//   Designer({this.message, this.engs});
//
//   Designer.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['Engs'] != null) {
//       engs = <Engs>[];
//       json['Engs'].forEach((v) {
//         engs!.add(new Engs.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.engs != null) {
//       data['Engs'] = this.engs!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Designer {
  String? id;
  String? userName;
  String? email;

  String? phoneNumber;
  List<String>? address;
  String? specialAt;
  String? gender;
  int? age;
  LicencePicture? licencePicture;
  String? password;
  bool? isConfirmed;
  bool? isOnline;
  String? status;

  String? addedBy;

  // List<Null>? gallery;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? deletedBy;

  String? customId;
  String? token;

  Designer(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.isConfirmed,
        this.isOnline,
        this.phoneNumber,
        this.address,
        this.specialAt,
        this.status,
        this.gender,
        this.addedBy,
        this.age,
        // this.gallery,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.deletedBy,
        this.licencePicture,
        this.customId,
        this.token});

  Designer.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userName = json['userName']??"";
    email = json['email']??"";

    phoneNumber = json['phoneNumber']??"";
    address = (json['address'].isEmpty||json['address']==null)?[""].cast<String>():json['address'].cast<String>();
    specialAt = json['spicalAt']??"";

    gender = json['gender']??"";

    age = json['age']??32;


    licencePicture = json['licencePicture'] != null
        ? new LicencePicture.fromJson(json['licencePicture'])
        : LicencePicture(designerImage: "");




    // if (json['Gallery'] != null) {
    //   gallery = <Null>[];
    //   json['Gallery'].forEach((v) {
    //     gallery!.add(new Null.fromJson(v));
    //   });
    // }
    addedBy = json['addedBy'];
    password = json['password'];
    isConfirmed = json['isConfirmed'];
    isOnline = json['isOnline'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    deletedBy = json['deletedBy'];

    customId = json['customId'];
    token = json['token'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.id;
  //   data['userName'] = this.userName;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['isConfirmed'] = this.isConfirmed;
  //   data['isOnline'] = this.isOnline;
  //   data['phoneNumber'] = this.phoneNumber;
  //   data['address'] = this.address;
  //   data['spicalAt'] = this.specialAt;
  //   data['status'] = this.status;
  //   data['gender'] = this.gender;
  //   data['addedBy'] = this.addedBy;
  //   data['age'] = this.age;
  //   if (this.gallery != null) {
  //     data['Gallery'] = this.gallery!.map((v) => v.toJson()).toList();
  //   }
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   data['deletedBy'] = this.deletedBy;
  //   if (this.licencePicture != null) {
  //     data['licencePicture'] = this.licencePicture!.toJson();
  //   }
  //   data['customId'] = this.customId;
  //   data['token'] = this.token;
  //   return data;
  // }
}

class LicencePicture {
  String? designerImage;
  String? publicId;

  LicencePicture({this.designerImage, this.publicId});

  LicencePicture.fromJson(Map<String, dynamic> json) {

    designerImage = (json['secure_url'].toString().trim().isEmpty||json['secure_url']==null)?noImage:json['secure_url'];

    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secure_url'] = this.designerImage;
    data['public_id'] = this.publicId;
    return data;
  }
}
