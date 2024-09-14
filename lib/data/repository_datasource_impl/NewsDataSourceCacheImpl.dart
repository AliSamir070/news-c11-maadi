import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/NewsResponse.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/NewsDataSource.dart';
@Named("cache")
@Singleton(as: NewsDataSource)
class NewsDataSourceCacheImpl extends NewsDataSource{
  @override
  Future<Either<List<Article>?,String>> getNews(String sourceId) async{
    var box = await Hive.openBox("articles");
    NewsResponse response = box.get(sourceId);
    return Left(response.articles);
  }

}