// import 'package:femmecare/logic/signup/signup_bloc.dart';
import 'package:femmecare/presentations/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
 
  TextEditingController addressController = TextEditingController();

  bool value = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    // return BlocListener<Signupblock, SignupState>(
    //     listener: (context, state) {
    //       if (state is SignupError) {
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //           content: Text(
    //             '${state.message}',
    //           ),
    //           duration: const Duration(seconds: 1),
    //         ));
    //       }
    //       if (state is SignupLoading) {
    //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //           content: Text('Please Wait'),
    //           duration: Duration(seconds: 1),
    //         ));
    //       }
    //       if (state is SignupLoaded) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(
    //             content: Text('Success'),
    //             duration: Duration(seconds: 1),
    //           ),
    //         );
    //         print("\n\n\n");
    //         // print(state.signupModel.otp_key);
    //         print("\n\n\n");

    //         // Navigator.push(
    //         //     context,
    //         //     GeneratedRoute().onGeneratedRoute(RouteSettings(arguments: {
    //         //       'otp_key': state.signupModel.otp_key,
    //         //       'email': state.signupModel.email
    //         //     }, name: '/otp')));

    //         Navigator.pushReplacementNamed(context, '/cal');
    //       }
    //     },
        return Scaffold(
          backgroundColor: Colors.pink,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextFormField(
                      controller: emailController,
                      
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextFormField(
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Phone Number',
                        
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                        // suffix: buildPasswordToggleIcon(),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: this.value,
                        activeColor:
                            Colors.white, // Set the fill color of the checkbox
                        checkColor:
                            Colors.pink, // Set the color of the check/tick mark
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              this.value = value;
                            });
                          }
                        },
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.0),
                          child: Text(
                            'I agree to Femmecare Public Agreement, Terms, & Privacy Policy.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
// print(emailController.text);
//                       context.read<Signupblock>().add(
//                             SignupClickedEvent(
//                               email: emailController.text,
//                               password: passwordController.text,
//                               // confirmPassword : confirmPasswordController.text,
          
//                               address: addressController.text, 
//                               phone_number: phoneNumberController.text,
//                             ),
//                           );

//                       Navigator.pushReplacementNamed(context, '/login');
//                       // Perform an action when the button is pressed
//                     },
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.white,
                    //   fixedSize: Size(200, 50),
                    //   // elevation: 4,
                    // ),
                    // child: const Text(
                    //   'Signup',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.pink,
                    //   ),
                    // ),
                  // ),
                  const SizedBox(
                    height: 22,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      text: 'Already have an account? ',
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Widget buildPasswordToggleIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPassword = !_showPassword;
        });
      },
      child: Icon(
        _showPassword ? Icons.visibility : Icons.visibility_off,
        size: 20,
        color: Colors.grey,
      ),
    );
  }
}
