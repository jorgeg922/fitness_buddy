import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/taxonomy/tracked_metrics.dart';
import '../../heatmap/providers/heatmap_intensity_providers.dart';
import '../../heatmap/widgets/heatmap_view.dart';
import '../../heatmap/widgets/muscle_detail_sheet.dart';
import '../../heatmap/widgets/muscle_group_heat_bars.dart';
import '../../workout_history/screens/history_screen.dart';
import '../providers/stats_providers.dart';

/// The flagship heatmap surface: date-range muscle activation + ranked
/// groups + tap-a-muscle drill-down. Pure composition — no own data.
class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key, required this.onGoToExercises});

  final VoidCallback onGoToExercises;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final range = ref.watch(statsRangeProvider);
    final intensities = ref.watch(rangeIntensitiesProvider(
        (fromDayEpoch: range.fromDayEpoch, toDayEpoch: range.toDayEpoch)));
    final prs = ref.watch(recentPrEventsProvider);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Row(
            children: [
              SegmentedButton<StatsRange>(
                showSelectedIcon: false,
                style: const ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                segments: [
                  for (final r in StatsRange.values)
                    ButtonSegment(value: r, label: Text(r.label)),
                ],
                selected: {range},
                onSelectionChanged: (s) =>
                    ref.read(statsRangeProvider.notifier).set(s.first),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.history),
                tooltip: 'Workout history',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: intensities.when(
                loading: () => const SizedBox(
                    height: 320,
                    child: Center(child: CircularProgressIndicator())),
                error: (e, _) =>
                    SizedBox(height: 100, child: Center(child: Text('$e'))),
                data: (values) => Column(
                  children: [
                    Text('Muscle activation',
                        style: theme.textTheme.titleSmall),
                    if (values.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          'No workouts in this window yet — finish one and '
                          'watch this light up.',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      )
                    else ...[
                      Text('Tap a muscle for details',
                          style: theme.textTheme.bodySmall),
                      HeatmapView(
                        intensities: values,
                        height: 340,
                        onMuscleClick: (muscle) => showMuscleDetailSheet(
                          context,
                          muscle: muscle,
                          onGoToExercises: onGoToExercises,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          intensities.maybeWhen(
            data: (values) => values.isEmpty
                ? const SizedBox.shrink()
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Muscle groups',
                              style: theme.textTheme.titleSmall),
                          const SizedBox(height: 8),
                          MuscleGroupHeatBars(
                            intensities: values,
                            onGroupTap: (group) => showMuscleDetailSheet(
                              context,
                              muscle: group.muscles.first,
                              onGoToExercises: onGoToExercises,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            orElse: () => const SizedBox.shrink(),
          ),
          const SizedBox(height: 8),
          prs.maybeWhen(
            data: (events) => events.isEmpty
                ? const SizedBox.shrink()
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Recent PRs', style: theme.textTheme.titleSmall),
                          const SizedBox(height: 4),
                          for (final event in events.take(8))
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                children: [
                                  Expanded(
                                      child:
                                          Text(event.exerciseNameSnapshot)),
                                  Text(
                                    '${_prLabel(event.metric)}: '
                                    '${_formatValue(event.value)}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  String _prLabel(String metric) =>
      TrackedMetricsPr.values.asNameMap()[metric]?.label ?? metric;

  String _formatValue(double value) => value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toStringAsFixed(1);
}
