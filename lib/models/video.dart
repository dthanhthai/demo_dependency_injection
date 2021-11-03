import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video{
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'card')
  String card;
  @JsonKey(name: 'background')
  String background;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'studio')
  String studio;
  @JsonKey(name: 'sources')
  List<String> sources;

  Video(this.description, this.card, this.background, this.title, this.studio, this.sources);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

}