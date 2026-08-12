import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/taxonomy/body_part.dart';
import '../../../core/taxonomy/exercise_category.dart';
import '../providers/exercise_providers.dart';
import '../widgets/exercise_card.dart';
import 'exercise_detail_screen.dart';
import 'exercise_form_screen.dart';

/// The Exercises tab: search + filter chips over the reactive catalog list.
class ExercisesScreen extends ConsumerWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercisesAsync = ref.watch(currentUserExercisesProvider);
    final filter = ref.watch(exerciseFilterProvider);
    final filterNotifier = ref.read(exerciseFilterProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: SearchBar(
              hintText: 'Search exercises',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              onChanged: (text) =>
                  filterNotifier.update(filter.copyWith(searchText: text)),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              children: [
                FilterChip(
                  label: const Text('Favorites'),
                  selected: filter.favoritesOnly,
                  onSelected: (v) =>
                      filterNotifier.update(filter.copyWith(favoritesOnly: v)),
                ),
                const SizedBox(width: 8),
                for (final category in ExerciseCategory.values) ...[
                  FilterChip(
                    label: Text(category.label),
                    selected: filter.category == category,
                    onSelected: (v) => filterNotifier.update(filter.copyWith(
                        category: () => v ? category : null)),
                  ),
                  const SizedBox(width: 8),
                ],
                _BodyPartChip(
                  selected: filter.bodyPart,
                  onSelected: (part) => filterNotifier
                      .update(filter.copyWith(bodyPart: () => part)),
                ),
              ],
            ),
          ),
          Expanded(
            child: exercisesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Failed to load: $e')),
              data: (exercises) => exercises.isEmpty
                  ? const Center(child: Text('No exercises match.'))
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 88),
                      itemCount: exercises.length,
                      itemBuilder: (context, i) {
                        final exercise = exercises[i];
                        return ExerciseCard(
                          exercise: exercise,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ExerciseDetailScreen(
                                  userExerciseId: exercise.id),
                            ),
                          ),
                          onToggleFavorite: () => ref
                              .read(exerciseUseCasesProvider)
                              .toggleFavorite(
                                  exercise.id, !exercise.isFavorite),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'newExercise',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ExerciseFormScreen()),
        ),
        icon: const Icon(Icons.add),
        label: const Text('New exercise'),
      ),
    );
  }
}

class _BodyPartChip extends StatelessWidget {
  const _BodyPartChip({required this.selected, required this.onSelected});

  final BodyPart? selected;
  final ValueChanged<BodyPart?> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<BodyPart?>(
      onSelected: (part) =>
          onSelected(part == BodyPart.none ? null : part),
      itemBuilder: (context) => [
        const PopupMenuItem(value: BodyPart.none, child: Text('Any body part')),
        for (final part in BodyPart.values)
          if (part != BodyPart.none)
            PopupMenuItem(value: part, child: Text(part.label)),
      ],
      child: Chip(
        label: Text(selected?.label ?? 'Body part'),
        avatar: Icon(
          selected == null ? Icons.filter_list : Icons.check,
          size: 18,
        ),
      ),
    );
  }
}
