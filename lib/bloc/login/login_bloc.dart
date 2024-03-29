import 'package:dio/dio.dart';
import 'package:femmecare/data/login/login_model.dart';
import 'package:femmecare/data/login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginRepo LoginRepo}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) => loginList(event, emit ));
  }

  void loginList(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());
      try {
        print("hihihi");
        User user = await LoginRepo().loginUser(
            email: event.email,
            password: event.password
            );
            print("hello");
        emit(LoginSuccess(user: user));
      } catch (error) {
        if (error is DioException) {
          // String errorMessage = "An error occurred. Please try again.";
          if (error.response != null) {
            final statusCode = error.response!.statusCode;
            if (statusCode == 522) {
              emit(LoginFailure(
                  error: 'Connection timed out. Please try again later.'));
            
            } else {
              emit(LoginFailure(
                  error: error.response?.data["message"][0]));
            }
          } else {
          print(error);

            emit(LoginFailure(
                error: "Something went wrong, please try again later. i am being thrown"));
          }
        } else {
          print(error);
          emit(LoginFailure(
              error: "Something went wrong, please try again laterrrr."));
        }
      }
    }
  }
}
