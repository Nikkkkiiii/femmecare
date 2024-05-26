import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/signUp');
    });

    return MaterialApp(
      home: Scaffold(
        body: Center(
          // Add your splash screen UI components here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16.0),
              Image.asset('assets/Logoo.jpg'), // Add the image here
            ],
          ),
        ),
      ),
    );
  }
}
