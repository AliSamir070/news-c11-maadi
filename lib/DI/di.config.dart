// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manager.dart' as _i3;
import '../data/repository_datasource/NewsDataSource.dart' as _i4;
import '../data/repository_datasource/SourcesDataSource.dart' as _i7;
import '../data/repository_datasource_impl/NewsDataSourceApiImpl.dart' as _i5;
import '../data/repository_datasource_impl/NewsDataSourceCacheImpl.dart' as _i6;
import '../data/repository_datasource_impl/SourcesDataSourceApiImpl.dart'
    as _i8;
import '../data/repository_datasource_impl/SourcesDataSourceCacheImpl.dart'
    as _i9;
import '../data/repository_impl/NewsRepositoryImpl.dart' as _i11;
import '../data/repository_impl/SourcesRepositoryImpl.dart' as _i13;
import '../repository/NewsRepository.dart' as _i10;
import '../repository/SourcesRepository.dart' as _i12;
import '../ui/category_details/ViewModel/CategoryDetailsViewModel.dart' as _i15;
import '../ui/category_details/widgets/NewsListWidget/ViewModel/NewsViewModel.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.NewsDataSource>(
      () => _i5.NewsDataSourceApiImpl(gh<_i3.ApiManager>()),
      instanceName: 'api',
    );
    gh.singleton<_i4.NewsDataSource>(
      () => _i6.NewsDataSourceCacheImpl(),
      instanceName: 'cache',
    );
    gh.factory<_i7.SourcesDataSource>(
      () => _i8.SourceDataSourceApiImpl(gh<_i3.ApiManager>()),
      instanceName: 'api',
    );
    gh.singleton<_i7.SourcesDataSource>(
      () => _i9.SourcesDataSourceCacheImpl(),
      instanceName: 'cache',
    );
    gh.factory<_i10.NewsRepository>(() => _i11.NewsRepositoryImpl(
          gh<_i4.NewsDataSource>(instanceName: 'api'),
          gh<_i4.NewsDataSource>(instanceName: 'cache'),
        ));
    gh.factory<_i12.SourcesRepository>(() => _i13.SourcesRepositoryImpl(
          gh<_i7.SourcesDataSource>(instanceName: 'api'),
          gh<_i7.SourcesDataSource>(instanceName: 'cache'),
        ));
    gh.factory<_i14.NewsViewModel>(
        () => _i14.NewsViewModel(gh<_i10.NewsRepository>()));
    gh.factory<_i15.CategoriesViewModel>(
        () => _i15.CategoriesViewModel(gh<_i12.SourcesRepository>()));
    return this;
  }
}
