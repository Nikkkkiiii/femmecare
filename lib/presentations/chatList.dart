import 'package:femmecare/presentations/chat.dart';
import 'package:flutter/material.dart';


class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _ChatState();
}

class _ChatState extends State<Messages> {
  @override
  
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        centerTitle: true,
      ),
        // appBar: AppBar(title: Text('Messages')),
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ChatPage()),);
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/images/defaults/no_image_user.png')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "username",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "Message",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {}, //go to the messages page
                  child: const Icon(Icons.menu))
            ],
          ),
        ),
        const Divider()
      ],
    )));
  }
}
