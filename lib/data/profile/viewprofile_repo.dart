

import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/data/profile/profile_model.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class ViewProfileRepo{
  final Dio dio = Dio();

  Future<ProfileList> getProfileData(int user) async {
    final token = await SharedUtils.getToken();

    final response = await dio.post(AppUrls.viewProfile,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {'user': user}
      );
    print(response.data);

    ProfileList userData = ProfileList.fromMap(response.data[0]);
    return userData;
  }
}