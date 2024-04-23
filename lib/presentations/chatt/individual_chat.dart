import 'package:femmecare/presentations/widget/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_chat_bubble/flutter_basic_chat_bubble.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<BasicChatMessage> messages = [
    BasicChatMessage(
        peerUserName: "John", messageText: "Hello!", timeStamp: "10:00 AM"),
    BasicChatMessage(
        peerUserName: "Alice", messageText: "Hi there!", timeStamp: "10:05 AM"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            const Text(
              "Messages",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox()
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
              backgroundColor: index % 2 == 0
                  ? Color.fromARGB(255, 255, 24, 58)
                  : const Color.fromARGB(255, 182, 182, 182),
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
      padding: const EdgeInsets.only(left: 21, right: 20, bottom: 17),
      child: CustomSearchView(
        // controller: messageEditTextController,
        hintText: "Type a message ...",
        suffix: Container(
          padding: const EdgeInsets.fromLTRB(9, 9, 7, 9),
          margin: const EdgeInsets.fromLTRB(12, 4, 8, 4),
          decoration: BoxDecoration(
              color: const Color(0XFFFFBE40),
              borderRadius: BorderRadius.circular(17)),
          child: const Icon(
            Icons.send,
            color: Colors.black,
          ),
        ),
        suffixConstraints: const BoxConstraints(maxHeight: 42),
        contentPadding: const EdgeInsets.only(left: 15, top: 13, bottom: 13),
        context: context,
      ));
}