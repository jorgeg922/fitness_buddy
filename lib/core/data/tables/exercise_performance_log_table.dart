import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'routine_exercise_table.dart';
import 'user_exercise_table.dart';
import 'workout_log_table.dart';

@DataClassName('ExercisePerformanceLogRow')
class ExercisePerformanceLogTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get workoutLogId =>
      text().references(WorkoutLogTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get routineExerciseId => text()
      .nullable()
      .references(RoutineExerciseTable, #id, onDelete: KeyAction.setNull)();
  BoolColumn get wasPartOfRoutine =>
      boolean().withDefault(const Constant(false))();
  IntColumn get autoIncrementCountSession => integer().nullable()();
  IntColumn get performedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
