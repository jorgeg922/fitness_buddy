import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../exercises/models/exercise_filter.dart';
import '../../exercises/providers/exercise_providers.dart';
import '../../stats/providers/stats_providers.dart';
import '../models/muscle_mapping.dart';
import '../models/muscles.dart';

/// Bottom sheet opened by tapping a muscle on the stats heatmap: activity
/// trend, contributing exercises, and a jump into the filtered catalog.
/// This is the tap-a-muscle payoff of the Rive asset.
Future<void> showMuscleDetailSheet(
  BuildContext context, {
  required String muscle,
  required VoidCallback onGoToExercises,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _MuscleDetailSheet(
        muscle: muscle, onGoToExercises: onGoToExercises),
  );
}

class _MuscleDetailSheet extends ConsumerWidget {
  const _MuscleDetailSheet({
    required this.muscle,
    required this.onGoToExercises,
  });

  final String muscle;
  final VoidCallback onGoToExercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bodyParts = bodyPartsForMuscle(muscle);
    final trend = ref.watch(muscleTrendProvider(muscle));
    final exercises = ref.watch(exercisesForBodyPartsProvider(bodyParts));
    final range = ref.watch(statsRangeProvider);
    final group = muscleToGroup[muscle];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(muscleLabels[muscle] ?? muscle,
              style: theme.textTheme.titleLarge),
          if (group != null)
            Text('${group.label} · last ${range.label}',
                style: theme.textTheme.bodySmall),
          const SizedBox(height: 12),
          trend.when(
            loading: () => const SizedBox(
                height: 120, child: Center(child: CircularProgressIndicator())),
            error: (e, _) => const SizedBox.shrink(),
            data: (points) => points.isEmpty
                ? Text('No training in this window yet.',
                    style: theme.textTheme.bodyMedium)
                : SizedBox(
                    height: 120,
                    child: _TrendChart(points: points),
                  ),
          ),
          const SizedBox(height: 16),
          Text('Exercises for this muscle', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          exercises.when(
            loading: () => const LinearProgressIndicator(),
            error: (e, _) => const SizedBox.shrink(),
            data: (rows) => rows.isEmpty
                ? const Text('None in your catalog yet.')
                : Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      for (final row in rows) Chip(label: Text(row.name)),
                    ],
                  ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.tonal(
              onPressed: () {
                // Pre-filter the catalog by the muscle's primary body part.
                ref.read(exerciseFilterProvider.notifier).update(
                    ExerciseFilter(bodyPart: bodyParts.firstOrNull));
                Navigator.pop(context);
                onGoToExercises();
              },
              child: const Text('Find exercises'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.points});

  final List<({int dayEpoch, double score})> points;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final spots = [
      for (final p in points)
        FlSpot(p.dayEpoch.toDouble(), p.score),
    ];
    final maxScore =
        points.map((p) => p.score).fold(0.0, (a, b) => a > b ? a : b);

    return LineChart(
      LineChartData(
        minY: 0,
        maxY: maxScore * 1.2 + 1,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 24,
              interval: points.length > 1
                  ? (points.last.dayEpoch - points.first.dayEpoch)
                          .toDouble()
                          .clamp(1, double.infinity) /
                      2
                  : 1,
              getTitlesWidget: (value, meta) => SideTitleWidget(
                meta: meta,
                child: Text(
                  DateFormat('M/d').format(
                      DateTime.fromMillisecondsSinceEpoch(value.toInt())),
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: false,
            color: theme.colorScheme.primary,
            barWidth: 3,
            dotData: FlDotData(show: points.length <= 14),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.primary.withValues(alpha: .15),
            ),
          ),
        ],
        lineTouchData: const LineTouchData(enabled: false),
      ),
    );
  }
}
