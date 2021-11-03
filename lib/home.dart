import 'package:demo_dependency_injection/di/injection.dart';
import 'package:demo_dependency_injection/repository/videos_repository.dart';
import 'package:demo_dependency_injection/services/api_client.dart';
import 'package:demo_dependency_injection/services/video_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/use_case_result.dart';
import 'models/video.dart';
import 'models/videos_response.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Dependency Injection"),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<UseCaseResult<VideosResponse>> _buildBody(
      BuildContext context) {
    // ApiClient client = ApiClient();
    // VideoService service = VideoService.create(client);
    // IVideosRepository repository = VideosRepository(videoService: service);
    return FutureBuilder<UseCaseResult<VideosResponse>>(
      future: getIt.get<IVideosRepository>(instanceName: (VideosRepository).toString()).getVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          if (snapshot.data!.status == RequestStatus.success) {
            final videos = snapshot.data!.data;
            return _buildVideosList(context, videos!);
          } else {
            return Text(snapshot.data!.exception.toString());
          }
        } else {
          // Show a loading indicator while waiting for the movies
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildVideosList(
      BuildContext context, VideosResponse videosResponse) {
    List<Video> videos = videosResponse.googleVideos[0].videos;
    return ListView.builder(
      itemCount: videos.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(videos[index].title),
          ),
        );
      },
    );
  }
}
