import 'package:dio/dio.dart';
import 'package:femmecare/data/login/login_model.dart';
import 'package:femmecare/data/login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginRepo loginRepo;

  LoginBloc({required this.loginRepo}): super(LoginInitial());

  // @override
  Stream<LoginState>mapEventToState(LoginEvent event)async*{
    if (event is LoginButtonPressed){
      yield LoginLoading();

      try{
        User user = await loginRepo.loginUser(event.email, event.password);
        yield LoginSuccess(user: user);
      }
      catch(error){
        if(error is DioException){
          if(error.response !=null){
            final statuscode = error.response!.statusCode;
            if(statuscode == 522){
              yield LoginFailure(error: 'Connection timed out. Please try again later.');
            }
            else if(statuscode == 401){
              yield LoginFailure(error: 'Please make sure the username and password is correct.');
            }
            else{
              yield LoginFailure(error: "Something went wrong, please try again later");
            }
          }
          else{
          yield LoginFailure(error: error.response?.data["message"][0]);
        }
        }
        else{
          yield LoginFailure(error: "Something went wrong, please try again later");
        }
        
      }
    }
    else if(event is LogoutButtonPressed){
      await loginRepo.logoutUser();
      yield LoginInitial();
    }
  }
}