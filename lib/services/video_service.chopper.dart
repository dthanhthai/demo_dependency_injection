// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$VideoService extends VideoService {
  _$VideoService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = VideoService;

  @override
  Future<Response<VideosResponse>> getVideos() {
    final $url = 'android-tv/android_tv_videos_new.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<VideosResponse, VideosResponse>($request);
  }
}
