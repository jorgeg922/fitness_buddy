import 'package:drift/drift.dart';

import 'app_user_table.dart';

@DataClassName('UserOverallStatsRow')
class UserOverallStatsTable extends Table {
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get totalWorkouts => integer().withDefault(const Constant(0))();
  RealColumn get totalVolume => real().withDefault(const Constant(0))();
  RealColumn get totalDistance => real().withDefault(const Constant(0))();
  IntColumn get totalSets => integer().withDefault(const Constant(0))();
  IntColumn get totalDurationSeconds =>
      integer().withDefault(const Constant(0))();
  IntColumn get totalExercisesPerformed =>
      integer().withDefault(const Constant(0))();
  IntColumn get strongestDayEpoch => integer().nullable()();
  RealColumn get strongestDayVolume => real().withDefault(const Constant(0))();
  IntColumn get longestDayEpoch => integer().nullable()();
  IntColumn get longestDayDurationSeconds =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {userId};
}
