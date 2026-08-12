import 'package:drift/drift.dart';

import 'user_exercise_table.dart';

@DataClassName('CardioProfileRow')
class CardioProfileTable extends Table {
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();

  /// CardioModality.name.
  TextColumn get cardioModality => text()();
  RealColumn get baselineSpeed => real().nullable()();
  RealColumn get baselineDistance => real().nullable()();
  IntColumn get baselineDurationSeconds => integer().nullable()();
  IntColumn get baselineReps => integer().nullable()();

  @override
  Set<Column> get primaryKey => {userExerciseId};
}
