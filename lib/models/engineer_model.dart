class Engineer {
  String? message;
  User? user;

  Engineer({this.message, this.user});

  Engineer.fromJson(Map<String, dynamic> json) {
    message = json['messge'];
    user = json['engineerUpdated'] != null
        ? new User.fromJson(json['engineerUpdated'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['messge'] = this.message;
  //   if (this.engineerUpdated != null) {
  //     data['engineerUpdated'] = this.engineerUpdated!.toJson();
  //   }
  //   return data;
  // }
}

class User {
  LicencePicture? licencePicture;
  String? id;
  String? userName;
  String? email;
  String? password;

  String? phoneNumber;
  List<String>? address;
  String? status;
  // String? gender;
  // int? age;
  // bool? isConfirmed;
  // bool? isOnline;
  // String? customId;
  // List<Null>? gallery;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  User(
      {this.licencePicture,
        this.id,
        this.userName,
        this.email,
        this.password,

        this.phoneNumber,
        this.address,
        this.status,
        // this.gender,
        // this.age,
        // this.customId,
        // this.gallery,
        // this.isConfirmed,
        // this.isOnline,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    licencePicture = json['licencePicture'] != null
        ? new LicencePicture.fromJson(json['licencePicture'])
        : null;
    id = json['_id'];
    userName = json['userName']??"";
    email = json['email']??"";
    password = json['password'];

    phoneNumber = json['phoneNumber']??"";
    address = json['address'].cast<String>()??"";
    status = json['status'];
    // gender = json['gender'];
    // age = json['age'];
    // customId = json['customId'];
    // isConfirmed = json['isConfirmed'];
    // isOnline = json['isOnline'];
    // if (json['Gallery'] != null) {
    //   gallery = <Null>[];
    //   json['Gallery'].forEach((v) {
    //     gallery!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.licencePicture != null) {
  //     data['licencePicture'] = this.licencePicture!.toJson();
  //   }
  //   data['_id'] = this.id;
  //   data['userName'] = this.userName;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['isConfirmed'] = this.isConfirmed;
  //   data['isOnline'] = this.isOnline;
  //   data['phoneNumber'] = this.phoneNumber;
  //   data['address'] = this.address;
  //   data['status'] = this.status;
  //   data['gender'] = this.gender;
  //   data['age'] = this.age;
  //   data['customId'] = this.customId;
  //   if (this.gallery != null) {
  //     data['Gallery'] = this.gallery!.map((v) => v.toJson()).toList();
  //   }
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   data['token'] = this.token;
  //   return data;
  // }
}

class LicencePicture {
  String? secureUrl;
  String? publicId;

  LicencePicture({this.secureUrl, this.publicId});

  LicencePicture.fromJson(Map<String, dynamic> json) {
    secureUrl = json['secure_url'];
    publicId = json['public_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['secure_url'] = this.secureUrl;
  //   data['public_id'] = this.publicId;
  //   return data;
  // }
}
