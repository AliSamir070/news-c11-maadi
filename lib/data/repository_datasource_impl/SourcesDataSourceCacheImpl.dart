import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/Source.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/SourcesResponse.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/SourcesDataSource.dart';
@Named("cache")
@Singleton(as: SourcesDataSource)
class SourcesDataSourceCacheImpl extends SourcesDataSource{
  @override
  Future<Either<List<Source>? , String>> getSources(String categoryId) async{
    var box = await Hive.openBox("sources");
    SourcesResponse response = SourcesResponse.fromJson(box.get(categoryId));
    box.close();
    return Left(response.sources);
  }

}