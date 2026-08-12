import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/data/database.dart';
import '../../../core/taxonomy/display_metrics.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/unit_converter.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../../stats/providers/stats_providers.dart';
import '../models/models_view/exercise_vm.dart';

/// Progress chart for one exercise. Reads ONLY rollup rows (doc §10) and
/// offers the metrics the modality declares chartable.
class ExerciseChartCard extends ConsumerStatefulWidget {
  const ExerciseChartCard({super.key, required this.exercise});

  final ExerciseVm exercise;

  @override
  ConsumerState<ExerciseChartCard> createState() => _ExerciseChartCardState();
}

class _ExerciseChartCardState extends ConsumerState<ExerciseChartCard> {
  DisplayMetrics? _metric;

  List<DisplayMetrics> get _available => (widget
              .exercise.strengthModality?.supportedDisplayMetrics ??
          widget.exercise.cardioModality?.supportedDisplayMetrics ??
          const {})
      .where((m) => m != DisplayMetrics.distanceVsDuration)
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ms = ref.watch(measurementSystemProvider);
    final rollups = ref.watch(exerciseRollupsProvider(widget.exercise.id));
    final metrics = _available;
    if (metrics.isEmpty) return const SizedBox.shrink();
    final metric = _metric ?? metrics.first;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Progress', style: theme.textTheme.titleSmall),
                const Spacer(),
                DropdownButton<DisplayMetrics>(
                  value: metric,
                  isDense: true,
                  underline: const SizedBox.shrink(),
                  items: [
                    for (final m in metrics)
                      DropdownMenuItem(value: m, child: Text(m.label)),
                  ],
                  onChanged: (m) => setState(() => _metric = m),
                ),
              ],
            ),
            const SizedBox(height: 8),
            rollups.when(
              loading: () => const SizedBox(
                  height: 140,
                  child: Center(child: CircularProgressIndicator())),
              error: (e, _) => const SizedBox.shrink(),
              data: (rows) {
                final points = [
                  for (final row in rows)
                    if (_value(row, metric, ms) != null)
                      FlSpot(row.dayEpoch.toDouble(),
                          _value(row, metric, ms)!),
                ];
                if (points.length < 2) {
                  return SizedBox(
                    height: 80,
                    child: Center(
                      child: Text(
                        'Log this exercise on two different days to see '
                        'a trend.',
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return SizedBox(
                  height: 160,
                  child: LineChart(
                    LineChartData(
                      minY: 0,
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: const AxisTitles(
                          sideTitles:
                              SideTitles(showTitles: true, reservedSize: 44),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 24,
                            interval: (points.last.x - points.first.x)
                                .clamp(1, double.infinity),
                            getTitlesWidget: (value, meta) =>
                                SideTitleWidget(
                              meta: meta,
                              child: Text(
                                DateFormat('M/d').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        value.toInt())),
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: points,
                          color: theme.colorScheme.primary,
                          barWidth: 3,
                          dotData: FlDotData(show: points.length <= 20),
                          belowBarData: BarAreaData(
                            show: true,
                            color: theme.colorScheme.primary
                                .withValues(alpha: .15),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double? _value(
      HistoryStatsRollupRow row, DisplayMetrics metric, MeasurementSystem ms) {
    return switch (metric) {
      DisplayMetrics.totalVolume =>
        UnitConverter.weightToUserMs(row.totalVolume, ms),
      DisplayMetrics.totalReps => row.totalReps.toDouble(),
      DisplayMetrics.setCount => row.setCount.toDouble(),
      DisplayMetrics.maxWeight => row.maxWeight == null
          ? null
          : UnitConverter.weightToUserMs(row.maxWeight!, ms),
      DisplayMetrics.oneRepMax => row.oneRepMax == null
          ? null
          : UnitConverter.weightToUserMs(row.oneRepMax!, ms),
      DisplayMetrics.totalDuration => row.totalDurationSeconds == null
          ? null
          : row.totalDurationSeconds! / 60.0,
      DisplayMetrics.totalDistance => row.totalDistance == null
          ? null
          : UnitConverter.distanceToUserMs(row.totalDistance!, ms),
      DisplayMetrics.maxSpeed => row.maxSpeed == null
          ? null
          : UnitConverter.speedToUserMs(row.maxSpeed!, ms),
      DisplayMetrics.avgSpeed => row.avgSpeed == null
          ? null
          : UnitConverter.speedToUserMs(row.avgSpeed!, ms),
      DisplayMetrics.distanceVsDuration => null,
    };
  }
}
