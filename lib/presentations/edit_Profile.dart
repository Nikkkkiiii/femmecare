import 'package:femmecare/presentations/profile.dart';
import 'package:flutter/material.dart';
import 'package:femmecare/presentations/widget/appbar_widget.dart';
import 'package:femmecare/presentations/widget/button_widget.dart';
// import 'package:femmecare/presentations/user_preferences.dart';
// import 'package:femmecare/presentations/user.dart';

class EditProfilePage extends StatefulWidget {
 @override
 _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
 final _formKey = GlobalKey<FormState>();
 late String _name;
 late String _email;
 late String _about;

 @override
 void initState() {
    super.initState();
    final user = UserPreferences.myUser;
    _name = user.name;
    _email = user.email;
    _about = user.about;
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Edit Profile'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                 labelText: 'Name',
                 labelStyle: TextStyle(color: Colors.grey),
                 border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                 ),
                 focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                    borderRadius: BorderRadius.circular(10),
                 ),
                ),
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(
                 labelText: 'Email',
                 labelStyle: TextStyle(color: Colors.grey),
                 border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                 ),
                 focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                    borderRadius: BorderRadius.circular(10),
                 ),
                ),
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _about,
                decoration: InputDecoration(
                 labelText: 'About',
                 labelStyle: TextStyle(color: Colors.grey),
                 border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                 ),
                 focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                    borderRadius: BorderRadius.circular(10),
                 ),
                ),
                onSaved: (value) => _about = value!,
              ),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'Save',
                onClicked: () {
                 if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedUser = UserPreferences.myUser.copyWith(
                      name: _name,
                      email: _email,
                      about: _about,
                    );
                    UserPreferences.updateUser(updatedUser);
                    Navigator.pop(context);
                 }
                },
                textColor: Colors.pink,
                buttonColor: Colors.pink ,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
 }
}
