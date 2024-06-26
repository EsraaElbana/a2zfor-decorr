import 'package:clint_store/services/shared_preference.dart';
import 'package:dio/dio.dart';


class DioHelper {
  static Dio? dio;
  static init({required String serverAdress}) {
    dio = Dio(
      BaseOptions(
        baseUrl: serverAdress,
        receiveDataWhenStatusError: true,
      ),
    );
  }
///////////////////////////////////////////////////////////////////////////////

  static Future dioGetMethod({
    required String endPoint,
    // serverAdress,
    Options? options,
    Map<String, dynamic>? query,
  }) async {
    Response response;
    try {
      init(serverAdress: SharedPreference.getData(key:"server"));
      response  = await dio!.get(
        endPoint,
        options: options,
        queryParameters: query,
      );
      if (response.statusCode == 200) {
        return response;
      }
    // ignore: empty_catches
    } on DioError {}
  }

////////////////////////////////////////////////////////////////////////////////
  static Future? dioPostMethod({
    required String endPoint,
    serverAdress,
    required  var data,
    Options? options,
    Map<String, dynamic>? query,
  }) async {
    Response? response;
    try {
      init(serverAdress: serverAdress);
       response = await dio!.post(endPoint,
          options: options, queryParameters: query, data: data);

      if (response.statusCode == 200){
        return response;
      }

    } on DioError  {
      return response;
    }

  }
///////////////////////////////////////////////////////////////////////////////
  static Future? dioEditMethod({
    required String endPoint,
    serverAdress,
    required  var data,
    Options? options,
    Map<String, dynamic>? query,
  }) async {
    Response? response;
    try {
      init(serverAdress: serverAdress);
      response = await dio!.put(endPoint,
          options: options, queryParameters: query, data: data);

      if (response.statusCode == 200){
        return response;
      }

    } on DioError  {
      return response;
    }

  }
////////////////////////////////////////////////////////////////////////////////
  static Future? dioDeleteMethod({
    required String endPoint,
    serverAdress,
    required  var data,
    Options? options,
    Map<String, dynamic>? query,
  }) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    try {
      init(serverAdress: serverAdress);
      response = await dio!.delete(endPoint,
          options: options, queryParameters: query, data: data);

      if (response.statusCode == 200){
        return response;
      }


    } on DioError {
      // print(error.toString());
      return response;
    }

  }

}











