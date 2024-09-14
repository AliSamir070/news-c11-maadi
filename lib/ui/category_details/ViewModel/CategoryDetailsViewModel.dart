import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_c11_maadi/repository/SourcesRepository.dart';

import '../../../data/api/api_manager.dart';
import '../../../data/model/SourcesResponse/Source.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesStates>{
  @factoryMethod
  CategoriesViewModel(this.repository):super(CategoriesInitialState());
  SourcesRepository repository;
  loadSources(String categoryId)async{
    emit(CategoriesLoadingState());
    try{
      var result = await repository.getSources(categoryId);
      result.fold((sources){
        emit(CategoriesSuccessState(sources??[]));
      }, (error){
        emit(CategoriesErrorState(error));
      });
      /*var sourcesResponse = await ApiManager.getSources(categoryId);
      if(sourcesResponse.status=="error"){
        emit(CategoriesErrorState(sourcesResponse.message!));
      }else{
        emit(CategoriesSuccessState(sourcesResponse.sources??[]));
      }*/
    }catch(error){
      emit(CategoriesErrorState(error.toString()));
    }
  }
}

sealed class CategoriesStates{}
class CategoriesInitialState extends CategoriesStates{}
class CategoriesLoadingState extends CategoriesStates{}
class CategoriesErrorState extends CategoriesStates{
  String error;
  CategoriesErrorState(this.error);
}
class CategoriesSuccessState extends CategoriesStates{
  List<Source> sources;
  CategoriesSuccessState(this.sources);
}