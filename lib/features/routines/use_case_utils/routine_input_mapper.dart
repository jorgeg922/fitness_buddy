import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/data/database.dart';
import '../models/models_dto/routine_draft.dart';

/// The merge diff a routine update persists in one transaction.
class RoutineMergeDto {
  const RoutineMergeDto({
    required this.toInsert,
    required this.toUpdate,
    required this.toDelete,
  });

  final List<RoutineExerciseTableCompanion> toInsert;
  final List<RoutineExerciseTableCompanion> toUpdate;
  final List<String> toDelete;
}

abstract final class RoutineInputMapper {
  /// Diffs the edited draft list against the persisted instance rows.
  /// Positions are re-stamped from list order; drafts without an instanceId
  /// become inserts; persisted ids missing from the drafts become deletes.
  static RoutineMergeDto computeMergeDiff({
    required String userId,
    required String routineId,
    required List<RoutineExerciseRow> existing,
    required List<RoutineExerciseDraft> drafts,
  }) {
    const uuid = Uuid();
    final existingById = {for (final row in existing) row.id: row};
    final keptIds = <String>{};
    final toInsert = <RoutineExerciseTableCompanion>[];
    final toUpdate = <RoutineExerciseTableCompanion>[];

    for (var position = 0; position < drafts.length; position++) {
      final draft = drafts[position];
      final instanceId = draft.instanceId;
      final persisted = instanceId == null ? null : existingById[instanceId];

      if (persisted == null) {
        toInsert.add(RoutineExerciseTableCompanion.insert(
          id: instanceId ?? uuid.v4(),
          userId: userId,
          routineId: routineId,
          userExerciseId: draft.userExerciseId,
          exPosition: position,
          notes: Value(draft.notes),
        ));
      } else {
        keptIds.add(persisted.id);
        if (persisted.exPosition != position ||
            persisted.notes != draft.notes) {
          toUpdate.add(RoutineExerciseTableCompanion(
            id: Value(persisted.id),
            exPosition: Value(position),
            notes: Value(draft.notes),
          ));
        }
      }
    }

    final toDelete = existing
        .map((row) => row.id)
        .where((id) => !keptIds.contains(id))
        .toList();

    return RoutineMergeDto(
        toInsert: toInsert, toUpdate: toUpdate, toDelete: toDelete);
  }

  /// "(Copy)" then "(Copy 2)", "(Copy 3)"… against the user's existing names.
  static String duplicateName(String baseName, Set<String> existingNames) {
    var candidate = '$baseName (Copy)';
    var n = 2;
    while (existingNames.contains(candidate)) {
      candidate = '$baseName (Copy $n)';
      n++;
    }
    return candidate;
  }
}
