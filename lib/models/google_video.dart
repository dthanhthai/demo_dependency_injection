import 'package:demo_dependency_injection/models/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'google_video.g.dart';

@JsonSerializable()
class GoogleVideo {

  @JsonKey(name: 'category')
  String category;
  @JsonKey(name: 'videos')
  List<Video> videos;

  GoogleVideo(this.category, this.videos);

  factory GoogleVideo.fromJson(Map<String, dynamic> json) => _$GoogleVideoFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleVideoToJson(this);
}