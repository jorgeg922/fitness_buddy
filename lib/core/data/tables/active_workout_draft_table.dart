import 'package:drift/drift.dart';

import '../structs/json_map_converter.dart';
import 'app_user_table.dart';

/// Ephemeral in-progress workout — deliberately separate from history.
/// One row per in-progress exercise; payload is `{sets:[…], is_skipped,
/// is_completed}`. Upserted on conflict of userExerciseId; wiped on
/// finish/discard. Powers crash recovery.
@DataClassName('ActiveWorkoutDraftRow')
class ActiveWorkoutDraftTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();

  /// Routine id, or the 'ad-hoc' sentinel.
  TextColumn get routineId => text()();
  TextColumn get userExerciseId => text().unique()();
  IntColumn get startedAt => integer()();
  TextColumn get payloadJson => text().map(const JsonMapConverter())();
}
