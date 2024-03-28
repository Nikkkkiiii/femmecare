import 'package:flutter/material.dart';
import 'package:flutter_basic_chat_bubble/flutter_basic_chat_bubble.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  final List<BasicChatMessage> messages = [
    BasicChatMessage(
        peerUserName: "John", messageText: "Hello!", timeStamp: "10:00 AM"),
    BasicChatMessage(
        peerUserName: "Alice", messageText: "Hi there!", timeStamp: "10:05 AM"),
    // Add more messages as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mr. ABC"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Expanded(
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return BasicChatBubble(
              message: messages[index],
              isMe: index % 2 ==
                  0, // Every second bubble has the isMe flag set to true
              backgroundColor: index % 2 == 0 ? Colors.pink : Colors.blue,
              textColor: Colors.white,
            );
          },
        ),
      )),
      bottomNavigationBar: _buildMessageEditText(context),
    );
  }
}

/// Section Widget
Widget _buildMessageEditText(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 21, right: 20, bottom: 17),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Type a message ...",
        suffixIcon: Container(
          padding: EdgeInsets.fromLTRB(8, 9, 7, 9),
          margin: EdgeInsets.fromLTRB(12, 4, 4, 4),
          decoration: BoxDecoration(
            color: Color(0XFFFFBE40),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(
            Icons.send,
            color: Colors.black,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 15, top: 13, bottom: 13),
      ),
      textInputAction: TextInputAction.done,
    ),
  );
}



