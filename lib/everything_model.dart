
import 'dart:convert';
import 'dart:math';



import 'article_model.dart';
import 'package:http/http.dart' as http;


class Everything {

  List<ArticleModel> news = [];

  Future<void> getHeadlines(String country,String category) async
  {
    // String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=f35e93dce5664f7194269655d69506c9";
    String url = "https://newsapi.org/v2/top-headlines?country={$country}&apiKey=f35e93dce5664f7194269655d69506c9&catagory={$category}";

    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['title'] != null && element['author']!=null &&element['url'] != null &&element['description'] != null &&element['publishedAt'] != null &&element['content'] != null  ) {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]
          );

          news.add(articleModel);


        }
      });
    }
  }
}
