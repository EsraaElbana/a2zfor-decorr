// import 'dart:convert';
//
// import '../application_state/profile_states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../services/shared_preference.dart';
// import '../../app_manager/local_data.dart';
// import '../../models/client_model.dart';
// import 'package:dio/dio.dart';
// import 'dart:io';
//
// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(InitialState());
//
//   static ProfileCubit get(context) => BlocProvider.of(context);
//   Dio dio = Dio();
//
// ///////////////////////////////////////////////////////////////////////////////////
// //   void resetToInitial() {
// //
// //
// //     emit(InitialState());
// //   }
// //
// //   void loading() {
// //
// //     emit(Loading());
// //   }
// ///////////////////////////////////////////////////////////////////////////////////
// // http://tree.megastore-app.com:5000/api/v1/users/642430a94aee223783a041c8
//
//   List<OutFamily> brothersFromElOm = []; //  موجوده كده في الديزين
//   List<OutFamily> Reda3aMothersFML = [];
//
//   List<OutFamily> brothersReda3aFML = [];
//   List<OutFamily> sonsReda3aFML = [];
//
//   List<JobArray> jobsList = [];
//   List<EducationCertificateList> educationList = [];
//
//   Future<bool> editUser(
//       {required String description,
//       required String zone,
//       required String? cityId,
//       required String? countryId,
//       required String? facebook,
//       required String? twitter,
//       required String? snapchat,
//       required List<ContactArr_Type_isShow> contactArr_Type_isShow,
//
//       /// ليسته التواصل
//       required mobile,
//       required homePhone,
//       required workPhone,
//       required email,
//       required File? userLogo,
//       required DateTime? birthDate}) async {
//     Map<String, dynamic> params = {
//       "birthdate": birthDate == null ? "" : birthDate.toString(),
//       "description": description,
//       "zone": zone,
//       "brothersFromEloMFML": jsonEncode(brothersFromElOm),
//       "jobArr_Co_and_Title": jsonEncode(jobsList),
//       "EduArr_Type_and_desc": jsonEncode(educationList),
//       "facebook": facebook,
//       "snapchat": snapchat,
//       "twitter": twitter,
//       "contactArr_Type_isShow": jsonEncode(contactArr_Type_isShow),
//       "brothersReda3aFML": jsonEncode(brothersReda3aFML),
//       "Reda3aMothersFML": jsonEncode(Reda3aMothersFML),
//       "sonsReda3aFML": jsonEncode(sonsReda3aFML),
//       "mobile": mobile,
//       "homePhone": homePhone,
//       "workPhone": workPhone,
//       "email": email,
//       "image":
//           userLogo == null ? "" : await MultipartFile.fromFile(userLogo.path)
//     };
//
//     if (cityId != null) {
//       params["city"] = cityId;
//     }
//     if (countryId != null) {
//       params["country"] = countryId;
//     }
//
//     FormData formData = FormData.fromMap(params);
//
//     emit(EditLoading());
//
//     try {
//       var response = await dio.put(
//         baseUrl + "users/${SharedPreference.getData(key: "userId")}",
//         data: formData,
//         options: Options(
//             method: 'GET',
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//
//             headers: {
//               "Content-Type": "application/json",
//               "Authorization":
//                   "Bearer ${SharedPreference.getData(key: "token")}",
//               "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//             }),
//       );
//       if (response.statusCode == 200) {
//         print("DDDDDOOOONNNNNEEEEE EEEEEEEEEEDITTTTINGGGGGG");
//         getUserByID(
//           idOfUser: SharedPreference.getData(key: "userId"),
//         );
//         emit(EditSuccess());
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//
//       if (error.error is SocketException) {
//         emit(ServerErrorProfile());
//       } else if (error.response!.statusCode == 401) {
//         emit(ProfileLoginError2());
//       } else {
//         emit(EditError());
//       }
//       return false;
//     }
//     return false;
//   }
//
// ////////////////////////////////////////////////////////////////////////////
//   User? user;
//
// //// خلي بالك لو انت غيرت  base url ودخلت   same user هيديك error لانه مش نفس id
//
// //http://tree.megastore-app.com:5000/api/v1/users/642430a94aee223783a041c8
//   Future<bool> getUserByID({
//     required String idOfUser,
//   }) async {
//     emit(GetUserByLoading());
//     user = null;
//
//     ///   علشان انا ممكن ابقي جاي من الشجره فبفضي اليوزر علشان املاه بواحد جديد
//     print("user id in getUserByID : $idOfUser");
//     try {
//       var response = await dio.get(baseUrl + "users/$idOfUser",
//           options: Options(method: 'GET', headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Bearer ${SharedPreference.getData(key: "token")}",
//             "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//             "admin":
//                 SharedPreference.getData(key: "userId") == null ? true : false,
//           }));
//
//       if (response.statusCode == 200) {
//         user = User.fromJson(response.data);
//         SharedPreference.setData(key: "userLogo", value: user!.logo!);
//         emit(GetUserBySuccess());
//
//         print("GET User By IDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorProfile());
//       } else if (error.response!.statusCode == 401) {
//
//         emit(ProfileLoginError2());
//       } else {
//         emit(GetUserByError());
//       }
//       return false;
//     }
//
//     return false;
//   }
//
// ////////////////////////////////////////////////////////////////////////////////////////
//   String? forgetPasswordCode; //otp
//   String? userId;
//   Future<bool> forgetPassword({
//     required String mobile,
//     required String countryCode,
//   }) async {
//     Map<String, dynamic> params = {
//       "mobile": mobile,
//       "countryCode": countryCode,
//     };
//     emit(ForgetPasswordLoading());
//     try {
//       var response = await dio.post(baseUrl + "users/getotpcode",
//           options: Options(
//               method: 'POST',
//               // headers: {
//               //   HttpHeaders.authorizationHeader:
//               //       'Bearer ${SharedPreference.getData(key: "token")}',
//               //   'content-Type': 'application/json'
//               // },
//               headers: {
//                 "Content-Type": "application/json",
//                 "Authorization":
//                     "Bearer ${SharedPreference.getData(key: "token")}",
//                 "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//                 "admin":true
//                 // SharedPreference.getData(key: "userId") == null
//                 //     ? true
//                 //     : false,
//               }),
//           data: params);
//
//       if (response.statusCode == 200) {
//         print(response.data);
//         forgetPasswordCode = response.data["code"].toString();
//
//         userId = response.data["user"];
//
//         print(response.data);
//         emit(ForgetPasswordSuccess());
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorProfile());
//       } else if (error.response!.statusCode == 401) {
//         emit(ProfileLoginError2());
//       } else {
//         emit(ForgetPasswordError());
//       }
//       return false;
//     }
//
//     return false;
//   }
//
// //////////////////////////////////////////////////////////////////////////
//   Future<bool> changePassword(
//       {required String password, required String userId}) async {
//     Map<String, dynamic> params = {"password": password};
//     emit(ChangePasswordLoading());
//     try {
//       var response = await dio.put(
//         baseUrl + "users/${userId}",
//         data: params,
//         options: Options(
//             method: 'PUT',
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//
//             headers: {
//               "Content-Type": "application/json",
//               "Authorization":
//                   "Bearer ${SharedPreference.getData(key: "token")}",
//               "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//               "admin": SharedPreference.getData(key: "userId") == null
//                   ? true
//                   : false,
//             }),
//       );
//
//       if (response.statusCode == 200) {
//         getUserByID(idOfUser: userId);
//
//         emit(ChangePasswordSuccess());
//         return true;
//       }
//     } on DioError catch (error) {
//       if (error.error is SocketException) {
//         emit(ServerErrorProfile());
//       } else if (error.response!.statusCode == 401) {
//         emit(ProfileLoginError2());
//       } else {
//         emit(ChangePasswordError());
//       }
//       print(error.toString());
//
//       return false;
//     }
//     return false;
//   }
//
// ////////////////////////////////////////////////////////////////////////////////////////
//   Future<bool> removeAccount({
//     required bool status,
//   }) async {
//     Map<String, dynamic> params = {"status": status};
//     try {
//       var response = await dio.put(
//         baseUrl + "users/${SharedPreference.getData(key: "userId")}",
//         data: params,
//         options: Options(
//             method: 'PUT',
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             headers: {
//               "Content-Type": "application/json",
//               "Authorization":
//                   "Bearer ${SharedPreference.getData(key: "token")}",
//               "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//               "admin":SharedPreference.getData(key: "userId")==null?true:false,
//             }),
//       );
//       if (response.statusCode == 200) {
//         getUserByID(idOfUser: "${SharedPreference.getData(key: "userId")}");
//         return true;
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorProfile());
//       } else if (error.response!.statusCode == 401) {
//         emit(ProfileLoginError2());
//       }
//       return false;
//     }
//     return false;
//   }
// }
