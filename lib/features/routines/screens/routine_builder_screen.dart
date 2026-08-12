import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user/providers/user_providers.dart';
import '../models/models_dto/routine_draft.dart';
import '../models/models_view/routine_vm.dart';
import '../providers/routine_providers.dart';
import '../widgets/exercise_picker_sheet.dart';

/// Create/edit a routine: name + reorderable exercise list. Saving computes
/// a merge diff against the persisted rows (positions re-stamped from list
/// order).
class RoutineBuilderScreen extends ConsumerStatefulWidget {
  const RoutineBuilderScreen({super.key, this.existing});

  final RoutineVm? existing;

  @override
  ConsumerState<RoutineBuilderScreen> createState() =>
      _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends ConsumerState<RoutineBuilderScreen> {
  late final TextEditingController _nameController =
      TextEditingController(text: widget.existing?.name ?? '');
  late final List<RoutineExerciseDraft> _drafts = [
    for (final e in widget.existing?.exercises ?? <RoutineExerciseVm>[])
      RoutineExerciseDraft(
        instanceId: e.instanceId,
        userExerciseId: e.userExerciseId,
        name: e.name,
        notes: e.notes,
      ),
  ];
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit routine' : 'New routine'),
        actions: [
          TextButton(
            onPressed: _saving ? null : _save,
            child: const Text('Save'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Routine name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _drafts.isEmpty
                ? const Center(child: Text('Add exercises below.'))
                : ReorderableListView.builder(
                    padding: const EdgeInsets.only(bottom: 88),
                    itemCount: _drafts.length,
                    onReorder: (oldIndex, newIndex) => setState(() {
                      if (newIndex > oldIndex) newIndex--;
                      final item = _drafts.removeAt(oldIndex);
                      _drafts.insert(newIndex, item);
                    }),
                    itemBuilder: (context, i) {
                      final draft = _drafts[i];
                      return ListTile(
                        key: ValueKey('${draft.instanceId ?? 'new'}-$i-'
                            '${draft.userExerciseId}'),
                        leading: Text('${i + 1}',
                            style: Theme.of(context).textTheme.titleMedium),
                        title: Text(draft.name),
                        subtitle: draft.notes == null
                            ? null
                            : Text(draft.notes!,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notes),
                              tooltip: 'Instance notes',
                              onPressed: () => _editNotes(i),
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () =>
                                  setState(() => _drafts.removeAt(i)),
                            ),
                            ReorderableDragStartListener(
                              index: i,
                              child: const Icon(Icons.drag_handle),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addExerciseToRoutine',
        onPressed: () async {
          final picked = await showExercisePicker(context);
          if (picked != null) {
            setState(() => _drafts.add(RoutineExerciseDraft(
                userExerciseId: picked.id, name: picked.name)));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add exercise'),
      ),
    );
  }

  Future<void> _editNotes(int index) async {
    final draft = _drafts[index];
    final controller = TextEditingController(text: draft.notes ?? '');
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(draft.name),
        content: TextField(
          controller: controller,
          maxLines: 3,
          autofocus: true,
          decoration:
              const InputDecoration(hintText: 'Notes for this routine slot'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null) {
      final trimmed = result.trim();
      setState(() => _drafts[index] =
          draft.copyWith(notes: trimmed.isEmpty ? null : trimmed));
    }
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final useCases = ref.read(routineUseCasesProvider);
    final userId = ref.read(currentUserIdProvider);
    final name = _nameController.text;

    final res = _isEdit
        ? await useCases.executeUpdate(
            userId: userId,
            routineId: widget.existing!.id,
            name: name,
            drafts: _drafts,
          )
        : await useCases.executeCreate(
            userId: userId, name: name, drafts: _drafts);

    if (!mounted) return;
    setState(() => _saving = false);
    if (res.isOk) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res.errorMessage)));
    }
  }
}
