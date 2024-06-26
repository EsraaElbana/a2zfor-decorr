class Client {
  String? message;
  User? user;

  Client({this.message, this.user});

  Client.fromJson(Map<String, dynamic> json) {
    message = json['messge'];
    user = json['userUpdated'] != null
        ? new User.fromJson(json['userUpdated'])
        : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['messge'] = this.message;
  //   if (this.userUpdated != null) {
  //     data['userUpdated'] = this.userUpdated!.toJson();
  //   }
  //   return data;
  // }
}

class User {
  String? id;
  String? userName;
  String? email;
  String? password;
  String? status;
  bool? isConfirmed;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  User(
      {this.id,
        this.userName,
        this.email,
        this.password,
        this.status,
        this.isConfirmed,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userName = json['userName']??"";
    email = json['email']??"";
    password = json['password'];
    status = json['status'];
    isConfirmed = json['isConfirmed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['userName'] = this.userName;
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['status'] = this.status;
  //   data['isConfirmed'] = this.isConfirmed;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   data['token'] = this.token;
  //   return data;
  // }
}
