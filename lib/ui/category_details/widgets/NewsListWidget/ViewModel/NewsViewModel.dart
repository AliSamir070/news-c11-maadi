import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/repository/NewsRepository.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../../data/model/NewsResponse/Articles.dart';

@injectable
class NewsViewModel extends Cubit<NewsStates> {
  @factoryMethod
  NewsViewModel(this.newsRepository) : super(NewsInitialState());
  NewsRepository newsRepository;

  loadArticles(String sourceId) async {
    emit(NewsLoadingState());
    try {
      var result = await newsRepository.getNews(sourceId);
      result.fold((articles) {
        emit(NewsSuccessState(articles??[]));
      }, (error) {
        emit(NewsErrorState(error));
      });
      /*var newsResponse = await ApiManager.getNews(sourceId);
      if(newsResponse.status=="error"){
        emit(NewsErrorState(newsResponse.message!));
      }else{
        emit(NewsSuccessState(newsResponse.articles??[]));
      }*/
    } catch (error) {
      emit(NewsErrorState(error.toString()));
    }
  }
}

sealed class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {
  List<Article> articles;

  NewsSuccessState(this.articles);
}

class NewsErrorState extends NewsStates {
  String error;

  NewsErrorState(this.error);
}
