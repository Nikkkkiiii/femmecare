import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';

class SignupRepo{
  final Dio dio = Dio();

  Future<void> signupUser({required String email, 
                          required String password, 
                          required String address,
                          // required String firstName,
                          // required String lastName,
                          required String username,
                          required String phone_number,
                          // required String profileImage
                          })async{
    Response response = await dio.post(
      AppUrls.signup,
      data:  {
        'email': email,
        'password': password,
        'address': address,
        // 'firstName': firstName,
        // 'lastName': lastName,
        'username': username,
        // 'profileImage': profileImage,
        'phone_number': phone_number
      }
    );
    // User user = User.fromJson(response.data);
    // await SharedUtils.saveToken(user.accessToken);
    // return user;
  }
  
}
