import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/config_constants.dart';
import '../../../core/data/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/theme/app_custom_colors.dart';
import '../models/models_dto/workout_input_bundle.dart';
import '../models/models_dto/workout_set_draft.dart';
import '../providers/workout_providers.dart';
import '../widgets/adaptive_set_form.dart';
import 'workout_summary_screen.dart';

/// Live workout session. In-progress state is in-memory, owned by this
/// widget tree; durability is the 500 ms debounced draft autosave plus a
/// lifecycle sweep (doc §8.3). History is only written by the finish
/// pipeline.
class WorkoutExecutionScreen extends ConsumerStatefulWidget {
  const WorkoutExecutionScreen({super.key, required this.bundle});

  final WorkoutExecutionInputBundle bundle;

  @override
  ConsumerState<WorkoutExecutionScreen> createState() =>
      _WorkoutExecutionScreenState();
}

class ExerciseFormState {
  ExerciseFormState(this.data)
      : sets = data.draftPayload != null
            ? data.draftPayload!.sets.map((s) => s.copy()).toList()
            : data.prepopulatedSets.map((s) => s.copy()).toList(),
        isSkipped = data.draftPayload?.isSkipped ?? false,
        isCompleted = data.draftPayload?.isCompleted ?? false;

  final PreloadedExerciseData data;
  final List<WorkoutSetDraft> sets;
  bool isSkipped;
  bool isCompleted;
}

