import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'user_exercise_table.dart';

/// One row per user-exercise per day — **the chart source**. Charts never
/// scan raw set logs. Written once by the finish pipeline; upserted when the
/// same exercise is trained twice in a day. Units are canonical imperial.
@DataClassName('HistoryStatsRollupRow')
class HistoryStatsRollupTable extends Table {
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();

  /// Local-midnight epoch-ms of the training day.
  IntColumn get dayEpoch => integer()();

  IntColumn get setCount => integer().withDefault(const Constant(0))();
  RealColumn get totalVolume => real().withDefault(const Constant(0))();
  IntColumn get totalReps => integer().withDefault(const Constant(0))();
  RealColumn get maxWeight => real().nullable()();
  RealColumn get minWeight => real().nullable()();
  RealColumn get oneRepMax => real().nullable()();
  IntColumn get totalDurationSeconds => integer().nullable()();
  RealColumn get totalDistance => real().nullable()();
  RealColumn get maxSpeed => real().nullable()();
  RealColumn get avgSpeed => real().nullable()();

  @override
  Set<Column> get primaryKey => {userExerciseId, dayEpoch};
}
