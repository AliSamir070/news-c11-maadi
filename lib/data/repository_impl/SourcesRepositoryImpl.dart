import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/InternetChecker.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/Source.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/SourcesDataSource.dart';

import '../../repository/SourcesRepository.dart';
@Injectable(as: SourcesRepository)
class SourcesRepositoryImpl extends SourcesRepository{
  SourcesDataSource apiDataSource;
  SourcesDataSource cacheDataSource;
  @factoryMethod
  SourcesRepositoryImpl(@Named("api")this.apiDataSource,@Named("cache")this.cacheDataSource);
  @override
  Future<Either<List<Source>? , String>> getSources(String categoryId) async{
    bool isConnected = await InternetChecker.CheckNetwork();
    if(isConnected){
      return apiDataSource.getSources(categoryId);
    }else{
      return cacheDataSource.getSources(categoryId);
    }

  }

}
