import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'routine_table.dart';

/// Append-only history: one row per finished session. The name snapshot keeps
/// history readable after the routine is deleted.
@DataClassName('WorkoutLogRow')
class WorkoutLogTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get routineId => text()
      .nullable()
      .references(RoutineTable, #id, onDelete: KeyAction.setNull)();
  TextColumn get routineNameSnapshot => text().nullable()();
  BoolColumn get isAdhoc => boolean().withDefault(const Constant(false))();
  IntColumn get performedAt => integer()();
  IntColumn get durationSeconds => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
