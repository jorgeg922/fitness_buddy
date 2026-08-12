import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'exercise_table.dart';

/// The per-user "subscription" row. **userExerciseId — not exerciseId — is the
/// FK used by routines, logs, and stats.**
@DataClassName('UserExerciseRow')
class UserExerciseTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get exerciseId =>
      text().references(ExerciseTable, #id, onDelete: KeyAction.cascade)();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get lastPerformedAt => integer().nullable()();
  IntColumn get createdAt => integer()();
  TextColumn get notes => text().nullable()();

  /// Soft delete — history that references this row stays intact.
  IntColumn get deletedOn => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {userId, exerciseId},
      ];
}
