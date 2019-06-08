// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['by'] as String,
      json['descendants'] as int,
      json['id'] as int,
      json['score'] as int,
      json['time'] as int,
      json['title'] as String,
      json['type'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
