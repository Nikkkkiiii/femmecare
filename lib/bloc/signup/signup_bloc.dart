import 'package:dio/dio.dart';
import 'package:femmecare/data/signup/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState>{
  SignupBloc({required SignupRepo SignupRepo}):super(SignupInitial()){
    on<SignupEvent>((event, emit) => signupList(event, emit));
  }

  void signupList(SignupEvent event, Emitter<SignupState>emit)async{
    if(event is SignupButtonPressed){
      emit(SignupLoading());
      try{
        await SignupRepo().signupUser(email: event.email, 
                                                  password: event.password, 
                                                  address: event.address, 
                                                  // firstName: event.firstName, 
                                                  // lastName: event.lastName, 
                                                  username: event.username, 
                                                  phone_number: event.phone_number,
                                                  // profileImage: event.profileImage
                                                  );
      emit(SignupSuccess());
      }
      catch(error){
        if (error is DioException) {
          if (error.response != null) {
            final statusCode = error.response!.statusCode;
            if (statusCode == 522) {
              emit(SignupFailure(
                  error: 'Connection timed out. Please try again later.'));
            
            } else {
              emit(SignupFailure(
                  error: error.response?.data["message"][0]));
            }
          } else {
            emit(SignupFailure(
                error: "Something went wrong, please try again later."));
                
          }
        } else {
          emit(SignupFailure(
              error: "Something went wrong, please try again laterrrr."));

        }
      }
    }
  }

}