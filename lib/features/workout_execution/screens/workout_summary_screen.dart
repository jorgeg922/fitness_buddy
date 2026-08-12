import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_custom_colors.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../../heatmap/services/heatmap_intensity_service.dart';
import '../../heatmap/widgets/heatmap_view.dart';
import '../../workout_history/models/session_summary.dart';

/// "Muscles hit today" + session numbers + PRs. Reached only by finishing a
/// workout; popping returns to the home shell.
class WorkoutSummaryScreen extends ConsumerWidget {
  const WorkoutSummaryScreen({super.key, required this.summary});

  final SessionSummary summary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ms = ref.watch(measurementSystemProvider);
    final intensities =
        HeatmapIntensityService.intensitiesFromUsage(summary.bodyPartUsage);

    final minutes = summary.durationSeconds ~/ 60;
    final durationLabel = minutes >= 60
        ? '${minutes ~/ 60}h ${minutes % 60}m'
        : '${minutes}m';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout complete'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Text(
            summary.routineName ?? 'Ad-hoc session',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text('Muscles hit today',
                      style: theme.textTheme.titleSmall),
                  HeatmapView(
                    intensities: intensities,
                    height: 300,
                    showCta: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _StatCard(label: 'Duration', value: durationLabel),
              _StatCard(label: 'Exercises', value: '${summary.exerciseCount}'),
              _StatCard(label: 'Sets', value: '${summary.completedSetCount}'),
            ],
          ),
          Row(
            children: [
              if (summary.totalVolumeInUserMs > 0)
                _StatCard(
                  label: 'Volume',
                  value:
                      '${summary.totalVolumeInUserMs.round()} ${ms.weightUnit}',
                ),
              if (summary.totalDistanceInUserMs > 0)
                _StatCard(
                  label: 'Distance',
                  value:
                      '${summary.totalDistanceInUserMs.toStringAsFixed(1)} ${ms.distanceUnit}',
                ),
            ],
          ),
          if (summary.prs.isNotEmpty) ...[
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.emoji_events,
                            color: theme.customColors.favorite),
                        const SizedBox(width: 8),
                        Text('Personal records',
                            style: theme.textTheme.titleSmall),
                      ],
                    ),
                    const SizedBox(height: 4),
                    for (final pr in summary.prs)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '${pr.exerciseName} — ${pr.metricLabel}: '
                          '${_formatValue(pr.value)}'
                          '${pr.previousValue != null ? ' (was ${_formatValue(pr.previousValue!)})' : ''}',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () =>
                Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  String _formatValue(double value) => value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toStringAsFixed(1);
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(value, style: theme.textTheme.titleMedium),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
