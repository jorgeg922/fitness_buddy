import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../heatmap/models/muscles.dart';
import '../../heatmap/services/heatmap_intensity_service.dart';
import '../../heatmap/widgets/heatmap_view.dart';
import '../../workout_execution/screens/workout_loading_screen.dart';
import '../models/models_view/exercise_vm.dart';
import '../providers/exercise_providers.dart';
import '../widgets/exercise_chart_card.dart';
import 'exercise_form_screen.dart';

/// Exercise detail: taxonomy chips, a static muscle preview (primaries glow),
/// notes. Charts and history attach here in Phase 8.
class ExerciseDetailScreen extends ConsumerWidget {
  const ExerciseDetailScreen({super.key, required this.userExerciseId});

  final String userExerciseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Reuse the reactive list so favorite/notes edits reflect instantly.
    final exercise = ref
        .watch(currentUserExercisesProvider)
        .value
        ?.where((e) => e.id == userExerciseId)
        .firstOrNull;

    if (exercise == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return _DetailBody(exercise: exercise);
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.exercise});

  final ExerciseVm exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final preview =
        HeatmapIntensityService.previewForBodyPart(exercise.bodyPart);
    // Auto-pick the artboard side with the higher summed preview weight.
    final frontWeight = preview.entries
        .where((e) => frontMuscles.contains(e.key))
        .fold(0.0, (sum, e) => sum + e.value);
    final backWeight = preview.entries
        .where((e) => backMuscles.contains(e.key))
        .fold(0.0, (sum, e) => sum + e.value);

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: Icon(exercise.isFavorite ? Icons.star : Icons.star_border),
            onPressed: () => ref
                .read(exerciseUseCasesProvider)
                .toggleFavorite(exercise.id, !exercise.isFavorite),
          ),
          if (exercise.isCustom)
            PopupMenuButton<String>(
              onSelected: (action) async {
                final useCases = ref.read(exerciseUseCasesProvider);
                if (action == 'edit') {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ExerciseFormScreen(existing: exercise)),
                  );
                } else if (action == 'delete') {
                  final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete exercise?'),
                          content: const Text(
                              'Workout history for it is kept. This cannot '
                              'be undone.'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, false),
                                child: const Text('Cancel')),
                            FilledButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Delete')),
                          ],
                        ),
                      ) ??
                      false;
                  if (confirmed) {
                    final res = await useCases.executeDelete(exercise.id);
                    if (res.isOk && context.mounted) Navigator.pop(context);
                  }
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'edit', child: Text('Edit')),
                PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'startAdhoc',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                WorkoutLoadingScreen.adhoc(userExerciseId: exercise.id),
          ),
        ),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Start workout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(exercise.category.label)),
              Chip(label: Text(exercise.bodyPart.label)),
              Chip(label: Text(exercise.modalityLabel)),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text('Muscles targeted', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 4),
                  IgnorePointer(
                    child: HeatmapView(
                      intensities: preview,
                      height: 260,
                      showSideToggle: false,
                      initialFront: frontWeight >= backWeight,
                      showCta: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (exercise.lastPerformedAt != null)
            ExerciseChartCard(exercise: exercise),
          const SizedBox(height: 8),
          _NotesCard(exercise: exercise),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}

class _NotesCard extends ConsumerStatefulWidget {
  const _NotesCard({required this.exercise});

  final ExerciseVm exercise;

  @override
  ConsumerState<_NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends ConsumerState<_NotesCard> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.exercise.notes ?? '');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes', style: Theme.of(context).textTheme.titleSmall),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(
                  hintText: 'Setup cues, seat height, grip…',
                  border: InputBorder.none),
              onSubmitted: (_) => _save(),
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
                _save();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _save() {
    final text = _controller.text;
    if (text.trim() == (widget.exercise.notes ?? '').trim()) return;
    ref.read(exerciseUseCasesProvider).updateNotes(widget.exercise.id, text);
  }
}
