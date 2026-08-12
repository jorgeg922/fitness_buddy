import 'package:drift/drift.dart';

import 'user_exercise_table.dart';

/// Exactly one of strength/cardio profile exists per user-exercise.
@DataClassName('StrengthProfileRow')
class StrengthProfileTable extends Table {
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();

  /// StrengthModality.name.
  TextColumn get strengthModality => text()();
  RealColumn get baselineWeight => real().nullable()();
  IntColumn get baselineReps => integer().nullable()();
  IntColumn get baselineDurationSeconds => integer().nullable()();
  RealColumn get volumeMultiplier => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {userExerciseId};
}
