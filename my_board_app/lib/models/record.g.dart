// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordImpl _$$RecordImplFromJson(Map<String, dynamic> json) => _$RecordImpl(
      userId: (json['userId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      task: json['task'] as String,
      sp: (json['sp'] as num).toInt(),
    );

Map<String, dynamic> _$$RecordImplToJson(_$RecordImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'task': instance.task,
      'sp': instance.sp,
    };
