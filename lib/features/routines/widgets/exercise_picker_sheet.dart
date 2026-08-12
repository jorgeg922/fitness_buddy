import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../exercises/models/models_view/exercise_vm.dart';
import '../../exercises/providers/exercise_providers.dart';

/// Bottom sheet to pick an exercise from the catalog. Returns the picked
/// [ExerciseVm] via Navigator.pop.
Future<ExerciseVm?> showExercisePicker(BuildContext context) {
  return showModalBottomSheet<ExerciseVm>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => const _ExercisePickerSheet(),
  );
}

class _ExercisePickerSheet extends ConsumerStatefulWidget {
  const _ExercisePickerSheet();

  @override
  ConsumerState<_ExercisePickerSheet> createState() =>
      _ExercisePickerSheetState();
}

class _ExercisePickerSheetState extends ConsumerState<_ExercisePickerSheet> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    // Local search over the already-watched catalog list — the global filter
    // notifier stays untouched so the Exercises tab keeps its own state.
    final all = ref.watch(currentUserExercisesProvider).value ?? [];
    final query = _search.trim().toLowerCase();
    final filtered = query.isEmpty
        ? all
        : all.where((e) => e.name.toLowerCase().contains(query)).toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      builder: (context, scrollController) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              hintText: 'Search exercises',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              onChanged: (text) => setState(() => _search = text),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final exercise = filtered[i];
                return ListTile(
                  title: Text(exercise.name),
                  subtitle: Text(
                      '${exercise.bodyPart.label} · ${exercise.modalityLabel}'),
                  onTap: () => Navigator.pop(context, exercise),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
