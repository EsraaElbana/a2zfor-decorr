import 'package:clint_store/app_manager/local_data.dart';

// class Product {
//   String? message;
//   List<Products>? products;
//
//   Product({this.message, this.products});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     if (json['Products'] != null) {
//       products = <Products>[];
//       json['Products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['message'] = this.message;
//   //   if (this.products != null) {
//   //     data['Products'] = this.products!.map((v) => v.toJson()).toList();
//   //   }
//   //   return data;
//   // }
// }

class Product {
  String? id;
  String? title;
  String? desc;
  String? slug;
  List<String>? colors;
  List<String>? sizes;
  num? price;
  num? appliedDiscount;
  num? priceAfterDiscount;
  num? stock;
  String? name;
  String? createdBy;
  List<Images>? images;
  String? customId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.id,
      this.title,
      this.desc,
      this.slug,
      this.colors,
      this.sizes,
      this.price,
      this.appliedDiscount,
      this.priceAfterDiscount,
      this.stock,
      this.name,
      this.createdBy,
      this.images,
      this.customId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'] ?? "";
    desc = json['desc'] ?? "";
    name = json['name'] ?? "";

    price = json['price'] ?? "";
    appliedDiscount = json['appliedDiscount'] ?? "";
    priceAfterDiscount = json['priceAfterDiscount'] ?? "";
//////////////////////////////////////////////////////////////////////////////////
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
      images!.isEmpty
          ? images = <Images>[
              Images(
                imageUrl: noImage,
              )
            ]
          : null;
    } else if (json['Images'] == null) {
      images = <Images>[
        Images(
          imageUrl: noImage,
        )
      ];
    }
///////////////////////////////////////////////////////////////
    colors = json['colors'].cast<String>();
    sizes = json['sizes'].cast<String>();
    slug = json['slug'];
    stock = json['stock'];

    createdBy = json['createdBy'];
    customId = json['customId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.id;
  //   data['title'] = this.title;
  //   data['desc'] = this.desc;
  //   data['slug'] = this.slug;
  //   data['colors'] = this.colors;
  //   data['sizes'] = this.sizes;
  //   data['price'] = this.price;
  //   data['appliedDiscount'] = this.appliedDiscount;
  //   data['priceAfterDiscount'] = this.priceAfterDiscount;
  //   data['stock'] = this.stock;
  //   data['name'] = this.name;
  //   data['createdBy'] = this.createdBy;
  //   if (this.images != null) {
  //     data['Images'] = this.images!.map((v) => v.toJson()).toList();
  //   }
  //   data['customId'] = this.customId;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}

class Images {
  String? imageUrl;
  String? publicId;
  String? id;

  Images({this.imageUrl, this.publicId, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = (json['secure_url'].toString().trim().isEmpty ||
            json['secure_url'] == null)
        ? noImage
        : json['secure_url'];
    publicId = json['public_id'];
    id = json['_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['secure_url'] = this.imageUrl;
  //   data['public_id'] = this.publicId;
  //   data['_id'] = this.sId;
  //   return data;
  // }
}
