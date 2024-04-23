import 'dart:convert';

class ChatList {
  final String userEmail;
  final String userFullName;
  final String userImage;
  final int userId;
  final int myId;
  final String message;
  final DateTime datetime;
  final bool sentByMe;
  ChatList({
    required this.userEmail,
    required this.userFullName,
    required this.userImage,
    required this.userId,
    required this.myId,
    required this.message,
    required this.datetime,
    required this.sentByMe,
  });

  ChatList copyWith({
    String? userEmail,
    String? userFullName,
    String? userImage,
    int? userId,
    int? myId,
    String? message,
    DateTime? datetime,
    bool? sentByMe,
  }) {
    return ChatList(
      userEmail: userEmail ?? this.userEmail,
      userFullName: userFullName ?? this.userFullName,
      userImage: userImage ?? this.userImage,
      userId: userId ?? this.userId,
      myId: myId ?? this.myId,
      message: message ?? this.message,
      datetime: datetime ?? this.datetime,
      sentByMe: sentByMe ?? this.sentByMe,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    
    result.addAll({'user_email': userEmail});
    result.addAll({'user_fullname': userFullName});
    result.addAll({'user_image': userImage});
    result.addAll({'user_id': userId});
    result.addAll({'my_id': myId});
    result.addAll({'latest_message': message});
    result.addAll({'datetime': datetime.millisecondsSinceEpoch});
    result.addAll({'sent_by_me': sentByMe});
    return result;
    
  }

  factory ChatList.fromMap(Map<String, dynamic> map) {
    return ChatList(
      userEmail: map['user_email'] ?? '',
      userFullName: map['user_fullname'] ?? '',
      userImage: map['user_image'] ?? '',
      userId: int.parse(map['user_id'] ?? '0'),
      myId: int.parse(map['my_id'] ?? '0'),
      message: map['latest_message'] ?? '',
      datetime: DateTime.parse(map['datetime']),
      sentByMe: map['sent_by_me'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatList.fromJson(String source) => 
    ChatList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatList(userEmail: $userEmail, userFullName: $userFullName, userImage: $userImage, userId: $userId, myId: $myId, message: $message, datetime: $datetime, sentByMe: $sentByMe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatList &&
      other.userEmail == userEmail &&
      other.userFullName == userFullName &&
      other.userImage == userImage &&
      other.userId == userId &&
      other.myId == myId &&
      other.message == message &&
      other.datetime == datetime &&
      other.sentByMe == sentByMe;
  }

  @override
  int get hashCode {
    return userEmail.hashCode ^
      userFullName.hashCode ^
      userImage.hashCode ^
      userId.hashCode ^
      myId.hashCode ^
      message.hashCode ^
      datetime.hashCode ^
      sentByMe.hashCode;
  }
}
