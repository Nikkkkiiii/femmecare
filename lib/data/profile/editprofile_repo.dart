import 'dart:io';
import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class EditProfileRepo {
  final Dio dio = Dio();

  Future<void> updateProfile(
      {required String lastname,
      required String firstname,
      required String contact,
      required String location,
      required String username,
      required File? image,
      required String name,
      required String description}) async {
    final token = await SharedUtils.getToken();

    print("repo");

    try {
      FormData formData;
      if (image == null) {
        formData = FormData.fromMap({
          'last_name': lastname,
          'first_name': firstname,
          'phone_no': contact,
          'address': location,
          'username': username,
          'name': name,
          'description': description,
          'image': await MultipartFile.fromFile(image!.path ),
        });
      } else {
        formData = FormData.fromMap({
          'last_name': lastname,
          'first_name': firstname,
          'phone_no': contact,
          'address': location,
          'username': username,
          'name': name,
          'description': description,
          'image': await MultipartFile.fromFile(image.path),
        });
      }

      final response = await dio.post(AppUrls.updateProfile,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
          data: formData);

      print(response.data);
    } catch (error) {
      print(error);
    }
  }
}