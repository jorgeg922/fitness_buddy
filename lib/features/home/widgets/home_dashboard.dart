import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common/providers/shared_prefs_provider.dart';
import '../../exercises/screens/exercise_detail_screen.dart';
import '../../heatmap/providers/heatmap_intensity_providers.dart';
import '../../heatmap/widgets/heatmap_view.dart';
import '../../workout_execution/providers/workout_providers.dart';
import '../../workout_execution/screens/workout_loading_screen.dart';
import '../../workout_history/services/set_display.dart';

/// Home tab: resume banner + weekly muscle heatmap card + recent exercises.
class HomeDashboard extends ConsumerWidget {
  const HomeDashboard({super.key, required this.onSeeStats});

  /// Switches the shell to the Stats tab.
  final VoidCallback onSeeStats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final drafts = ref.watch(activeDraftsProvider).value ?? [];
    final weekly = ref.watch(weeklyIntensitiesProvider);

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        if (drafts.isNotEmpty)
          Card(
            color: theme.colorScheme.primaryContainer,
            child: ListTile(
              leading: Icon(Icons.play_circle,
                  color: theme.colorScheme.onPrimaryContainer),
              title: const Text('Unfinished workout'),
              subtitle: Text('${drafts.length} exercise'
                  '${drafts.length == 1 ? '' : 's'} in progress'),
              trailing: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const WorkoutLoadingScreen.resume()),
                ),
                child: const Text('Resume'),
              ),
            ),
          ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onSeeStats,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('This week', style: theme.textTheme.titleMedium),
                      const Spacer(),
                      Text('Last 7 days', style: theme.textTheme.bodySmall),
                      const Icon(Icons.chevron_right, size: 18),
                    ],
                  ),
                  const SizedBox(height: 4),
                  weekly.when(
                    loading: () => const SizedBox(
                        height: 280,
                        child: Center(child: CircularProgressIndicator())),
                    error: (e, _) => SizedBox(
                        height: 100,
                        child: Center(child: Text('Failed to load: $e'))),
                    data: (intensities) => intensities.isEmpty
                        ? SizedBox(
                            height: 120,
                            child: Center(
                              child: Text(
                                'Finish a workout to light up your muscles.',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          )
                        : HeatmapView(
                            intensities: intensities,
                            height: 300,
                            showCta: false,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const _RecentExercisesCard(),
      ],
    );
  }
}

class _RecentExercisesCard extends ConsumerWidget {
  const _RecentExercisesCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ms = ref.watch(measurementSystemProvider);
    final recent = ref.watch(recentPerformancesProvider);

    return recent.maybeWhen(
      data: (performances) => performances.isEmpty
          ? const SizedBox.shrink()
          : Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text('Recent exercises',
                          style: theme.textTheme.titleMedium),
                    ),
                    for (final performance in performances)
                      ListTile(
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: const Icon(Icons.fitness_center, size: 20),
                        title: Text(performance.exerciseName,
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        subtitle: Text(
                          performance.sets
                              .map((s) => formatLoggedSet(s, ms))
                              .join(' · '),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                        trailing: Text(
                          _relativeDay(performance.performedAt),
                          style: theme.textTheme.bodySmall,
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExerciseDetailScreen(
                                userExerciseId: performance.userExerciseId),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  String _relativeDay(int epochMs) {
    final date = DateTime.fromMillisecondsSinceEpoch(epochMs);
    final today = DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);
    final startOfDate = DateTime(date.year, date.month, date.day);
    final days = startOfToday.difference(startOfDate).inDays;
    if (days <= 0) return DateFormat('h:mm a').format(date);
    if (days == 1) return 'Yesterday';
    if (days < 7) return DateFormat('EEE').format(date);
    return DateFormat('M/d').format(date);
  }
}
