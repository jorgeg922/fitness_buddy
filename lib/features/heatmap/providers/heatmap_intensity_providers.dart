import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../../core/taxonomy/body_part.dart';
import '../../user/providers/user_providers.dart';
import '../../workout_execution/providers/workout_providers.dart';
import '../services/heatmap_intensity_service.dart';

/// Muscle intensities for an inclusive day-epoch range, re-computed after
/// every finished workout via the change-tick (doc §2 pattern 2).
final rangeIntensitiesProvider = FutureProvider.autoDispose
    .family<Map<String, double>, ({int fromDayEpoch, int toDayEpoch})>(
        (ref, range) async {
  ref.watch(workoutChangeTickProvider);
  final userId = ref.watch(currentUserIdProvider);
  final rows = await ref
      .read(databaseProvider)
      .statsDao
      .getMuscleUsageInRange(userId, range.fromDayEpoch, range.toDayEpoch);

  final usage = <BodyPart, double>{};
  for (final row in rows) {
    final part = BodyPart.parse(row.bodyPart);
    usage[part] = (usage[part] ?? 0) + row.score;
  }
  return HeatmapIntensityService.intensitiesFromUsage(usage);
});

int _dayEpoch(DateTime day) =>
    DateTime(day.year, day.month, day.day).millisecondsSinceEpoch;

/// Last 7 days (today inclusive) — the home dashboard card.
final weeklyIntensitiesProvider =
    FutureProvider.autoDispose<Map<String, double>>((ref) {
  final today = DateTime.now();
  return ref.watch(rangeIntensitiesProvider((
    fromDayEpoch: _dayEpoch(today.subtract(const Duration(days: 6))),
    toDayEpoch: _dayEpoch(today),
  )).future);
});
