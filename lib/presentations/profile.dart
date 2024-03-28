import 'package:femmecare/presentations/editProfile.dart';
import 'package:femmecare/presentations/widget/appbar_widget.dart';
import 'package:femmecare/presentations/widget/button_widget.dart';
import 'package:femmecare/presentations/widget/numbers_widget.dart';
import 'package:femmecare/presentations/widget/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

    User copyWith({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    bool? isDarkMode,
  }) {
    return User(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      email: email ?? this.email,
      about: about ?? this.about,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
class UserPreferences {
  static const myUser = User(
    imagePath:
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Sarah Abs',
    email: 'sarah.abs@gmail.com',
    about:
        'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
    isDarkMode: true,
  );

   static void saveUser(User user) {
    // Implement your preferred data persistence mechanism here
    // For example: Save user data to SharedPreferences, SQLite database, or send data to a server
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {}, isEdit: true,
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          // Center(child: buildUpgradeButton(context)),
          Center(
            child: GestureDetector(
              onTap:(){
                 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
       // Replace EditProfilePage() with the page you want to navigate to
    );
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(17),

                color: Color.fromARGB(255, 235, 163, 224), // Replace with your desired background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.1), // Adjust shadow color and opacity as needed
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2), // Adjust the shadow offset
                  ),
                ],
              
              ),child: Center(child: Text("Edit",))),
          )),
           SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.pink ),
          ),
          
        ],
      );

    

Widget buildUpgradeButton(BuildContext context) => ButtonWidget(
  text: 'Edit',
  onClicked: () {
    // Navigate to the other page when the button is clicked
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()), // Replace EditProfilePage() with the page you want to navigate to
    );
  },
  textColor: Colors.pink, 
  buttonColor: Colors.purple,
);

Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