class _WorkoutExecutionScreenState extends ConsumerState<WorkoutExecutionScreen>
    with WidgetsBindingObserver {
  late final List<ExerciseFormState> _forms =
      widget.bundle.exercises.map(ExerciseFormState.new).toList();
  late final int _startedAt = widget.bundle.resumedStartedAt ??
      DateTime.now().millisecondsSinceEpoch;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  Timer? _elapsedTimer;
  String _elapsedLabel = '0:00';

  Timer? _autosaveTimer;
  final Set<int> _dirty = {};

  Timer? _restTimer;
  int _restSecondsLeft = 0;
  int _lastRestPreset = 90;

  bool _finishing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _elapsedTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final seconds =
          (DateTime.now().millisecondsSinceEpoch - _startedAt) ~/ 1000;
      final label = seconds >= 3600
          ? '${seconds ~/ 3600}:${(seconds % 3600 ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}'
          : '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
      if (label != _elapsedLabel) setState(() => _elapsedLabel = label);
    });
    // Persist initial rows so a crash before any edit is still resumable.
    WidgetsBinding.instance.addPostFrameCallback((_) => _saveAllDrafts());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _elapsedTimer?.cancel();
    _autosaveTimer?.cancel();
    _restTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) _saveAllDrafts();
  }

  // ---- draft durability ----

  void _markDirty(int index) {
    _dirty.add(index);
    _autosaveTimer?.cancel();
    _autosaveTimer =
        Timer(ConfigConstants.draftAutosaveDebounce, _flushDirtyDrafts);
  }

  Future<void> _flushDirtyDrafts() async {
    final indices = _dirty.toList();
    _dirty.clear();
    for (final i in indices) {
      await _saveDraft(i);
    }
  }

  Future<void> _saveDraft(int index) async {
    final form = _forms[index];
    final payload = ExerciseDraftPayload(
      sets: form.sets,
      isSkipped: form.isSkipped,
      isCompleted: form.isCompleted,
    );
    await ref.read(databaseProvider).workoutDraftDao.upsertDraft(
          ActiveWorkoutDraftTableCompanion.insert(
            userId: widget.bundle.userId,
            routineId: widget.bundle.routineId,
            userExerciseId: form.data.exercise.id,
            startedAt: _startedAt,
            payloadJson: payload.toJson(),
          ),
        );
  }

  Future<void> _saveAllDrafts() async {
    for (var i = 0; i < _forms.length; i++) {
      await _saveDraft(i);
    }
  }

  // ---- rest timer (in-app countdown, single active) ----

  void _startRest(int seconds) {
    _restTimer?.cancel();
    setState(() {
      _lastRestPreset = seconds;
      _restSecondsLeft = seconds;
    });
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restSecondsLeft <= 1) {
        timer.cancel();
        setState(() => _restSecondsLeft = 0);
      } else {
        setState(() => _restSecondsLeft--);
      }
    });
  }

  // ---- finish ----

  Future<void> _finish() async {
    final results = [
      for (final form in _forms)
        CompletedExerciseResult(
          data: form.data,
          completedSets: form.sets
              .where((s) => s.isCompleted && s.hasAnyValue)
              .toList(),
          wasSkipped: form.isSkipped,
        ),
    ];
    final anyCompleted =
        results.any((r) => !r.wasSkipped && r.completedSets.isNotEmpty);
    if (!anyCompleted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Complete at least one set (tap its number).')));
      return;
    }

    setState(() => _finishing = true);
    final durationSeconds =
        (DateTime.now().millisecondsSinceEpoch - _startedAt) ~/ 1000;
    final res = await ref.read(finishWorkoutUseCaseProvider).processWorkout(
          bundle: widget.bundle,
          results: results,
          durationSeconds: durationSeconds,
        );

    if (!mounted) return;
    setState(() => _finishing = false);
    if (res.isOk) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => WorkoutSummaryScreen(summary: res.value)),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(res.errorMessage)));
    }
  }

  Future<void> _confirmLeave() async {
    final action = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave workout?'),
        content: const Text(
            'Your sets are saved as a draft — you can resume from the home '
            'screen, or discard the session entirely.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, 'cancel'),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, 'discard'),
              child: const Text('Discard')),
          FilledButton(
              onPressed: () => Navigator.pop(context, 'keep'),
              child: const Text('Keep draft')),
        ],
      ),
    );
    if (!mounted || action == null || action == 'cancel') return;
    if (action == 'discard') {
      await ref
          .read(databaseProvider)
          .workoutDraftDao
          .clearDrafts(widget.bundle.userId);
    } else {
      await _saveAllDrafts();
    }
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmLeave();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.bundle.routineName ?? 'Workout'),
          leading: IconButton(
              icon: const Icon(Icons.close), onPressed: _confirmLeave),
          actions: [
            if (_restSecondsLeft > 0)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Chip(
                    avatar: const Icon(Icons.timer_outlined, size: 18),
                    label: Text(
                        'Rest ${_restSecondsLeft ~/ 60}:${(_restSecondsLeft % 60).toString().padLeft(2, '0')}'),
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child:
                    Text(_elapsedLabel, style: theme.textTheme.titleMedium),
              ),
            ),
          ],
        ),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (page) {
            _flushDirtyDrafts();
            setState(() => _currentPage = page);
          },
          itemCount: _forms.length,
          itemBuilder: (context, i) => _ExercisePage(
            form: _forms[i],
            onChanged: () => _markDirty(i),
            onCompleteSetRest: () => _startRest(_lastRestPreset),
            onStartRest: _startRest,
            onToggleExerciseComplete: () {
              setState(() =>
                  _forms[i].isCompleted = !_forms[i].isCompleted);
              _markDirty(i);
            },
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Row(
              children: [
                Text('${_currentPage + 1} / ${_forms.length}',
                    style: theme.textTheme.titleSmall),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: (_currentPage + 1) / _forms.length,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 12),
                FilledButton.icon(
                  onPressed: _finishing ? null : _finish,
                  icon: _finishing
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.flag),
                  label: const Text('Finish'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExercisePage extends StatefulWidget {
  const _ExercisePage({
    required this.form,
    required this.onChanged,
    required this.onStartRest,
    required this.onCompleteSetRest,
    required this.onToggleExerciseComplete,
  });

  final ExerciseFormState form;
  final VoidCallback onChanged;
  final ValueChanged<int> onStartRest;
  final VoidCallback onCompleteSetRest;
  final VoidCallback onToggleExerciseComplete;

  @override
  State<_ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<_ExercisePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final form = widget.form;
    final exercise = form.data.exercise;

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name, style: theme.textTheme.titleLarge),
                  Text(
                    '${exercise.bodyPart.label} · ${exercise.modalityLabel}'
                    '${form.data.autoIncrementApplied ? '  ·  ▲ progressed' : ''}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 32,
              tooltip: 'Mark exercise done',
              icon: Icon(
                form.isCompleted
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                color: form.isCompleted
                    ? theme.customColors.success
                    : theme.customColors.subduedText,
              ),
              onPressed: widget.onToggleExerciseComplete,
            ),
          ],
        ),
        if (form.data.routineNotes != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text('Note: ${form.data.routineNotes}',
                style: theme.textTheme.bodySmall),
          ),
        const SizedBox(height: 8),
        AdaptiveSetForm(
          form: form,
          onChanged: () {
            setState(() {});
            widget.onChanged();
          },
          onSetCompleted: widget.onCompleteSetRest,
        ),
        const SizedBox(height: 12),
        Text('Rest timer', style: theme.textTheme.titleSmall),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          children: [
            for (final seconds in ConfigConstants.restTimerPresetsSeconds)
              ActionChip(
                label: Text('${seconds}s'),
                onPressed: () => widget.onStartRest(seconds),
              ),
          ],
        ),
        if (form.data.previousSets.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text('Previous', style: theme.textTheme.titleSmall),
          const SizedBox(height: 4),
          PreviousSetsSummary(sets: form.data.previousSets),
        ],
      ],
    );
  }
}
