import 'package:femmecare/presentations/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String category = "";
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();
  TextEditingController taskDeadLineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // validation(String tasktitle, String taskdescription) {
    //   print(tasktitle);
    //   print(taskdescription);
    //   print("This is category");
    //   print(category);
    //   // String user = Login.username!;
    //   if (tasktitle.isEmpty || taskdescription.isEmpty || category.isEmpty) {
    //     Fluttertoast.showToast(msg: "Please fill the all fields!");
    //     return;
    //   // }
    //   // Connection conObj = new Connection();
    //   // conObj.submitForm(tasktitle, taskdescription, category, user);
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 62, 104, 170),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     // color: Colors.white,
        //     onPressed: () {
        //       // Add logout functionality here
        //       // Navigator.pushReplacementNamed(context, '/back');
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/Login.png"))),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "New Article!!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: 25,),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: taskNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 135, 166, 244),
                        border: OutlineInputBorder(),
                        hintText: "Title"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: taskDescController,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 135, 166, 244),
                        border: OutlineInputBorder(),
                        hintText: "Description"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: taskDeadLineController,
                    maxLines: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 135, 166, 244),
                        border: OutlineInputBorder(),
                        hintText: "Deadline"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Study"),
                      value: "Study",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Personal"),
                      value: "Personal",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Miscellenious"),
                      value: "Miscellenious",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Chores"),
                      value: "Chores",
                      groupValue: category,
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    String title = taskNameController.text.trim();
                    String desc = taskDescController.text.trim();
                    print(title);
                    print(desc);

                    // validation(title, desc);
                    // Navigator.pushReplacementNamed(context, '/go');
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "ADD",
                        style: TextStyle(
                            fontFamily: AutofillHints.birthday,
                            fontSize: 20,
                            color: Color.fromARGB(255, 213, 201, 201)),
                      ),
                    ),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 12, 35, 70)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}