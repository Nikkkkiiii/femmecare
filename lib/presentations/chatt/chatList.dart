import 'package:femmecare/bloc/chat/chat_bloc.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/presentations/chatt/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _ChatState();
}

class _ChatState extends State<Messages> {
  final ChatListBloc chatlistbloc = ChatListBloc();

  @override
  void initState() {
    chatlistbloc.add(ChatPageOPened());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: BlocBuilder<ChatListBloc, ChatListState>(
            bloc: chatlistbloc,
            builder: (BuildContext context, ChatListState state) {
              if (state is TokenExpired) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Token is Expired'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                });
              } else if (state is ChatListFailure) {
                if (mounted) {
                  // Show SnackBar using ScaffoldMessenger outside the build method
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  });
                }
              } else if (state is ChatListSuccess) {
                return Column(
                  children: state.chatlist.map((chat) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatPage(userId: chat.userId, myId: chat.myId),
                                    // builder: (context) => ChatPage(),
                                    settings: RouteSettings(
                                      arguments: {
                                        "myId": chat.myId,
                                        "userId": chat.userId,
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      radius: 25,
                                      backgroundImage: chat.userImage != ""
                                          ? NetworkImage(
                                              '${AppUrls.baseUrl}/media/${chat.userImage}')
                                          : const AssetImage(
                                                  'assets/Login.png')
                                              as ImageProvider<Object>),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chat.userFullName,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        chat.message,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }).toList(),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    )));
  }
}
