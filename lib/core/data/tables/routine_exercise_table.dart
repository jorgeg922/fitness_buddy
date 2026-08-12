import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'routine_table.dart';
import 'user_exercise_table.dart';

/// `id` is a unique *instance* id — the same exercise can appear twice in a
/// routine with independent history. No planned sets: prepopulation comes
/// from last performance.
@DataClassName('RoutineExerciseRow')
class RoutineExerciseTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get routineId =>
      text().references(RoutineTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get userExerciseId =>
      text().references(UserExerciseTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get exPosition => integer()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
