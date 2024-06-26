import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../app_manager/local_data.dart';
import '../../models/client_model.dart';
import '../../models/engineer_model.dart';
import '../../services/shared_preference.dart';
import '../application_state/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

  String errorClientRegisterMessage = "";
  Future<bool> registerAsClient({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingClient());
    Map<String, dynamic> params = {
      "userName": userName,
      "email": email,
      "password": password,
      "Repass": confirmPassword
    };
    print("$params");
    try {
      var response = await dio.post(baseUrl + "user", data: params);
      if (response.statusCode == 201) {
        print("Register is Done");

        emit(RegisterSuccessClient());

        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorAuth());
      } else {
        errorClientRegisterMessage = error.response!.data["message"]!;
        emit(RegisterErrorClient());
      }
      return false;
    }

    return false;
  }

////////////////////////////////////////////////////////////////////////////////////////
  String errorEngineerRegisterMessage = "";
  Future<bool> registerAsEngineer({
    required String userName,
    required String email,
    required String password,

    required String phoneNumber,
    required String userAddress,
    required File userIdentityImage,
  }) async {
    emit(RegisterLoadingEngineer());


    //// بضغط الصوره قبل مارفعها
    var userIdentity = await FlutterImageCompress.compressAndGetFile(
      userIdentityImage.path,
      userIdentityImage.path + '_compressed.jpg', // Create a temporary compressed file
      quality: 20, // Adjust this value to control the compression quality
      minWidth: 1000,
      minHeight: 1000,
    );




    Map<String, dynamic> params = {
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': userAddress,

      "image": await MultipartFile.fromFile(userIdentity!.path)
    };
    FormData formData = FormData.fromMap(params);



    // FormData formData = FormData.fromMap({
    //   'userName': userName,
    //   'email': email,
    //   'password': password,
    //   'phoneNumber': phoneNumber,
    //   'address': userAddress,
    //   'image': await MultipartFile.fromFile(
    //     userIdentity!.path,
    //     // filename: path.basename(userIdentity!.path,),
    //     // contentType: MediaType("image", "jpeg"),
    //   ),
    // });







    // print("$params");
    try {
      var response = await dio.post(baseUrl + "engineer/signup", data: formData,options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "multipart/form-data",
        },
      ));

      if (response.statusCode == 201) {
        print("Register is Done");
        emit(RegisterSuccessEngineer());

        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorAuth());
      } else {
        errorEngineerRegisterMessage = error.response!.data["message"]!;
        emit(RegisterErrorEngineer());
      }
      return false;
    }

    return false;
  }

///////////////////////////////////////////////////////////////////////////////////////////////////
  Client? client;
  String errorLoginMessage="";
  Future<bool> loginAsClient({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingClient());

    Map<String, dynamic> params = {"email": email, "password": password};
    // print(params);
    try {
      var response = await dio.post(baseUrl + "user/login", data: params);

      if (response.statusCode == 200) {
        client = Client.fromJson(response.data);
        print("Success login");

        SharedPreference.setData(key: "userId", value: client!.user!.id);
        SharedPreference.setData(key: "token", value: "A2Z ${client!.user!.token}");
        SharedPreference.setData(key: "userName", value: client!.user!.userName);
        SharedPreference.setData(key: "userType", value: "Client");

        print("user Id : ${SharedPreference.getData(key: "userId")}")  ;
        print("user token : ${SharedPreference.getData(key: "token")}")  ;
        print("user Name  : ${SharedPreference.getData(key: "userName")}")  ;
        print("user Type  : ${SharedPreference.getData(key: "userType")}")  ;
        emit(LoginSuccessClient());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorAuth());
      } else {
        errorLoginMessage = error.response!.data["message"]!;
        emit(LoginErrorClient());
      }
      return false;
    }

    return false;
  }

///////////////////////////////////////////////////////////////////////



  Engineer? engineer;

  Future<bool> loginAsEngineer({

    required String email,
    required String password,
  }) async {

    emit(LoginLoadingEngineer());

    Map<String, dynamic> params = {"email": email, "password": password};
    // print(params);
    try {
      var response = await dio.post(baseUrl + "engineer/login", data: params);

      if (response.statusCode == 200) {
        engineer = Engineer.fromJson(response.data);
        print("Success login");

        SharedPreference.setData(key: "userId", value: engineer!.user!.id);
        SharedPreference.setData(key: "token", value: "Saraha ${engineer!.user!.token}");
        SharedPreference.setData(key: "userName", value: engineer!.user!.userName);
        SharedPreference.setData(key: "userAddress", value: engineer!.user!.address);
        SharedPreference.setData(key: "userNumber", value: engineer!.user!.phoneNumber);
        SharedPreference.setData(key: "email", value: engineer!.user!.email);
        SharedPreference.setData(key: "userType", value: "Engineer");



        print("user address  : ${SharedPreference.getData(key: "userAddress")}")  ;
        print("user phone  : ${SharedPreference.getData(key: "userNumber")}")  ;
        print("user email  : ${SharedPreference.getData(key: "email")}")  ;


        print("user Id : ${SharedPreference.getData(key: "userId")}")  ;
        print("user token : ${SharedPreference.getData(key: "token")}")  ;
        print("user Name  : ${SharedPreference.getData(key: "userName")}")  ;

  print("user Type  : ${SharedPreference.getData(key: "userType")}")  ;
        emit(LoginSuccessEngineer());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorAuth());
      } else {
        errorLoginMessage = error.response!.data["message"]!;
        emit(LoginErrorEngineer());
      }
      return false;
    }

    return false;
  }
}

