import 'package:demo_dependency_injection/models/google_video.dart';
import 'package:demo_dependency_injection/models/use_case_result.dart';
import 'package:demo_dependency_injection/models/video.dart';
import 'package:demo_dependency_injection/models/videos_response.dart';
import 'package:demo_dependency_injection/services/video_service.dart';
import 'package:demo_dependency_injection/services/video_service.dart';
import 'package:injectable/injectable.dart';


abstract class IVideosRepository {
  Future<UseCaseResult<VideosResponse>> getVideos();
}

@named
@Injectable(as: IVideosRepository)
class MockVideosRepository implements IVideosRepository {
  const MockVideosRepository();

  @override
  Future<UseCaseResult<VideosResponse>> getVideos() async {
    await Future.delayed(const Duration(seconds: 3));
    var result = VideosResponse([
      GoogleVideo("Test Category", [
        Video("", "", "", "Test Title 1", "", []),
        Video("", "", "", "Test Title 2", "", [])
      ])
    ]);
    return Future.value(UseCaseResult.success(result));
  }
}

@named
@Injectable(as: IVideosRepository)
class VideosRepository implements IVideosRepository {
  final VideoService _videoService;

  VideosRepository({required VideoService videoService}) : _videoService = videoService;

  @override
  Future<UseCaseResult<VideosResponse>> getVideos() async {
    await Future.delayed(const Duration(seconds: 1));
    var response = await _videoService.getVideos();
    if (response.isSuccessful) {
      return Future.value(UseCaseResult.success(response.body!));
    } else {
      return Future.value(UseCaseResult.error(response.error!));
    }
  }
}
