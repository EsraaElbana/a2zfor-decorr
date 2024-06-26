import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../../app_manager/local_data.dart';
import '../../models/engineer_model.dart';
import '../../services/shared_preference.dart';
import '../application_state/engineer_states.dart';

class EngineerCubit extends Cubit<EngineerStates> {
  EngineerCubit() : super(InitialState());

  static EngineerCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

  //final _picker = ImagePicker();
  final _dio = Dio();

  File? img;

  Future<void> getImageFromGalleryLicencePic() async {
    final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pic != null) {
      img = File(pic.path);
    }

    emit(state);
  }

  ImageData? ImageProfile;

  Future<void> postImage(File img) async {
    //emit(EngineerIImgLoading());

    var headers = {
      HttpHeaders.authorizationHeader:
          '${SharedPreference.getData(key: "token")}',
      'content-Type': 'application/json'
    };

    final mimeTypeData =
        lookupMimeType(img.path, headerBytes: [0xFF, 0xD8])?.split('/');

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      Uri.parse('https://a2z-render.onrender.com/engineer/Profile'),
    );

    final file = await http.MultipartFile.fromPath(
      'image',
      img.path,
      contentType: mimeTypeData != null
          ? MediaType(mimeTypeData[0], mimeTypeData[1])
          : null,
    );

    imageUploadRequest.files.add(file);
    imageUploadRequest.headers.addAll(headers);
    try {
      final response = await imageUploadRequest.send();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //emit(ProfilePicSuccessState());
        print('Image uploaded successfully');

        SharedPreference.setData(
            key: "profileImage", value: ImageProfile!.secureUrl[0]);

        print("user Name  : ${SharedPreference.getData(key: "profileImage")}");
      } else {
        emit(ProfilePicFailedState(
            'Failed to upload image: ${response.reasonPhrase}'));
        print('Failed to upload image: ${response.reasonPhrase}');
      }
    } catch (e) {
      emit(ProfilePicFailedState('Error uploading image: $e'));
      print('Error uploading image: $e');
    }
  }
  Engineer? engineer;


  String? errorMessage;
  Future<bool> editEngineer({
    required String address,
    required String userName,
    required String phoneNumber,

  }) async {
    var params = {
      "address":address,
      "userName":userName,
      "phoneNumber":phoneNumber
    };

    emit(EditEngineerLoading());

    try {
      var response = await dio.put(
        baseUrl + "engineer/updatprofile/${SharedPreference.getData(key: "userId")}",
        data: params,
        options: Options(
          method: 'PUT',
          headers: {
            HttpHeaders.authorizationHeader:
            '${SharedPreference.getData(key: "token")}',
            'content-Type': 'application/json'
          },
        ),
      );
      print (params);

      if (response.statusCode == 200) {
        print("done editing user ");
        engineer = Engineer.fromJson(response.data["eng"]);
        print("Success login");



        SharedPreference.setData(key: "userName", value: engineer!.user!.userName);
        SharedPreference.setData(key: "userAddress", value: engineer!.user!.address);
        SharedPreference.setData(key: "userNumber", value: engineer!.user!.phoneNumber);

        SharedPreference.setData(key: "userType", value: "Engineer");

        emit(EditEngineerSuccess());
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());
      if (error.error is SocketException) {
        emit(ServerErrorEngineer());
      } else {
        errorMessage = error.response!.data["message"]!;
        emit(EditEngineerError());
      }
    }

    return false;
  }
}

/////////
// File? profileImage;
// Future<void> getImageFromGalleryProfilePic() async {
//   final pic = await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (pic != null) {
//     profileImage = File(pic.path);
//   }
//
//   emit(state);
// }


