import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/taxonomy/body_part.dart';
import '../../heatmap/models/muscle_mapping.dart';
import '../../user/providers/user_providers.dart';
import '../../workout_execution/providers/workout_providers.dart';

enum StatsRange {
  week7('7 days', 7),
  days30('30 days', 30),
  days90('90 days', 90);

  const StatsRange(this.label, this.days);
  final String label;
  final int days;

  int get fromDayEpoch {
    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day)
        .subtract(Duration(days: days - 1));
    return start.millisecondsSinceEpoch;
  }

  int get toDayEpoch {
    final today = DateTime.now();
    return DateTime(today.year, today.month, today.day).millisecondsSinceEpoch;
  }
}

class StatsRangeNotifier extends Notifier<StatsRange> {
  @override
  StatsRange build() => StatsRange.week7;

  void set(StatsRange range) => state = range;
}

final statsRangeProvider = NotifierProvider<StatsRangeNotifier, StatsRange>(
    StatsRangeNotifier.new);

/// Daily score trend for one muscle over the selected range — sums the
/// weighted contribution of every body part that lights the muscle up.
final muscleTrendProvider = FutureProvider.autoDispose
    .family<List<({int dayEpoch, double score})>, String>((ref, muscle) async {
  ref.watch(workoutChangeTickProvider);
  final range = ref.watch(statsRangeProvider);
  final userId = ref.watch(currentUserIdProvider);
  final rows = await ref
      .read(databaseProvider)
      .statsDao
      .getMuscleUsageInRange(userId, range.fromDayEpoch, range.toDayEpoch);

  final byDay = <int, double>{};
  for (final row in rows) {
    final weight = bodyPartToMuscles[BodyPart.parse(row.bodyPart)]?[muscle];
    if (weight == null) continue;
    byDay[row.dayEpoch] = (byDay[row.dayEpoch] ?? 0) + row.score * weight;
  }
  final days = byDay.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));
  return [for (final e in days) (dayEpoch: e.key, score: e.value)];
});

/// Exercises that target one of the given body parts, most recent first —
/// the "contributing exercises" list in the muscle sheet.
final exercisesForBodyPartsProvider = FutureProvider.autoDispose
    .family<List<ExerciseRow>, List<BodyPart>>((ref, parts) async {
  final userId = ref.watch(currentUserIdProvider);
  final db = ref.read(databaseProvider);
  final names = parts.map((p) => p.name).toList();
  final query = db.select(db.exerciseTable).join([
    innerJoin(db.userExerciseTable,
        db.userExerciseTable.exerciseId.equalsExp(db.exerciseTable.id)),
  ])
    ..where(db.userExerciseTable.userId.equals(userId) &
        db.userExerciseTable.deletedOn.isNull() &
        db.exerciseTable.bodyPart.isIn(names))
    ..orderBy([
      OrderingTerm.desc(db.userExerciseTable.lastPerformedAt),
    ])
    ..limit(6);
  final rows = await query.get();
  return rows.map((r) => r.readTable(db.exerciseTable)).toList();
});

/// Recent PR feed.
final recentPrEventsProvider =
    FutureProvider.autoDispose<List<PersonalRecordEventRow>>((ref) {
  ref.watch(workoutChangeTickProvider);
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(databaseProvider).statsDao.getRecentPrEvents(userId);
});

/// Per-exercise rollup rows over the selected range (chart source).
final exerciseRollupsProvider = FutureProvider.autoDispose
    .family<List<HistoryStatsRollupRow>, String>((ref, userExerciseId) {
  ref.watch(workoutChangeTickProvider);
  final range = ref.watch(statsRangeProvider);
  return ref.read(databaseProvider).statsDao.getRollupsInRange(
      userExerciseId, range.fromDayEpoch, range.toDayEpoch);
});
