import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/data/login/login_model.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class LoginRepo{
  final Dio dio = Dio();

  Future<User> loginUser(String email, String password)async{
    Response response = await dio.post(
      AppUrls.login,
      data: {
        'email':email,
        'password': password
      },
    );
    User user = User.fromJson(response.data);
    await SharedUtils.saveToken(user.accessToken);
    return user;

  }
    Future<void> logoutUser() async {
    await SharedUtils.clearToken();
  }
}