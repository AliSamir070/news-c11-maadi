import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/data/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/NewsDataSource.dart';
import 'package:news_app_c11_maadi/data/repository_datasource_impl/NewsDataSourceApiImpl.dart';
import 'package:news_app_c11_maadi/repository/NewsRepository.dart';

import '../../InternetChecker.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource apiDatasource;
  NewsDataSource cacheDatasource;
  @factoryMethod
  NewsRepositoryImpl(@Named("api")this.apiDatasource,@Named("cache") this.cacheDatasource);
  @override
  Future<Either<List<Article>?,String>> getNews(String sourceId) async{
    bool isConnected = await InternetChecker.CheckNetwork();
    if(isConnected){
      var result = await apiDatasource.getNews(sourceId);
      return result;
    }else{
      return cacheDatasource.getNews(sourceId);
    }
  }

}