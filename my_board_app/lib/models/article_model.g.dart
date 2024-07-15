// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      text: json['text'] as String,
      goodNum: (json['goodNum'] as num).toInt(),
      badNum: (json['badNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'text': instance.text,
      'goodNum': instance.goodNum,
      'badNum': instance.badNum,
    };
