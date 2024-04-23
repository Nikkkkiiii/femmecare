import 'dart:convert';

import 'package:femmecare/presentations/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Message {
  final String text;
  final bool isMe;

  Message(this.text, this.isMe);
}

class ChatPage extends StatefulWidget {
  final int userId;
  final int myId;

  const ChatPage({super.key, required this.userId, required this.myId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late WebSocketChannel channel;

  final TextEditingController _textController = TextEditingController();
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect(
        'ws://192.168.1.80:8000/ws/chat/${widget.myId}/${widget.userId}/');

    // Handle incoming messages
    channel.stream.listen((message) {
      var newMessage = jsonDecode(message);

      bool isMe = false;
      if (newMessage['username_from'] == widget.myId) {
        isMe = true;
      }

      setState(() {
        messages.add(Message(newMessage['message'], isMe));
      });
    });
  }

  void _sendMessage() {
    String message = _textController.text.trim();
    if (message == "") {
      return;
    }
    if (message.isNotEmpty) {
      channel.sink.add(
          '{"message": "$message", "from": ${widget.myId}, "to": ${widget.userId} }');
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index].isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:
                            messages[index].isMe ? Colors.blue : Colors.green,
                      ),
                      child: Text(messages[index].text)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: _textController,
                    hintText: 'Type your message...',
                    // context: context,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Close the WebSocket connection when the widget is disposed
    channel.sink.close();
    super.dispose();
  }
}
