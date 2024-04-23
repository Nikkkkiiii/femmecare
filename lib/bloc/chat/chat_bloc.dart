import 'package:dio/dio.dart';
import 'package:femmecare/data/chat/chat_model.dart';
import 'package:femmecare/data/chat/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';
part 'chat_event.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState>{
  ChatListBloc(): super(ChatListInitial()){
    on<ChatListEvent>((event, emit) => getChatList(event, emit));
  }

  void getChatList(ChatListEvent event, Emitter<ChatListState> emit) async {
    if (event is ChatPageOPened) {
      emit(ChatListLoading());
      try {
        List<ChatList> chatlist = await ChatListRepo().getChatList();
        emit(ChatListSuccess(chatlist: chatlist));
      } catch (error) {
        if (error is DioException) {
          if (error.response != null) {
            final statusCode = error.response!.statusCode;
            if (statusCode == 522) {
              emit(ChatListFailure(
                  error: 'Connection timed out. Please try again later.'));
            } else if (statusCode == 401) {
              emit(TokenExpired());
            } else {
              print(error);
              emit(ChatListFailure(error: error.response?.data["message"][0]));
              print('me exist after');

            }
          } else {
            emit(ChatListFailure(
                error: "Something went wrong, please try again later."));
          }
        } else {
          print(error);
          emit(ChatListFailure(
              error: "Something went wrong, please try again laterrrr."));
        }
      }
    }
  }
}