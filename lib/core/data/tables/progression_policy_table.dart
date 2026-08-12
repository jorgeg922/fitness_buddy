import 'package:drift/drift.dart';

import 'user_exercise_table.dart';

/// Auto-progression: "add 5 lb every N completions". One per user-exercise.
@DataClassName('ProgressionPolicyRow')
class ProgressionPolicyTable extends Table {
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();
  BoolColumn get autoIncrementEnabled =>
      boolean().withDefault(const Constant(false))();
  IntColumn get autoIncrementInterval =>
      integer().withDefault(const Constant(3))();
  RealColumn get weightDelta => real().withDefault(const Constant(5.0))();
  IntColumn get repsDelta => integer().withDefault(const Constant(1))();
  IntColumn get durationDeltaSeconds =>
      integer().withDefault(const Constant(15))();
  RealColumn get distanceDelta => real().withDefault(const Constant(0.25))();
  RealColumn get speedDelta => real().withDefault(const Constant(0.5))();

  @override
  Set<Column> get primaryKey => {userExerciseId};
}
