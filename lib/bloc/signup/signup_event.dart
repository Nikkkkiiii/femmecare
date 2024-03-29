part of 'signup_bloc.dart';

abstract class SignupEvent{}

class SignupButtonPressed extends SignupEvent{
  final String email;
  final String password;
  // final String firstName;
  final String address;
  // final String lastName;
  final String username;
  final String phone_number;
    // final String profileImage;



  SignupButtonPressed({required this.email, 
                        required this.password, 
                        // required this.firstName, 
                        required this.address, 
                        // required this.lastName, 
                        // required this.profileImage, 
                        required this.phone_number,
                        required this.username});
}