import 'package:dartz/dartz.dart';
import 'package:news_app_c11_maadi/data/model/SourcesResponse/Source.dart';

abstract class SourcesDataSource{
  Future<Either<List<Source>? , String>> getSources(String categoryId);
}