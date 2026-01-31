// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_News _$NewsFromJson(Map<String, dynamic> json) => _News(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  shortTitle: json['shortTitle'] as String,
  slug: json['slug'] as String,
  summary: json['summary'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$NewsToJson(_News instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'shortTitle': instance.shortTitle,
  'slug': instance.slug,
  'summary': instance.summary,
  'createdAt': instance.createdAt.toIso8601String(),
};
