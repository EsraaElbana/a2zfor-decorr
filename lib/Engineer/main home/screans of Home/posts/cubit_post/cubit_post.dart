import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
class ImageState {
  final List<File> selectedImages;
  ImageState({required this.selectedImages});
}

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState(selectedImages: []));

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      final files = pickedFiles.map((file) => File(file.path)).toList();
      emit(ImageState(selectedImages: files));
    }
  }


  Future<void> postImages() async {
    var headers = {
      'authorization':
      'Saraha eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6IjE2MDYyOUBnbWFpbC5jb20iLCJpZCI6IjY2Nzg0ZTY3NzYwMTJkODE4MWFkZjZmNiIsImlhdCI6MTcxOTIyMzY0MH0.JjZ12azKqY43x-vtLj-DDjsPhwi3wLcSatd-F0la-Tc'
    };
    final url = Uri.parse(
        'https://a2z-render.onrender.com/engineer/addpost'); // Replace with your API endpoint
    final request = http.MultipartRequest('POST', url);

    for (var image in state.selectedImages) {
      final mimeTypeData =
      lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])?.split('/');

      final file = await http.MultipartFile.fromPath(
        'images',
        image.path,
        contentType: mimeTypeData != null
            ? MediaType(mimeTypeData[0], mimeTypeData[1])
            : null,
      );

      request.files.add(file);
    }

    try {
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print (response.statusCode);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }
}