/////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//   List<AllAlbums> allAlbums2 = [];
//   List<List<AllAlbums>> sortedAlbums2 = [];
//   List<AllAlbums> sortedAlbumsDetails2 = [];
//   List<AllAlbums> sortedAlbumsFilter2 = [];
//
//   ///
//   Future getAllAlbumsToAddImageInIt() async {
//     allAlbums2.clear();
//     sortedAlbums2.clear();
//     sortedAlbumsDetails2.clear();
//     sortedAlbumsFilter2.clear();
//
//     ///    بجيب كل الالبومات اللي عاملها الادمن علششان اضيف فيها الصور
//
//     emit(GetAlbumsLoading());
//
//     try {
//       var response = await dio.get(
//         baseUrl + "galleries?statusIsShareIsLiveNoActive=isShare",
//         options: Options(method: 'GET', headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${SharedPreference.getData(key: "token")}",
//           "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//           "admin":
//               SharedPreference.getData(key: "userId") == null ? true : false,
//         }
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             ),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allAlbums2.add(AllAlbums.fromJson(element));
//         });
//
//         allAlbums2.sort((a, b) => DateTime.parse(b.eventDate!)
//             .compareTo(DateTime.parse(a.eventDate!)));
//
//         int currentYear = 0;
//         List<AllAlbums> currentYearObjects = [];
//
//         for (var obj in allAlbums2) {
//           int year = DateTime.parse(obj.eventDate!).year;
//           if (year != currentYear) {
//             if (currentYearObjects.isNotEmpty) {
//               sortedAlbums2.add(currentYearObjects);
//             }
//             currentYearObjects = [];
//             currentYear = year;
//           }
//           currentYearObjects.add(obj);
//         }
//
//         if (currentYearObjects.isNotEmpty) {
//           sortedAlbums2.add(currentYearObjects);
//         }
//
//         sortedAlbums2.forEach((element) {
//           element.forEach((element1) {
//             sortedAlbumsDetails2.add(element1);
//           });
//         });
//
//         emit(GetAlbumsSuccess());
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(GetAlbumsError());
//       }
//     }
//   }
//
// ////////////////////////////////////////////////////////////////////////////////
//   List<ImagesOfSpecificAlbum> allImagesOfSpecificAlbum = [];
//
//   Future getImageByAlbumId({required albumId}) async {
//     allImagesOfSpecificAlbum.clear();
//     emit(getImagesByIdLoading());
//     try {
//       var response = await dio.get(
//         baseUrl + "galleryDetails/gallery/$albumId",
//         options: Options(
//             method: 'GET',
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
//               "admin": SharedPreference.getData(key: "userId") == null
//                   ? true
//                   : false,
//             }),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allImagesOfSpecificAlbum.add(ImagesOfSpecificAlbum.fromJson(element));
//         });
//         emit(getImagesByIdSuccess());
//         // print("get QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ AAAAAAAAAAAAAAAAAAA");
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(getImagesByIdSError());
//       }
//     }
//   }
//
// //////////////////////////////////////////////////////////////////////////////
//   //http://tree.megastore-app.com:5000/api/v1/galleryDetails
//   // List<ImagesInAllAlbums>allImagesInAllAlbums=[];
//   List<String> allImagesInAllAlbums = [];
//
//   Future getAllImagesInAllAlbums() async {
//     allImagesInAllAlbums.clear();
//     emit(GetImageLoading());
//     try {
//       var response = await dio.get(
//         baseUrl + "galleryDetails",
//         options: Options(method: 'GET', headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer ${SharedPreference.getData(key: "token")}",
//           "fbToken": "${SharedPreference.getData(key: "firebaseToken")}",
//           "admin":
//               SharedPreference.getData(key: "userId") == null ? true : false,
//         }
//             // headers: {
//             //   HttpHeaders.authorizationHeader:
//             //       'Bearer ${SharedPreference.getData(key: "token")}',
//             //   'content-Type': 'application/json'
//             // },
//             ),
//       );
//
//       if (response.statusCode == 200) {
//         (response.data as List).forEach((element) {
//           allImagesInAllAlbums.add(ImagesInAllAlbums.fromJson(element).image!);
//         });
//         emit(GetImageSuccess());
//         // print("get ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZzz AAAAAAAAAAAAAAAAAAA");
//       }
//     } on DioError catch (error) {
//       print(error.toString());
//       if (error.error is SocketException) {
//         emit(ServerErrorMain());
//       } else if (error.response!.statusCode == 401) {
//         emit(MainLoginError2());
//       } else {
//         emit(GetImageError());
//       }
//     }
//   }

///////////////////////////////////////////////////////////////////////////////
class ImageData {
  final String secureUrl;
  final String publicId;

  ImageData({
    required this.secureUrl,
    required this.publicId,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'secure_url': secureUrl,
      'public_id': publicId,
    };
  }
}
