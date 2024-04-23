import 'dart:io';
import 'package:dio/dio.dart';
import 'package:femmecare/data/channel/article_model.dart';
import 'package:femmecare/data/channel/article_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'article_state.dart';
part 'article_event.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState>{
  ArticleBloc(): super(ArticleListInitial()){
    on<ArticleEvent>((event, emit) => getArticleList(event, emit));
  }
  void getArticleList(ArticleEvent event, Emitter<ArticleState>emit) async {
    if (event is ArticlePageOpened){
      emit (ArticleListLoading());
      try{
        print("IN BLOC");
        List<ArticleListModel> articleList =await ArticleListRepo().getArticleList();
        print("bloc");
        emit(ArticleListSuccess(articleList: articleList));
      }
      catch(error){
        if(error is DioException){
          if(error.response != null){
            final statusCode = error.response!.statusCode;
            if (statusCode == 522){
              emit(ArticleListFailure(error: 'Connection timed out. Please try again later.'));
            }
            else if(statusCode == 401){
              emit(TokenExpired());
            }
            else{
              emit(ArticleListFailure(error: error.response?.data["message"][0]));
            }
          }else{
            print(error);
            emit(ArticleListFailure(error: "Something went wrong, please try again laterrrrrrrrr."));
          }
          
        }
        print(error);
        emit(ArticleListFailure(error: "Something went wrong, please try again later."));
      }
    }
    else if (event is PostArticle){
      emit (ArticleListLoading());
      try{
        print("in bloc");
        await ArticleListRepo().addArticle(
          description: event.description,
          title: event.title,
          Image: event.Image,
          );
          print("bloc");
          emit(ArticlePostSuccess());
      }
      catch(error){
        if(error is DioException){
                    if (error.response != null) {
            final statusCode = error.response!.statusCode;
            if (statusCode == 522) {
              emit(ArticleListFailure(
                  error: 'Connection timed out. Please try again later.'));
            } else if (statusCode == 401) {
              emit(TokenExpired());
            } else {
              emit(ArticleListFailure(error: error.response?.data["message"][0]));
            }
          } else {
            emit(ArticleListFailure(
                error: "Something went wrong, please try again later."));
          }
        } else {
          emit(ArticleListFailure(
              error: "Something went wrong, please try again laterrrr."));
        }
      }
        }
      }
    }
  
