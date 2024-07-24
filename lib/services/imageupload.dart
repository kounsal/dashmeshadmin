import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();
  final String imgBBkey = '6342ff0472759463cba4d5ab4448a60c';

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<Map<String, dynamic>> uploadImage(File image) async {
    try {
      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      FormData formData = FormData.fromMap({
        "key": imgBBkey,
        "image": base64Image,
      });

      Response response = await _dio.post(
        "https://api.imgbb.com/1/upload",
        data: formData,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }
}
