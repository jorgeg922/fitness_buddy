import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/data/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/unit_converter.dart';
import '../../user/providers/user_providers.dart';

final _workoutLogsProvider = StreamProvider.autoDispose((ref) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(databaseProvider).historyDao.watchWorkoutLogs(userId);
});

/// Append-only session list: session → expandable performances → sets.
class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(_workoutLogsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workout history')),
      body: logs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load: $e')),
        data: (rows) => rows.isEmpty
            ? const Center(child: Text('No workouts yet.'))
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: rows.length,
                itemBuilder: (context, i) => _WorkoutTile(log: rows[i]),
              ),
      ),
    );
  }
}

class _WorkoutTile extends ConsumerWidget {
  const _WorkoutTile({required this.log});

  final WorkoutLogRow log;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final date = DateTime.fromMillisecondsSinceEpoch(log.performedAt);
    final minutes = (log.durationSeconds ?? 0) ~/ 60;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ExpansionTile(
        shape: const Border(),
        title: Text(log.routineNameSnapshot ??
            (log.isAdhoc ? 'Ad-hoc session' : 'Workout')),
        subtitle: Text(
          '${DateFormat('EEE, MMM d · h:mm a').format(date)}'
          '${minutes > 0 ? ' · ${minutes}m' : ''}',
          style: theme.textTheme.bodySmall,
        ),
        children: [_WorkoutDetails(workoutLogId: log.id)],
      ),
    );
  }
}

class _WorkoutDetails extends ConsumerWidget {
  const _WorkoutDetails({required this.workoutLogId});

  final String workoutLogId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.read(databaseProvider);
    final ms = ref.watch(measurementSystemProvider);

    return FutureBuilder(
      future: () async {
        final performances =
            await db.historyDao.getPerformancesForWorkout(workoutLogId);
        final result = <(String, List<SetLogRow>)>[];
        for (final performance in performances) {
          final joined = await db.exerciseDao
              .getFullUserExercise(performance.userExerciseId);
          final sets =
              await db.historyDao.getSetsForPerformance(performance.id);
          result.add((joined?.exercise.name ?? 'Exercise', sets));
        }
        return result;
      }(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (name, sets) in data) ...[
                Text(name, style: Theme.of(context).textTheme.titleSmall),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 6),
                  child: Text(
                    sets.map((s) => _formatSet(s, ms)).join(' · '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _formatSet(SetLogRow set, MeasurementSystem ms) {
    if (set.weight != null && set.reps != null) {
      final weight = UnitConverter.weightToUserMs(set.weight!, ms);
      final display = weight == weight.roundToDouble()
          ? weight.toInt().toString()
          : weight.toStringAsFixed(1);
      return '$display×${set.reps}';
    }
    if (set.distance != null) {
      final distance = UnitConverter.distanceToUserMs(set.distance!, ms);
      final minutes = (set.durationSeconds ?? 0) ~/ 60;
      return '${distance.toStringAsFixed(1)}${ms.distanceUnit}'
          '${minutes > 0 ? ' / ${minutes}m' : ''}';
    }
    if (set.reps != null) return '×${set.reps}';
    if (set.durationSeconds != null) return '${set.durationSeconds}s';
    return '—';
  }
}
