part of 'article_bloc.dart';

abstract class ArticleState{}

final class ArticleListInitial extends ArticleState{}

final class ArticleListLoading extends ArticleState{}

final class ArticleListSuccess extends ArticleState{
  final List<ArticleListModel> articleList;

  ArticleListSuccess({required this.articleList});
}

final class ArticleListFailure extends ArticleState{
  final String error;

  ArticleListFailure({required this.error});
}

final class TokenExpired extends ArticleState{}

final class ArticlePostSuccess extends ArticleState{
  ArticlePostSuccess();
}


