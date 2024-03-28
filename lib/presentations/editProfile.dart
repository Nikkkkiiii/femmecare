import 'package:femmecare/presentations/profile.dart';
import 'package:femmecare/presentations/widget/profile_widget.dart';
import 'package:femmecare/presentations/widget/textfieldWidget.dart';
import 'package:flutter/material.dart';
// import 'package:user_profile_ii_example/model/user.dart';
// import 'package:user_profile_ii_example/utils/user_preferences.dart';
// import 'package:user_profile_ii_example/widget/appbar_widget.dart';
// import 'package:user_profile_ii_example/widget/button_widget.dart';
// import 'package:user_profile_ii_example/widget/profile_widget.dart';
// import 'package:user_profile_ii_example/widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {

  
        return Scaffold(
          body:   SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right:16.0, left:16.0),
              child: Column(
                      // padding: EdgeInsets.symmetric(horizontal: 32),
                      // physics: BouncingScrollPhysics(),
                      children: [
                        ProfileWidget(
                         
                          imagePath: "https://my.alfred.edu/zoom/_images/foster-lake.jpg",
                          isEdit: true,
                          onClicked: () async {},
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: 'Full Name',
                          text: "user.name",
                          onChanged: (name) {},
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: 'Email',
                          text: "user.email",
                          onChanged: (email) {},
                        ),
                        const SizedBox(height: 24),
                        TextFieldWidget(
                          label: 'About',
                          text: "user.about",
                          maxLines: 5,
                          onChanged: (about) {},
                        ),
                        SizedBox(height: 10),
                        InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/cal');
                              },
                              child: Container(
                                 height: 50,
                width: 150,
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
              ),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                ),
                              )
                            ),
                      ],
                    ),
            ),
          ),
              
            
        
        
      );
}
}