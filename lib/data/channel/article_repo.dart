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
      required File? image
    }
  )async{
    
    final token = await SharedUtils.getToken();
    print("house");
    try{
      String fileName = image!.path.split('/').last;
      print(token);
      print("hello i ma a girl");
    print(title);
    print(description);
    print(fileName);
      FormData formData = FormData.fromMap({
        'article_heading': title,
        'article_description': description,
        'Image': await MultipartFile.fromFile(image.path, 
        filename: fileName),
      });
      print("*************8888888****************");

      formData.fields.forEach((field) {
      print("${field.key}: ${field.value}");
    });
      print(formData);
      final response = await dio.post(AppUrls.articleAdd,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: formData);
      print(response);
    }
    catch(error){
      print(error);
      throw Exception('Failed to add article');
    }
  }
  Future<List<ArticleListModel>> getArticleList() async {
    print("new thing");
    
    final token = await SharedUtils.getToken();
    // final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE2NjE4MjgzLCJpYXQiOjE3MTY2MTcwODMsImp0aSI6ImYyMTY2ZTQyOTIyYjQ2OWRiODlhYzVjZjdkNGE0OTU0IiwidXNlcl9pZCI6MjV9.530u3bE6vmIZ8m2vKFyoYwVgSqf-LkmEaZkPSyj-T58";
    print(token);
    print("object");

    final response = await dio.get(
      AppUrls.articleList,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

      print("Hello$response.data");
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      print("response 200");
      // List<ArticleListModel> articlelist_data = [];
      List<ArticleListModel> articlelist_data = data.map((item) => ArticleListModel.fromMap(item as Map<String, dynamic>)).toList();
      
      // for (int i = 0; i < data.length; i++) {
      //   print("inloop");
      //   ArticleListModel item =
      //       ArticleListModel.fromMap(data[i] as Map<String, dynamic>);
      //   articlelist_data.add(item);
      //   print("added");

      // }     
      return articlelist_data;
    } else {
      print("error");
      throw Exception('Failed to load chat list');
    }
    
    
  }

}

