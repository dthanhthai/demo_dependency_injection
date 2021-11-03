// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['description'] as String,
      json['card'] as String,
      json['background'] as String,
      json['title'] as String,
      json['studio'] as String,
      (json['sources'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'description': instance.description,
      'card': instance.card,
      'background': instance.background,
      'title': instance.title,
      'studio': instance.studio,
      'sources': instance.sources,
    };
