import 'package:drift/drift.dart';

import 'app_user_table.dart';
import 'user_exercise_table.dart';

/// Append-only PR feed. Sources → SET NULL so PRs survive deletion; the name
/// snapshot keeps the feed readable.
@DataClassName('PersonalRecordEventRow')
class PersonalRecordEventTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get userExerciseId => text()
      .nullable()
      .references(UserExerciseTable, #id, onDelete: KeyAction.setNull)();
  TextColumn get exerciseNameSnapshot => text()();

  /// TrackedMetricsPr.name (e.g. 'maxWeight', 'oneRepMax').
  TextColumn get metric => text()();
  RealColumn get value => real()();
  RealColumn get previousValue => real().nullable()();
  IntColumn get achievedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
