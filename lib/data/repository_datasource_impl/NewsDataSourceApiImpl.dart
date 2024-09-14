import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/data/api/api_manager.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/NewsDataSource.dart';

import '../model/NewsResponse/NewsResponse.dart';
@Named("api")
@Injectable(as: NewsDataSource)
class NewsDataSourceApiImpl extends NewsDataSource{
  ApiManager apiManager;
  @factoryMethod
  NewsDataSourceApiImpl(this.apiManager); //constructor injection
  @override
  Future<Either<List<Article>?,String>> getNews(String sourceId) async{
    NewsResponse newsResponse = await apiManager.getNews(sourceId);
    if(newsResponse.status=="error"){
      return Right(newsResponse.message!);
    }else{
      var box = await Hive.openBox("articles");
      box.put(sourceId, newsResponse);
      box.close();
      return Left(newsResponse.articles);
    }
  }

}