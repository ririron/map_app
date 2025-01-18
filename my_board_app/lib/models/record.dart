import 'package:freezed_annotation/freezed_annotation.dart';

part "record.freezed.dart";
part 'record.g.dart';

// djangoではdjango_filterでユーザーidとtaskによるフィルタリングを考える

@freezed
class Record with _$Record {
  const factory Record({
    required int userId,
    required DateTime date,
    required String task,
    required int sp,
  }) = _Record;

  factory Record.fromJson(Map<String, Object?> json) => _$RecordFromJson(json);
}

@freezed
class UserTask with _$UserTask {
  const factory UserTask({
    required int taskOwner,
    required String name,
    required int sp,
  }) = _UserTask;

  factory UserTask.fromJson(Map<String, Object?> json) =>
      _$UserTaskFromJson(json);
}

@freezed
class TaskLog with _$TaskLog {
  const factory TaskLog({
    required int taskOwner,
    required int taskId,
    required DateTime date,
    required String name,
    required int remain,
  }) = _TaskLog;

  factory TaskLog.fromJson(Map<String, Object?> json) =>
      _$TaskLogFromJson(json);
}
