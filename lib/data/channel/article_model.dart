// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArticleListModel {
  final int article_id;
  final String article_title;
  final String article_content;
  final DateTime article_date;
  final String Image;
  final String user_name;
  final int user_id;

  ArticleListModel({
    required this.article_id,
    required this.article_title,
    required this.article_content,
    required this.article_date,
    required this.Image,
    required this.user_name,
    required this.user_id,
  });

  ArticleListModel copyWith({
    int? article_id,
    String? article_title,
    String? Image,
    String? article_content,
    DateTime? article_date,
    String? user_name,
    int? user_id,
  }) {
    return ArticleListModel(
      article_id: article_id ?? this.article_id,
      article_title: article_title ?? this.article_title,
      Image: Image ?? this.Image,
      article_content: article_content ?? this.article_content,
      article_date: article_date ?? this.article_date,
      user_name: user_name ?? this.user_name,
      user_id: user_id ?? this.user_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'article_id': article_id,
      'article_title': article_title,
      'article_content': article_content,
      'Image': Image,
      'article_date': article_date.millisecondsSinceEpoch,
      'user_name': user_name,
      'user_id': user_id,
    };
  }

  factory ArticleListModel.fromMap(Map<String, dynamic> map) {
    return ArticleListModel(
      article_id: map['article_id'].toInt() ?? 0,
      article_title: map['article_title'] as String,
      Image: map['Image'] as String,
      article_content: map['article_content'] as String,
      article_date: DateTime.parse(map['article_date']),
      user_name: map['user_name'] as String,
      user_id: int.parse(map['user_id']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleListModel.fromJson(String source) => ArticleListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleListModel(article_id: $article_id, article_title: $article_title, article_content: $article_content, article_date: $article_date, Image: $Image, user_name: $user_name, user_id: $user_id)';
  }

  @override
  bool operator ==(covariant ArticleListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.article_id == article_id &&
      other.article_title == article_title &&
      other.article_content == article_content &&
      other.article_date == article_date &&
      other.Image == Image &&
      other.user_name == user_name &&
      other.user_id == user_id;
  }

  @override
  int get hashCode {
    return article_id.hashCode ^
      article_title.hashCode ^
      article_content.hashCode ^
      article_date.hashCode ^
      Image.hashCode^
      user_name.hashCode ^
      user_id.hashCode;
  }
}
