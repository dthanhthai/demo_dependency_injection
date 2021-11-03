import 'package:demo_dependency_injection/repository/videos_repository.dart';
import 'package:demo_dependency_injection/services/api_client.dart';
import 'package:demo_dependency_injection/services/video_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: ApiClient()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<ApiClient, VideoService>(
    update: (context, apiClient, videoService) =>
        VideoService.create(apiClient),
    dispose: (context, videoService) => videoService.client.dispose(),
  ),
  ProxyProvider<VideoService, VideosRepository>(
    update: (context, videoService, videoRepository) =>
        VideosRepository(videoService: videoService),
  ),
];
