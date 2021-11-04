// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../local/local_data.dart' as _i7;
import '../repository/videos_repository.dart' as _i4;
import '../services/api_client.dart' as _i3;
import '../services/video_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localDataModule = _$LocalDataModule();
  gh.singleton<_i3.ApiClient>(_i3.ApiClient(), dispose: (i) => i.dispose());
  gh.factory<_i4.IVideosRepository>(() => _i4.MockVideosRepository(),
      instanceName: 'MockVideosRepository');
  await gh.lazySingletonAsync<_i5.SharedPreferences>(
      () => localDataModule.prefs,
      preResolve: true);
  gh.singleton<_i6.VideoService>(_i6.VideoService.create(get<_i3.ApiClient>()));
  gh.factory<_i4.IVideosRepository>(
      () => _i4.VideosRepository(
          videoService: get<_i6.VideoService>(),
          prefs: get<_i5.SharedPreferences>()),
      instanceName: 'VideosRepository');
  return get;
}

class _$LocalDataModule extends _i7.LocalDataModule {}
