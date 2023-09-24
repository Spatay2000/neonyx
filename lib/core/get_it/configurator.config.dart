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
import 'package:neonyx/core/shared/cache.dart' as _i4;
import 'package:neonyx/core/shared/cache_impl.dart' as _i5;
import 'package:neonyx/core/shared/http.dart' as _i18;
import 'package:neonyx/core/shared/http_client_impl.dart' as _i19;
import 'package:neonyx/core/utils/navigation_service.dart' as _i12;
import 'package:neonyx/data/datasource/local/chat_local_datasource.dart' as _i6;
import 'package:neonyx/data/repository/chat_repository_impl.dart' as _i8;
import 'package:neonyx/domain/repository/chat_repository.dart' as _i7;
import 'package:neonyx/domain/usecase/chat_usecases/get_chat_usecase.dart'
    as _i10;
import 'package:neonyx/domain/usecase/chat_usecases/send_audio_usecase.dart'
    as _i13;
import 'package:neonyx/domain/usecase/chat_usecases/send_image_usecase.dart'
    as _i14;
import 'package:neonyx/domain/usecase/chat_usecases/send_message_usecase.dart'
    as _i15;
import 'package:neonyx/features/bottom_sheet_contents/add_photo_content/bloc/add_photo_bloc.dart'
    as _i3;
import 'package:neonyx/features/chat/bloc/chat_details_bloc/chat_details_bloc.dart'
    as _i17;
import 'package:neonyx/features/cloud/bloc/bloc/cloud_index_bloc.dart' as _i9;
import 'package:neonyx/features/index/bloc/bloc/index_bloc.dart' as _i11;
import 'package:neonyx/features/user_space/bloc/user_space_bloc.dart' as _i16;

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
    gh.factory<_i3.AddPhotoBloc>(() => _i3.AddPhotoBloc());
    gh.factory<_i4.Cache>(() => _i5.CacheImpl());
    gh.lazySingleton<_i6.ChatLocalDataSource>(
        () => _i6.ChatLocalDataSourceImpl());
    gh.lazySingleton<_i7.ChatRepository>(() =>
        _i8.ChatRepositoryImpl(localDataSource: gh<_i6.ChatLocalDataSource>()));
    gh.factory<_i9.CloudIndexBloc>(() => _i9.CloudIndexBloc());
    gh.lazySingleton<_i10.GetChatUseCase>(
        () => _i10.GetChatUseCase(repository: gh<_i7.ChatRepository>()));
    gh.factory<_i11.IndexNavBloc>(() => _i11.IndexNavBloc());
    gh.lazySingleton<_i12.NavigationService>(() => _i12.NavigationService());
    gh.lazySingleton<_i13.SendAudioUseCase>(
        () => _i13.SendAudioUseCase(repository: gh<_i7.ChatRepository>()));
    gh.lazySingleton<_i14.SendImageUseCase>(
        () => _i14.SendImageUseCase(repository: gh<_i7.ChatRepository>()));
    gh.lazySingleton<_i15.SendMessageUseCase>(
        () => _i15.SendMessageUseCase(repository: gh<_i7.ChatRepository>()));
    gh.factory<_i16.UserSpaceBloc>(() => _i16.UserSpaceBloc());
    gh.factory<_i17.ChatDetailsBloc>(() => _i17.ChatDetailsBloc(
          getChatUseCase: gh<_i10.GetChatUseCase>(),
          sendMessageUseCase: gh<_i15.SendMessageUseCase>(),
          sendAudioUseCase: gh<_i13.SendAudioUseCase>(),
          sendImageUseCase: gh<_i14.SendImageUseCase>(),
        ));
    gh.factory<_i18.Http>(() => _i19.HttpImpl(
          cache: gh<_i4.Cache>(),
          navigationService: gh<_i12.NavigationService>(),
        ));
    return this;
  }
}
