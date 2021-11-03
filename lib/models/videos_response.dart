import 'package:demo_dependency_injection/models/google_video.dart';
import 'package:demo_dependency_injection/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'videos_response.g.dart';

@JsonSerializable()
class VideosResponse {

  @JsonKey(name: 'googlevideos')
  List<GoogleVideo> googleVideos;

  VideosResponse(this.googleVideos);

  factory VideosResponse.fromJson(Map<String, dynamic> json) => _$VideosResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideosResponseToJson(this);
}