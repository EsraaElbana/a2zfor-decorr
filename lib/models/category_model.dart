
//home_client_category_model.

// class Category {
//   String? message;
//   List<Categories>? categories;
//
//   Category({this.message, this.categories});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['Categories'] != null) {
//       categories = <Categories>[];
//       json['Categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['message'] = this.message;
//   //   if (this.categories != null) {
//   //     data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }

class Category {
  String? id;
  String? name;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.id,
        this.name,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name']??"";
    createdBy = json['createdBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['name'] = this.name;
  //   data['createdBy'] = this.createdBy;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}
