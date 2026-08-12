import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/taxonomy/body_part.dart';
import '../../../core/taxonomy/cardio_modality.dart';
import '../../../core/taxonomy/exercise_category.dart';
import '../../../core/taxonomy/strength_modality.dart';
import '../../user/providers/user_providers.dart';
import '../models/models_dto/exercise_form_dto.dart';
import '../models/models_view/exercise_vm.dart';
import '../providers/exercise_providers.dart';

/// Create/edit a custom exercise. Category is locked when editing — the
/// metric shape of logged history depends on it.
class ExerciseFormScreen extends ConsumerStatefulWidget {
  const ExerciseFormScreen({super.key, this.existing});

  final ExerciseVm? existing;

  @override
  ConsumerState<ExerciseFormScreen> createState() =>
      _ExerciseFormScreenState();
}

class _ExerciseFormScreenState extends ConsumerState<ExerciseFormScreen> {
  late final TextEditingController _nameController =
      TextEditingController(text: widget.existing?.name ?? '');
  late ExerciseCategory _category =
      widget.existing?.category ?? ExerciseCategory.strength;
  late BodyPart _bodyPart = widget.existing?.bodyPart ?? BodyPart.chest;
  late StrengthModality _strengthModality =
      widget.existing?.strengthModality ?? StrengthModality.weighted;
  late CardioModality _cardioModality =
      widget.existing?.cardioModality ?? CardioModality.endurance;
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
          title: Text(_isEdit ? 'Edit exercise' : 'New custom exercise')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          if (!_isEdit) ...[
            SegmentedButton<ExerciseCategory>(
              segments: [
                for (final c in ExerciseCategory.values)
                  ButtonSegment(value: c, label: Text(c.label)),
              ],
              selected: {_category},
              onSelectionChanged: (s) => setState(() => _category = s.first),
            ),
            const SizedBox(height: 16),
          ],
          DropdownButtonFormField<BodyPart>(
            initialValue: _bodyPart,
            decoration: const InputDecoration(
              labelText: 'Body part',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final part in BodyPart.values)
                if (part != BodyPart.none)
                  DropdownMenuItem(value: part, child: Text(part.label)),
            ],
            onChanged: (v) => setState(() => _bodyPart = v!),
          ),
          const SizedBox(height: 16),
          if (_category == ExerciseCategory.strength)
            DropdownButtonFormField<StrengthModality>(
              initialValue: _strengthModality,
              decoration: const InputDecoration(
                labelText: 'Modality',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final m in StrengthModality.values)
                  DropdownMenuItem(value: m, child: Text(m.label)),
              ],
              onChanged: (v) => setState(() => _strengthModality = v!),
            )
          else
            DropdownButtonFormField<CardioModality>(
              initialValue: _cardioModality,
              decoration: const InputDecoration(
                labelText: 'Modality',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final m in CardioModality.values)
                  DropdownMenuItem(value: m, child: Text(m.label)),
              ],
              onChanged: (v) => setState(() => _cardioModality = v!),
            ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _saving ? null : _save,
            child: Text(_isEdit ? 'Save changes' : 'Create exercise'),
          ),
        ],
      ),
    );
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    final useCases = ref.read(exerciseUseCasesProvider);
    final dto = ExerciseFormDto(
      userId: ref.read(currentUserIdProvider),
      name: _nameController.text,
      category: _category,
      bodyPart: _bodyPart,
      strengthModality:
          _category == ExerciseCategory.strength ? _strengthModality : null,
      cardioModality:
          _category == ExerciseCategory.cardio ? _cardioModality : null,
      existingUserExerciseId: widget.existing?.id,
    );

    final res = _isEdit
        ? await useCases.executeUpdate(dto, widget.existing!.exerciseId)
        : await useCases.executeCreate(dto);

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
