// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:neonyx/core/shared/cache.dart' as _i3;
import 'package:neonyx/core/shared/cache_impl.dart' as _i4;
import 'package:neonyx/core/shared/http.dart' as _i9;
import 'package:neonyx/core/shared/http_client_impl.dart' as _i10;
import 'package:neonyx/core/utils/navigation_service.dart' as _i7;
import 'package:neonyx/features/cloud/bloc/bloc/cloud_index_bloc.dart' as _i5;
import 'package:neonyx/features/index/bloc/bloc/index_bloc.dart' as _i6;
import 'package:neonyx/features/user_space/bloc/user_space_bloc.dart' as _i8;

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
    gh.factory<_i3.Cache>(() => _i4.CacheImpl());
    gh.factory<_i5.CloudIndexBloc>(() => _i5.CloudIndexBloc());
    gh.factory<_i6.IndexNavBloc>(() => _i6.IndexNavBloc());
    gh.lazySingleton<_i7.NavigationService>(() => _i7.NavigationService());
    gh.factory<_i8.UserSpaceBloc>(() => _i8.UserSpaceBloc());
    gh.factory<_i9.Http>(() => _i10.HttpImpl(
          cache: gh<_i3.Cache>(),
          navigationService: gh<_i7.NavigationService>(),
        ));
    return this;
  }
}
