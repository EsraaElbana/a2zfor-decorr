// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';
import '../../models/designer_model.dart';
import '../../models/category_model.dart';
import '../../models/product_model_client.dart';
import '../../services/shared_preference.dart';
import '../application_state/client_states.dart';

import 'package:dio/dio.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(InitialState());

  static ClientCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

// ////////////////////////////////////////////////////////////////////////////////
  List<Product> allProducts = [];

  Future<void> getAllProducts() async {
    allProducts.clear();
    try {
      emit(GetAllProductLoading());

      var response = await dio.get(baseUrl + "user/getallproduct",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data["Products"] as List).forEach((element) {
          allProducts.add(Product.fromJson(element));
        });
        emit(GetAllProductSuccess());
        print("get AAAAAAAAAAAAAAAAlllllllllll Products ${allProducts.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetAllProductError());
      }
    }
  }

// //////////////////////////////////////////////////////////////////////////////
  List<Product> productsOfSpecialCategory = [];
  Future<void> getProductsByCategoryName({required String categoryName}) async {
    productsOfSpecialCategory.clear();
    emit(GetSpecialProductLoading());
    try {
      var response = await dio.get(
          baseUrl + "user/productbycategory?searchKey=$categoryName",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data["productsc"] as List).forEach((element) {
          productsOfSpecialCategory.add(Product.fromJson(element));
        });
        emit(GetSpecialProductSuccess());
        print(
            "get product of category ${categoryName} is ${productsOfSpecialCategory.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetSpecialProductError());
      }
    }
  }

/////////////////////////////////////////////////////////////////////////////////////

  List<Category> categories = [];
  Future<void> getClientHomeCategories() async {
    categories.clear();
    emit(GetCategoryLoading());
    try {
      var response = await dio.get(baseUrl + "user/getallcategory",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data["Categories"] as List).forEach((element) {
          categories.add(Category.fromJson(element));
        });
        categories.insert(0, Category(name: "All"));
        emit(GetCategorySuccess());
        print("get All Categories ${categories.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      emit(GetCategoryError());
      // if (error.error is SocketException) {
      //   emit(ServerErrorClient());
      // } else {
      //   emit(GetCategoryError());
      // }
    }
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////

  List<Designer> designers = [];
  Future<void> getClientHomeDesigners() async {
    designers.clear();
    emit(GetDesignerLoading());
    try {
      var response = await dio.get(baseUrl + "user/getalleng",
          options: Options(
            method: 'GET',
            headers: {
              HttpHeaders.authorizationHeader:
                  '${SharedPreference.getData(key: "token")}',
              'content-Type': 'application/json'
            },
          ));

      if (response.statusCode == 200) {
        (response.data["Engs"] as List).forEach((element) {
          designers.add(Designer.fromJson(element));
        });
        emit(GetDesignerSuccess());
        print("get Designer List  ${designers.length}");
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(GetDesignerError());
      }
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<bool> contactUs({
    required String userName,
    required String email,
    required String subject,
    required String message,
  }) async {
    var params = {
      "name": userName,
      "email": email,
      "subject": subject,
      "message": message
    };

    emit(ContactUsLoading());

    try {
      var response = await dio.post(
        baseUrl + "user/contactmsg",
        data: params,
        options: Options(
          method: 'POST',
          headers: {
            HttpHeaders.authorizationHeader:
                '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 200) {
        print("contact us is done");

        emit(ContactUsSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(ContactUsError());
      }
    }

    return false;
  }

/////////////////////////////////////////////// Cart   //////////////////////////////////////////////////////

  Future<bool> addToCart({
    required String productId,
    required int Quantity,
  }) async {
    var params = {"productId": productId, "quantity": Quantity};

    emit(AddToCartLoading());

    try {
      var response = await dio.post(
        baseUrl + "user/addcart",
        data: params,
        options: Options(
          method: 'POST',
          headers: {
            HttpHeaders.authorizationHeader:
                '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 200) {
        print("AAAAAAAADDDDD TTTTooo CCCCART");
        getAllCartProducts();
        emit(AddToCartSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(AddToCartError());
      }
    }

    return false;
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Product> allCartProducts = [];

  Future<bool> getAllCartProducts() async {
    // allCartProducts.clear();
    //
    // emit(GetAllCartLoading());
    //
    // try {
    //   var response = await dio.get(
    //     baseUrl + "cart/website/${SharedPreference.getData(key: "userId")}",
    //     options: Options(
    //       method: 'GET',
    //       headers: {
    //         HttpHeaders.authorizationHeader:
    //             '${SharedPreference.getData(key: "token")}',
    //         'content-Type': 'application/json'
    //       },
    //     ),
    //   );
    //
    //   if (response.statusCode == 200) {
    //
    //
    //     (response.data as List).forEach((element) {
    //       allCartProducts.add(Product.fromJson(element));
    //     });
    //
    //
    //
    //     emit(GetAllCartSuccess());
    //     return true;
    //   }
    // } on DioError catch (error) {
    //   print(error.toString());
    //   if (error.error is SocketException) {
    //     emit(ServerErrorClient());
    //   } else {
    //     emit(GetAllCartError());
    //   }
    // }
    return false;
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<bool> deleteProductFromCart({
    required String productId,
  }) async {
    var params = {"productId": productId};

    emit(DeleteItemCartLoading());

    try {
      var response = await dio.delete(
        baseUrl + "user/deletecart",
        data: params,
        options: Options(
          method: 'DELETE',
          headers: {
            HttpHeaders.authorizationHeader:
                '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Delete Product from cart");
        getAllCartProducts();
        emit(DeleteItemCartSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorClient());
      } else {
        emit(DeleteItemCartError());
      }
    }

    return false;
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////
}
