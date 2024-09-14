import 'package:dartz/dartz.dart';

import '../data/model/SourcesResponse/Source.dart';

abstract class SourcesRepository{
  Future<Either<List<Source>? , String>> getSources(String categoryId);
}