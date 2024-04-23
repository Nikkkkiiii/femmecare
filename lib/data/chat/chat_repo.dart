import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/data/chat/chat_model.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class ChatListRepo{
  final Dio dio = Dio();

  Future<List<ChatList>>getChatList() async{
    final token = await SharedUtils.getToken();

    final response = await dio.post(
      AppUrls.chatList,
      options: Options(headers: {'Authorization':'Bearer $token'}),
      );
      print(response.data);

      if(response.statusCode == 200){
        final List<dynamic>data = response.data;

        List<ChatList> chatlistData = [];
        for (int i = 0; i < data.length; i++){
          ChatList item = ChatList.fromMap(data[i] as Map<String, dynamic>);
          chatlistData.add(item);
        }
        return chatlistData;
      }
      else{
        print('error');
        throw Exception('Failed to load chat list');
      }
  }
}