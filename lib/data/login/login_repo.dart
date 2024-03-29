import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/data/login/login_model.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class LoginRepo{
  final Dio dio = Dio();

  Future<User> loginUser( {required String email, required String password})async{

    Response response = await dio.post(
      AppUrls.login,
      data: {
        'email':email,
        'password': password
      },
    );
    
    print("repo");
    print(response.data);
    print("repo");
    print(response.data);
    // var decoded=jsonDecode(response.data);
    User user = User.fromMap(response.data);
    print("repo repo");

    await SharedUtils.saveToken(user.accessToken);
    return user;

  }
    Future<void> logoutUser() async {
    await SharedUtils.clearToken();
  }
}