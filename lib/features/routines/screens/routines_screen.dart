import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_custom_colors.dart';
import '../../user/providers/user_providers.dart';
import '../../workout_execution/screens/workout_loading_screen.dart';
import '../models/models_view/routine_vm.dart';
import '../providers/routine_providers.dart';
import 'routine_builder_screen.dart';

class RoutinesScreen extends ConsumerWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routinesAsync = ref.watch(currentUserRoutinesProvider);

    return Scaffold(
      body: routinesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load: $e')),
        data: (routines) => routines.isEmpty
            ? const Center(
                child: Text('No routines yet — create your first one.'))
            : ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 88),
                itemCount: routines.length,
                itemBuilder: (context, i) =>
                    _RoutineCard(routine: routines[i]),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'newRoutine',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RoutineBuilderScreen()),
        ),
        icon: const Icon(Icons.add),
        label: const Text('New routine'),
      ),
    );
  }
}

class _RoutineCard extends ConsumerWidget {
  const _RoutineCard({required this.routine});

  final RoutineVm routine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final preview = routine.exercises.take(3).map((e) => e.name).join(' · ');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RoutineBuilderScreen(existing: routine)),
        ),
        title: Text(routine.name),
        subtitle: Text(
          '${routine.exercises.length} exercises'
          '${preview.isEmpty ? '' : ' — $preview'}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodySmall,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.play_circle_fill),
              iconSize: 32,
              color: theme.colorScheme.primary,
              tooltip: 'Start workout',
              onPressed: routine.exercises.isEmpty
                  ? null
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutLoadingScreen.forRoutine(
                            routineId: routine.id,
                            routineName: routine.name,
                          ),
                        ),
                      ),
            ),
            _RoutineMenu(routine: routine),
          ],
        ),
        leading: routine.isFavorite
            ? Icon(Icons.star, color: theme.customColors.favorite)
            : const Icon(Icons.list_alt_outlined),
      ),
    );
  }
}

class _RoutineMenu extends ConsumerWidget {
  const _RoutineMenu({required this.routine});

  final RoutineVm routine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
          onSelected: (action) async {
            final useCases = ref.read(routineUseCasesProvider);
            final userId = ref.read(currentUserIdProvider);
            switch (action) {
              case 'favorite':
                await useCases.toggleFavorite(
                    routine.id, !routine.isFavorite);
              case 'duplicate':
                await useCases.executeDuplicate(userId, routine);
              case 'delete':
                final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete routine?'),
                        content: Text('"${routine.name}" will be removed. '
                            'Workout history is kept.'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel')),
                          FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete')),
                        ],
                      ),
                    ) ??
                    false;
                if (confirmed) await useCases.executeDelete(routine.id);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'favorite',
              child: Text(routine.isFavorite ? 'Unfavorite' : 'Favorite'),
            ),
            const PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
    );
  }
}
