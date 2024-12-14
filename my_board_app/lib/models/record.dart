import 'package:freezed_annotation/freezed_annotation.dart';

part "record.freezed.dart";
part 'record.g.dart';

// 一つのDBですべての記録を管理
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
