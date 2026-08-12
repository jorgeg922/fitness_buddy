import '../../../core/data/database.dart';
import '../../../core/taxonomy/tracked_metrics.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/unit_converter.dart';
import '../../exercises/models/models_view/exercise_vm.dart';
import '../models/models_dto/workout_input_bundle.dart';
import '../models/models_dto/workout_set_draft.dart';
import 'auto_increment_service.dart';

/// One query pass that assembles everything the execution screen needs
/// (doc §8.2). Three entry modes converge here: routine, ad-hoc, resume.
class WorkoutBundleLoader {
  WorkoutBundleLoader(this._db, this._ms);

  final AppDatabase _db;
  final MeasurementSystem _ms;

  Future<WorkoutExecutionInputBundle> loadForRoutine(
      String userId, String routineId, String routineName) async {
    final routineExercises =
        await _db.routineDao.getRoutineExercises(routineId);
    final exercises = <PreloadedExerciseData>[];
    for (final re in routineExercises) {
      final data = await _loadExercise(re.userExerciseId,
          routineExerciseId: re.id, routineNotes: re.notes);
      if (data != null) exercises.add(data);
    }
    return WorkoutExecutionInputBundle(
      userId: userId,
      routineId: routineId,
      routineName: routineName,
      exercises: exercises,
    );
  }

  Future<WorkoutExecutionInputBundle> loadAdhoc(
      String userId, String userExerciseId) async {
    final data = await _loadExercise(userExerciseId);
    return WorkoutExecutionInputBundle(
      userId: userId,
      routineId: adHocRoutineId,
      exercises: [?data],
    );
  }

  /// Rehydrates from the draft table after a crash/kill. The draft rows
  /// carry the sets; prepop/previous still come from history.
  Future<WorkoutExecutionInputBundle?> loadResume(String userId) async {
    final drafts = await _db.workoutDraftDao.getDrafts(userId);
    if (drafts.isEmpty) return null;

    final routineId = drafts.first.routineId;
    String? routineName;
    if (routineId != adHocRoutineId) {
      routineName = (await _db.routineDao.getRoutine(routineId))?.name;
    }

    final exercises = <PreloadedExerciseData>[];
    for (final draft in drafts) {
      final data = await _loadExercise(
        draft.userExerciseId,
        draftPayload: ExerciseDraftPayload.fromJson(draft.payloadJson),
      );
      if (data != null) exercises.add(data);
    }
    if (exercises.isEmpty) return null;

    return WorkoutExecutionInputBundle(
      userId: userId,
      routineId: routineId,
      routineName: routineName,
      exercises: exercises,
      resumedStartedAt: drafts
          .map((d) => d.startedAt)
          .reduce((a, b) => a < b ? a : b),
    );
  }

  Future<PreloadedExerciseData?> _loadExercise(
    String userExerciseId, {
    String? routineExerciseId,
    String? routineNotes,
    ExerciseDraftPayload? draftPayload,
  }) async {
    final joined = await _db.exerciseDao.getFullUserExercise(userExerciseId);
    if (joined == null) return null;
    final vm = joined.toVm();

    // Last performance → previous display + prepopulation seed.
    final lastPerformance =
        await _db.historyDao.getLatestPerformance(userExerciseId);
    var previousSets = <WorkoutSetDraft>[];
    if (lastPerformance != null) {
      final rows =
          await _db.historyDao.getSetsForPerformance(lastPerformance.id);
      previousSets = rows.map(_setFromLog).toList();
    }

    final aggregate = await _db.statsDao.getAggregate(userExerciseId);
    final timesCompleted = aggregate?.timesCompleted ?? 0;

    var prepopulated = previousSets.map((s) => s.copy()).toList();
    for (final set in prepopulated) {
      set.isCompleted = false;
    }
    if (prepopulated.isEmpty) {
      prepopulated = _defaultSets(vm);
    }

    var autoIncrementApplied = false;
    final policy = joined.progressionPolicy;
    if (policy != null &&
        vm.supportsAutoIncrement &&
        AutoIncrementServiceBridge.shouldAdvance(policy, timesCompleted)) {
      prepopulated = AutoIncrementServiceBridge.advance(
          prepopulated, policy, _ms);
      autoIncrementApplied = true;
    }

    return PreloadedExerciseData(
      exercise: vm,
      prepopulatedSets: prepopulated,
      previousSets: previousSets,
      routineExerciseId: routineExerciseId,
      routineNotes: routineNotes,
      timesCompleted: timesCompleted,
      autoIncrementApplied: autoIncrementApplied,
      draftPayload: draftPayload,
    );
  }

  /// Stored log values are imperial; convert to user units for display.
  WorkoutSetDraft _setFromLog(SetLogRow row) => WorkoutSetDraft(
        weight: row.weight == null
            ? null
            : UnitConverter.weightToUserMs(row.weight!, _ms),
        reps: row.reps,
        durationSeconds: row.durationSeconds,
        distance: row.distance == null
            ? null
            : UnitConverter.distanceToUserMs(row.distance!, _ms),
        speed: row.speed == null
            ? null
            : UnitConverter.speedToUserMs(row.speed!, _ms),
        restTimeSeconds: row.restTimeSeconds,
        isCompleted: true,
      );

  List<WorkoutSetDraft> _defaultSets(ExerciseVm vm) {
    final metrics = vm.strengthModality?.supportedMetrics ??
        vm.cardioModality?.supportedMetrics ??
        const <TrackedMetrics>{};
    // Cardio endurance is a single "set"; everything else starts with 3.
    final count = metrics.contains(TrackedMetrics.distance) ? 1 : 3;
    return List.generate(count, (_) => WorkoutSetDraft());
  }
}

/// Thin indirection so the loader stays testable without duplicating the
/// unit-conversion of policy deltas everywhere.
abstract final class AutoIncrementServiceBridge {
  static bool shouldAdvance(ProgressionPolicyRow policy, int timesCompleted) =>
      AutoIncrementService.shouldAdvance(policy, timesCompleted);

  static List<WorkoutSetDraft> advance(List<WorkoutSetDraft> sets,
      ProgressionPolicyRow policy, MeasurementSystem ms) {
    return AutoIncrementService.advance(
      sets,
      policy,
      weightDeltaInUserMs: ms == MeasurementSystem.us
          ? policy.weightDelta
          : UnitConverter.lbToKg(policy.weightDelta),
      distanceDeltaInUserMs: ms == MeasurementSystem.us
          ? policy.distanceDelta
          : UnitConverter.miToKm(policy.distanceDelta),
    );
  }
}
