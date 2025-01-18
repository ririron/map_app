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

_$UserTaskImpl _$$UserTaskImplFromJson(Map<String, dynamic> json) =>
    _$UserTaskImpl(
      taskOwner: (json['taskOwner'] as num).toInt(),
      name: json['name'] as String,
      sp: (json['sp'] as num).toInt(),
    );

Map<String, dynamic> _$$UserTaskImplToJson(_$UserTaskImpl instance) =>
    <String, dynamic>{
      'taskOwner': instance.taskOwner,
      'name': instance.name,
      'sp': instance.sp,
    };

_$TaskLogImpl _$$TaskLogImplFromJson(Map<String, dynamic> json) =>
    _$TaskLogImpl(
      taskOwner: (json['taskOwner'] as num).toInt(),
      taskId: (json['taskId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      remain: (json['remain'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskLogImplToJson(_$TaskLogImpl instance) =>
    <String, dynamic>{
      'taskOwner': instance.taskOwner,
      'taskId': instance.taskId,
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'remain': instance.remain,
    };
