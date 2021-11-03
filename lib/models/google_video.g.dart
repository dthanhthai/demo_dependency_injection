// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleVideo _$GoogleVideoFromJson(Map<String, dynamic> json) => GoogleVideo(
      json['category'] as String,
      (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoogleVideoToJson(GoogleVideo instance) =>
    <String, dynamic>{
      'category': instance.category,
      'videos': instance.videos,
    };
