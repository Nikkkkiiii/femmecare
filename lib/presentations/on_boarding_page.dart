// import 'package:femmecare/main.dart';
import 'package:flutter/material.dart';

class On_board extends StatelessWidget {
  On_board({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 235, 87, 136),
       
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 235, 87, 136)),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                // fit: BoxFit.cover, 
                image: AssetImage("assets/Logo.png"))),
          ),
        ),
      ),
    );
  }
}