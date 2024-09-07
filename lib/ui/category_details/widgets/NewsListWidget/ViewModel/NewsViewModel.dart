import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/model/NewsResponse/Articles.dart';

import '../../../../../api/api_manager.dart';

class NewsViewModel extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  List<Article>? articles;
  loadNews(String sourceId)async{
    isLoading = true;
    errorMessage = null;
    articles = null;
    notifyListeners();
    try{
      var newsResponse = await ApiManager.getNews(sourceId);
      if(newsResponse.status == "error"){
        isLoading = false;
        errorMessage = newsResponse.message;
        notifyListeners();
      }else{
        isLoading = false;
        articles = newsResponse.articles;
        notifyListeners();
      }
    }catch(error){
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }

  }

}