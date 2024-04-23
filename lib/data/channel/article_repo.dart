import 'dart:io';

import 'package:dio/dio.dart';
import 'package:femmecare/constant/apis.dart';
import 'package:femmecare/data/channel/article_model.dart';
import 'package:femmecare/utils/shared_preferences.dart';

class ArticleListRepo{
  final Dio dio = Dio();

  Future<void> addArticle(
    {
      required String title,
      required String description,
      required File? Image
    }
  )async{
    final token = await SharedUtils.getToken();

    try{
      FormData formData = FormData.fromMap({
        'article_heading': title,
        'article_description': description,
        'Image': await MultipartFile.fromFile(Image!.path),
      });
      print(Image);
      final response = await dio.post(AppUrls.articleAdd,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: formData);
      print(response);
    }
    catch(error){
      print(error);
    }
  }
  Future<List<ArticleListModel>> getArticleList() async {
    final token = await SharedUtils.getToken();

    final response = await dio.get(
      AppUrls.articleList,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

      print(response.data);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      print("response 200");
      List<ArticleListModel> articlelist_data = [];
      for (int i = 0; i < data.length; i++) {
        print("inloop");
        ArticleListModel item =
            ArticleListModel.fromMap(data[i] as Map<String, dynamic>);
        articlelist_data.add(item);
        print("added");

      }     
      return articlelist_data;
    } else {
      print("error");
      throw Exception('Failed to load chat list');
    }
  }

}