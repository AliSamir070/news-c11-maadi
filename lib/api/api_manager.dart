import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_maadi/model/NewsResponse/NewsResponse.dart';
import 'package:news_app_c11_maadi/model/SourcesResponse/SourcesResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "d3e16e322c2e4c00b4b4f4967c290a7f";
  static Future<SourcesResponse> getSources(String categoryId)async{
    // ?=&=sports

    Uri sourcesApiUrl = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":categoryId
    });
    http.Response response = await http.get(sourcesApiUrl);
    Map<String , dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId)async{
    Uri newsUrl = Uri.https(baseUrl ,"/v2/everything" ,{
      "apiKey":apiKey,
      "sources":sourceId
    });
    http.Response response = await http.get(newsUrl);
    Map<String , dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}