// import 'package:femmecare/logic/login/login_bloc.dart';
import 'package:femmecare/bloc/login/login_bloc.dart';
import 'package:femmecare/presentations/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
               
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      '${state.error}',
                    ),
                    duration: Duration(seconds: 1),
                  ));
              
              }
              if (state is LoginLoading) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Please Wait'),
                  duration: Duration(seconds: 1),
                ));
              }
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Success'),
                    duration: Duration(seconds: 1),
                  ),
                );
                Navigator.pushReplacementNamed(context, '/cal');
              }
            },
            child: Scaffold(
              backgroundColor: Colors.pink,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/Login.png"),
                    SizedBox(height: 20),
                   
                    Container(
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: "email",
                        hintStyle: TextStyle(color: Colors.white),
                        // controller: idcontroller,
                      ),
                      // const SizedBox(height: 20),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: CustomTextFormField(
                        controller: passController,
                        obscureText: !_showPassword,
                        hintText: "Password",
                        prefixConstraints: const BoxConstraints(),
                        suffix: buildPasswordToggleIcon(),
                        hintStyle: TextStyle(color: Colors.white),
                        // controller: passwordcontroller,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    )),
                    const SizedBox(height: 20),
                    
                    ElevatedButton(
                      onPressed: () {

                         

                                context.read<LoginBloc>().add(
                            LoginButtonPressed(
                              email: emailController.text,
                              password: passController.text,
                            ),
                          );
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(200, 50),
                        // elevation: 4,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/signUp');
                        },
                        child: Text(
                          'Don\'t have an account? SignUp',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            )),
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
