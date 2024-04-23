// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileList {
  final int userId;
  final String first_name;
  final String last_name;
  final String username;
  final String address;
  final String phone_number;
  final String email;
  final String profileImage;
  final String user_type;
  ProfileList({
    required this.userId,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.address,
    required this.phone_number,
    required this.email,
    required this.profileImage,
    required this.user_type,
  });

  ProfileList copyWith({
    int? userId,
    String? first_name,
    String? last_name,
    String? username,
    String? address,
    String? phone_number,
    String? email,
    String? profileImage,
    String? user_type,
  }) {
    return ProfileList(
      userId: userId ?? this.userId,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      username: username ?? this.username,
      address: address ?? this.address,
      phone_number: phone_number ?? this.phone_number,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      user_type: user_type ?? this.user_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'address': address,
      'phone_number': phone_number,
      'email': email,
      'profileImage': profileImage,
      'user_type': user_type,
    };
  }

  factory ProfileList.fromMap(Map<String, dynamic> map) {
    return ProfileList(
      userId: map['userId'] as int,
      first_name: map['first_name'] as String,
      last_name: map['last_name'] as String,
      username: map['username'] as String,
      address: map['address'] as String,
      phone_number: map['phone_number'] as String,
      email: map['email'] as String,
      profileImage: map['profileImage'] as String,
      user_type: map['user_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileList.fromJson(String source) => 
    ProfileList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileList(userId: $userId, first_name: $first_name, last_name: $last_name, username: $username, address: $address, phone_number: $phone_number, email: $email, profileImage: $profileImage, user_type: $user_type)';
  }

  @override
  bool operator ==(covariant ProfileList other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.username == username &&
      other.address == address &&
      other.phone_number == phone_number &&
      other.email == email &&
      other.profileImage == profileImage &&
      other.user_type == user_type;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      username.hashCode ^
      address.hashCode ^
      phone_number.hashCode ^
      email.hashCode ^
      profileImage.hashCode ^
      user_type.hashCode;
  }
}
