import 'package:drift/drift.dart';

import 'app_user_table.dart';

/// The heatmap source. Day-grained (unlike the blueprint's lifetime grain) so
/// it can answer "last 7 days" and arbitrary date ranges. One upsert per body
/// part touched per training day, written by the finish pipeline. Read-time
/// expansion to the 29 Rive muscles happens in the heatmap feature.
@DataClassName('MuscleUsageDailyRow')
class MuscleUsageDailyTable extends Table {
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();

  /// BodyPart.name.
  TextColumn get bodyPart => text()();

  /// Local-midnight epoch-ms of the training day.
  IntColumn get dayEpoch => integer()();

  IntColumn get setsCount => integer().withDefault(const Constant(0))();

  /// Σ working sets × modality volume factor — the heat weight.
  RealColumn get score => real().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {userId, bodyPart, dayEpoch};
}
