import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utilities/constants.dart';
import 'news_class.dart';

class NewsApiProvider {
  final _apiKey = Constant.newsApiKey;

  Future<List<Article>?> fetchNewsList() async {
    var url =
        // "https://newsapi.org/v2//top-headlines?country=in&apiKey=cad893cb492d4a359486d1e9137f9049";
        // https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd0000010fc3dde120f34f1478fbae78e934a773&format=json&offset=0&limit=50
        "${Constant.baseUrl}${Constant.topHeadLine}?country=my&apiKey=$_apiKey";
    // print("entered Url : $url");
    final response = await http.get(Uri.parse(url));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResonse.fromJson(jsonDecode(response.body)).articles;
    } else {
      // If that call was not successful, throw an error.
      print("Exception in api call");
      throw Exception('Failed to load post');
    }
  }
}
