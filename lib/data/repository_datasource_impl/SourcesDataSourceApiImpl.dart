import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/data/api/api_manager.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/Source.dart';
import 'package:news_app_c11_maadi/data/repository_datasource/SourcesDataSource.dart';
@Named("api")
@Injectable(as: SourcesDataSource)
class SourceDataSourceApiImpl extends SourcesDataSource{
  ApiManager apiManager;

  @factoryMethod
  SourceDataSourceApiImpl(this.apiManager);
  @override
  Future<Either<List<Source>? , String>> getSources(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    if(response.status=="error"){
      return Right(response.message!);
    }else{
      var box = await Hive.openBox("sources");
      box.put(categoryId, response.toJson());
      box.close();
      return Left(response.sources);
    }
  }

}