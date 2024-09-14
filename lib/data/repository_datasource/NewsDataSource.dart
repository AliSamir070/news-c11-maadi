// interface : abstract class without attributes and all functions are abstract

import 'package:dartz/dartz.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';

abstract class NewsDataSource{
  Future<Either<List<Article>?,String>> getNews(String sourceId);
}