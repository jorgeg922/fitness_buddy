import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/config_constants.dart';
import '../../../core/taxonomy/tracked_metrics.dart';
import '../../../core/theme/app_custom_colors.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../models/models_dto/workout_set_draft.dart';
import '../screens/workout_execution_screen.dart' show ExerciseFormState;

/// One set-entry table, adaptive to the exercise's modality: the columns are
/// exactly the modality's `supportedMetrics` (the taxonomy payoff — no
/// per-modality form widgets). Tapping the set number completes the row.
class AdaptiveSetForm extends ConsumerWidget {
  const AdaptiveSetForm({
    super.key,
    required this.form,
    required this.onChanged,
    required this.onSetCompleted,
  });

  final ExerciseFormState form;
  final VoidCallback onChanged;
  final VoidCallback onSetCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ms = ref.watch(measurementSystemProvider);
    final exercise = form.data.exercise;
    final metrics = exercise.strengthModality?.supportedMetrics ??
        exercise.cardioModality?.supportedMetrics ??
        const <TrackedMetrics>{};
    // Speed is derived for endurance cardio, not typed.
    final columns =
        metrics.where((m) => m != TrackedMetrics.speed).toList();
    final showsDerivedSpeed = metrics.contains(TrackedMetrics.speed);

    String label(TrackedMetrics metric) => switch (metric) {
          TrackedMetrics.weight => 'Weight (${ms.weightUnit})',
          TrackedMetrics.reps => 'Reps',
          TrackedMetrics.duration => 'Time (s)',
          TrackedMetrics.distance => 'Dist (${ms.distanceUnit})',
          TrackedMetrics.speed => 'Speed',
        };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 44, child: Text('Set')),
                for (final metric in columns)
                  Expanded(
                    child: Text(label(metric),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                const SizedBox(width: 36),
              ],
            ),
            const Divider(height: 8),
            for (var i = 0; i < form.sets.length; i++)
              _SetRow(
                key: ObjectKey(form.sets[i]),
                setNumber: i + 1,
                set: form.sets[i],
                columns: columns,
                showsDerivedSpeed: showsDerivedSpeed,
                onChanged: onChanged,
                onToggleComplete: () {
                  final set = form.sets[i];
                  if (!set.isCompleted && !set.hasAnyValue) return;
                  set.isCompleted = !set.isCompleted;
                  onChanged();
                  if (set.isCompleted) onSetCompleted();
                },
                onRemove: form.sets.length <= 1
                    ? null
                    : () {
                        form.sets.removeAt(i);
                        onChanged();
                      },
              ),
            const SizedBox(height: 4),
            if (form.sets.length < ConfigConstants.maxSetsPerExercise)
              OutlinedButton.icon(
                onPressed: () {
                  final last = form.sets.isEmpty ? null : form.sets.last;
                  final next = last?.copy() ?? WorkoutSetDraft();
                  next.isCompleted = false;
                  form.sets.add(next);
                  onChanged();
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add set'),
              ),
          ],
        ),
      ),
    );
  }
}

class _SetRow extends StatefulWidget {
  const _SetRow({
    super.key,
    required this.setNumber,
    required this.set,
    required this.columns,
    required this.showsDerivedSpeed,
    required this.onChanged,
    required this.onToggleComplete,
    this.onRemove,
  });

  final int setNumber;
  final WorkoutSetDraft set;
  final List<TrackedMetrics> columns;
  final bool showsDerivedSpeed;
  final VoidCallback onChanged;
  final VoidCallback onToggleComplete;
  final VoidCallback? onRemove;

  @override
  State<_SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<_SetRow> {
  final Map<TrackedMetrics, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (final metric in widget.columns) {
      _controllers[metric] =
          TextEditingController(text: _format(_read(metric)));
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  num? _read(TrackedMetrics metric) => switch (metric) {
        TrackedMetrics.weight => widget.set.weight,
        TrackedMetrics.reps => widget.set.reps,
        TrackedMetrics.duration => widget.set.durationSeconds,
        TrackedMetrics.distance => widget.set.distance,
        TrackedMetrics.speed => widget.set.speed,
      };

  void _write(TrackedMetrics metric, String text) {
    final value = double.tryParse(text.replaceAll(',', '.'));
    switch (metric) {
      case TrackedMetrics.weight:
        widget.set.weight = value;
      case TrackedMetrics.reps:
        widget.set.reps = value?.round();
      case TrackedMetrics.duration:
        widget.set.durationSeconds = value?.round();
      case TrackedMetrics.distance:
        widget.set.distance = value;
      case TrackedMetrics.speed:
        widget.set.speed = value;
    }
    if (widget.showsDerivedSpeed) {
      final distance = widget.set.distance;
      final seconds = widget.set.durationSeconds;
      widget.set.speed = (distance != null && (seconds ?? 0) > 0)
          ? distance / (seconds! / 3600.0)
          : null;
    }
    widget.onChanged();
  }

  String _format(num? value) {
    if (value == null) return '';
    if (value is int || value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completed = widget.set.isCompleted;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: InkWell(
              onTap: widget.onToggleComplete,
              customBorder: const CircleBorder(),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: completed
                    ? theme.customColors.success
                    : theme.colorScheme.surfaceContainerHighest,
                child: completed
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : Text('${widget.setNumber}',
                        style: theme.textTheme.titleSmall),
              ),
            ),
          ),
          for (final metric in widget.columns)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextField(
                  controller: _controllers[metric],
                  enabled: !completed,
                  textAlign: TextAlign.center,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) => _write(metric, text),
                ),
              ),
            ),
          SizedBox(
            width: 36,
            child: widget.onRemove == null
                ? null
                : IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close, size: 18),
                    onPressed: widget.onRemove,
                  ),
          ),
        ],
      ),
    );
  }
}

/// Read-only "previous performance" line, e.g. "135×8 · 135×8 · 140×6".
class PreviousSetsSummary extends ConsumerWidget {
  const PreviousSetsSummary({super.key, required this.sets});

  final List<WorkoutSetDraft> sets;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parts = sets.map((s) {
      if (s.weight != null && s.reps != null) {
        final weight = s.weight == s.weight!.roundToDouble()
            ? s.weight!.toInt().toString()
            : s.weight!.toStringAsFixed(1);
        return '$weight×${s.reps}';
      }
      if (s.distance != null || (s.durationSeconds ?? 0) > 0) {
        final distance = s.distance?.toStringAsFixed(1);
        final minutes = ((s.durationSeconds ?? 0) / 60).round();
        return [?distance, '${minutes}m'].join(' / ');
      }
      if (s.reps != null) return '×${s.reps}';
      if (s.durationSeconds != null) return '${s.durationSeconds}s';
      return '—';
    }).join(' · ');

    return Text(parts, style: Theme.of(context).textTheme.bodyMedium);
  }
}
