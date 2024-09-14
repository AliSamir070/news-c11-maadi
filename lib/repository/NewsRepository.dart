import 'package:dartz/dartz.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';

abstract class NewsRepository{
  Future<Either<List<Article>?,String>> getNews(String sourceId);
}