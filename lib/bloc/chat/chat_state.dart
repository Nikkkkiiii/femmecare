part of 'chat_bloc.dart';

abstract class ChatListState{}

final class ChatListInitial extends ChatListState {}

final class ChatListLoading extends ChatListState {}

final class ChatListSuccess extends ChatListState {
  final List<ChatList> chatlist;

  ChatListSuccess({required this.chatlist});
}

final class ChatListFailure extends ChatListState {
  final String error;

  ChatListFailure({required this.error});
}

final class TokenExpired extends ChatListState {}