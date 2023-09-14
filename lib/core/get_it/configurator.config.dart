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
import 'package:neonyx/core/shared/http.dart' as _i16;
import 'package:neonyx/core/shared/http_client_impl.dart' as _i17;
import 'package:neonyx/core/utils/navigation_service.dart' as _i11;
import 'package:neonyx/data/datasource/local/chat_local_datasource.dart' as _i5;
import 'package:neonyx/data/repository/chat_repository_impl.dart' as _i7;
import 'package:neonyx/domain/repository/chat_repository.dart' as _i6;
import 'package:neonyx/domain/usecase/chat_usecases/get_chat_usecase.dart'
    as _i9;
import 'package:neonyx/domain/usecase/chat_usecases/send_audio_usecase.dart'
    as _i12;
import 'package:neonyx/domain/usecase/chat_usecases/send_message_usecase.dart'
    as _i13;
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_bloc.dart'
    as _i15;
import 'package:neonyx/features/cloud/bloc/bloc/cloud_index_bloc.dart' as _i8;
import 'package:neonyx/features/index/bloc/bloc/index_bloc.dart' as _i10;
import 'package:neonyx/features/user_space/bloc/user_space_bloc.dart' as _i14;

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
    gh.lazySingleton<_i5.ChatLocalDataSource>(
        () => _i5.ChatLocalDataSourceImpl());
    gh.lazySingleton<_i6.ChatRepository>(() =>
        _i7.ChatRepositoryImpl(localDataSource: gh<_i5.ChatLocalDataSource>()));
    gh.factory<_i8.CloudIndexBloc>(() => _i8.CloudIndexBloc());
    gh.lazySingleton<_i9.GetChatUseCase>(
        () => _i9.GetChatUseCase(repository: gh<_i6.ChatRepository>()));
    gh.factory<_i10.IndexNavBloc>(() => _i10.IndexNavBloc());
    gh.lazySingleton<_i11.NavigationService>(() => _i11.NavigationService());
    gh.lazySingleton<_i12.SendAudioUseCase>(
        () => _i12.SendAudioUseCase(repository: gh<_i6.ChatRepository>()));
    gh.lazySingleton<_i13.SendMessageUseCase>(
        () => _i13.SendMessageUseCase(repository: gh<_i6.ChatRepository>()));
    gh.factory<_i14.UserSpaceBloc>(() => _i14.UserSpaceBloc());
    gh.factory<_i15.ChatDetailsBloc>(() => _i15.ChatDetailsBloc(
          getChatUseCase: gh<_i9.GetChatUseCase>(),
          sendMessageUseCase: gh<_i13.SendMessageUseCase>(),
          sendAudioUseCase: gh<_i12.SendAudioUseCase>(),
        ));
    gh.factory<_i16.Http>(() => _i17.HttpImpl(
          cache: gh<_i3.Cache>(),
          navigationService: gh<_i11.NavigationService>(),
        ));
    return this;
  }
}
