import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'user_exercise_table.dart';

/// Lifetime aggregate per user-exercise, incl. all personal bests.
@DataClassName('ExerciseOverallAggregateRow')
class ExerciseOverallAggregateTable extends Table {
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();

  IntColumn get timesCompleted => integer().withDefault(const Constant(0))();
  IntColumn get firstCompletedOn => integer().nullable()();
  IntColumn get lastCompletedOn => integer().nullable()();
  RealColumn get totalVolume => real().withDefault(const Constant(0))();
  IntColumn get totalReps => integer().withDefault(const Constant(0))();
  IntColumn get totalSets => integer().withDefault(const Constant(0))();
  IntColumn get totalDurationSeconds =>
      integer().withDefault(const Constant(0))();
  RealColumn get totalDistance => real().withDefault(const Constant(0))();

  RealColumn get pbMaxWeight => real().nullable()();
  RealColumn get pbOneRepMax => real().nullable()();
  IntColumn get pbMaxRepsSet => integer().nullable()();
  RealColumn get pbMaxVolumeSession => real().nullable()();
  RealColumn get pbMaxDistance => real().nullable()();
  RealColumn get pbMaxSpeed => real().nullable()();
  IntColumn get pbMaxDurationSeconds => integer().nullable()();

  @override
  Set<Column> get primaryKey => {userExerciseId};
}
