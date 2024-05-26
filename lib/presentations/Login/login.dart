import 'package:femmecare/bloc/login/login_bloc.dart';
import 'package:femmecare/presentations/Login/forgot_password.dart';
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
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                '${state.error}',
              ),
              duration: const Duration(seconds: 1),
            ));
          }
          if (state is LoginLoading) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Please Wait'), duration: Duration(seconds: 1)));
          }
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success'),
                duration: Duration(seconds: 1),
              ),
            );
            Navigator.pushReplacementNamed(context, '/cal');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          backgroundColor: Colors.pink,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/Login.png"),
                  const SizedBox(height: 20),
                  Container(
                    child: CustomTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      hintStyle: const TextStyle(color: Colors.white),
                      // controller: idcontroller,
                    ),
                    // const SizedBox(height: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: CustomTextFormField(
                      controller: passController,
                      obscureText: !_showPassword,
                      hintText: "Password",
                      prefixConstraints: const BoxConstraints(),
                      suffix: buildPasswordToggleIcon(),
                      hintStyle: const TextStyle(color: Colors.white),
                      // controller: passwordcontroller,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    child: Container(
                        child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    )),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("hiii");
                      context.read<LoginBloc>().add(
                            LoginButtonPressed(
                              email: emailController.text,
                              password: passController.text,
                            ),
                          );
                    },
                   
                    child: const Text(
                      'log in',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/signUp');
                      },
                      child: const Text(
                        'Don\'t have an account? SignUp',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ));
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
