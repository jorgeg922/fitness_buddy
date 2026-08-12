import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'exercise_performance_log_table.dart';

/// One shape for every modality: all five metric columns nullable. Which
/// fields are meaningful is decided by the modality enum, not the schema.
/// Stored units are canonical imperial (lb, mi, mph).
@DataClassName('SetLogRow')
class SetLogTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get exercisePerformanceLogId => text().references(
      ExercisePerformanceLogTable, #id,
      onDelete: KeyAction.cascade)();
  IntColumn get setNumber => integer()();
  RealColumn get weight => real().nullable()();
  IntColumn get reps => integer().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get distance => real().nullable()();
  RealColumn get speed => real().nullable()();
  IntColumn get restTimeSeconds => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {exercisePerformanceLogId, setNumber},
      ];
}
