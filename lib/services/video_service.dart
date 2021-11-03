import 'package:chopper/chopper.dart';
import 'package:demo_dependency_injection/models/videos_response.dart';
import 'package:demo_dependency_injection/services/api_client.dart';
import 'package:injectable/injectable.dart';

part 'video_service.chopper.dart';

@singleton
@ChopperApi()
abstract class VideoService extends ChopperService {
  @Get(path: 'android-tv/android_tv_videos_new.json')
  Future<Response<VideosResponse>> getVideos();

  @factoryMethod
  static VideoService create([ApiClient? apiClient]) {
    return _$VideoService(apiClient?.chopperClient);
  }
}
