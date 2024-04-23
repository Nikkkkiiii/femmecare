part of 'article_bloc.dart';

abstract class ArticleEvent{}

class ArticlePageOpened extends ArticleEvent{
  ArticlePageOpened();
}

class PostArticle extends ArticleEvent{
  final String title;
  final String description;
  final File? Image;

  PostArticle(
    {required this.title, required this.description, required this.Image}
  );
}