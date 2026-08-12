import 'package:fitness_buddy/core/data/database.dart';
import 'package:fitness_buddy/features/routines/models/models_dto/routine_draft.dart';
import 'package:fitness_buddy/features/routines/use_case_utils/routine_input_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

RoutineExerciseRow _row(String id, String userExerciseId, int position,
        {String? notes}) =>
    RoutineExerciseRow(
      id: id,
      userId: 'local',
      routineId: 'r1',
      userExerciseId: userExerciseId,
      exPosition: position,
      notes: notes,
    );

void main() {
  test('pure reorder produces only updates with re-stamped positions', () {
    final existing = [_row('a', 'ue1', 0), _row('b', 'ue2', 1)];
    final diff = RoutineInputMapper.computeMergeDiff(
      userId: 'local',
      routineId: 'r1',
      existing: existing,
      drafts: const [
        RoutineExerciseDraft(instanceId: 'b', userExerciseId: 'ue2', name: 'B'),
        RoutineExerciseDraft(instanceId: 'a', userExerciseId: 'ue1', name: 'A'),
      ],
    );
    expect(diff.toInsert, isEmpty);
    expect(diff.toDelete, isEmpty);
    expect(diff.toUpdate, hasLength(2));
    expect(diff.toUpdate.first.id.value, 'b');
    expect(diff.toUpdate.first.exPosition.value, 0);
    expect(diff.toUpdate.last.id.value, 'a');
    expect(diff.toUpdate.last.exPosition.value, 1);
  });

  test('remove one, add same exercise twice as new instances', () {
    final existing = [_row('a', 'ue1', 0)];
    final diff = RoutineInputMapper.computeMergeDiff(
      userId: 'local',
      routineId: 'r1',
      existing: existing,
      drafts: const [
        RoutineExerciseDraft(userExerciseId: 'ue2', name: 'B'),
        RoutineExerciseDraft(userExerciseId: 'ue2', name: 'B'),
      ],
    );
    expect(diff.toDelete, ['a']);
    expect(diff.toInsert, hasLength(2));
    // Distinct instance ids even for the same exercise.
    expect(diff.toInsert[0].id.value, isNot(diff.toInsert[1].id.value));
    expect(diff.toInsert[0].exPosition.value, 0);
    expect(diff.toInsert[1].exPosition.value, 1);
  });

  test('unchanged list is a no-op diff', () {
    final existing = [_row('a', 'ue1', 0, notes: 'n'), _row('b', 'ue2', 1)];
    final diff = RoutineInputMapper.computeMergeDiff(
      userId: 'local',
      routineId: 'r1',
      existing: existing,
      drafts: const [
        RoutineExerciseDraft(
            instanceId: 'a', userExerciseId: 'ue1', name: 'A', notes: 'n'),
        RoutineExerciseDraft(instanceId: 'b', userExerciseId: 'ue2', name: 'B'),
      ],
    );
    expect(diff.toInsert, isEmpty);
    expect(diff.toUpdate, isEmpty);
    expect(diff.toDelete, isEmpty);
  });

  test('notes-only change produces an update', () {
    final existing = [_row('a', 'ue1', 0, notes: 'old')];
    final diff = RoutineInputMapper.computeMergeDiff(
      userId: 'local',
      routineId: 'r1',
      existing: existing,
      drafts: const [
        RoutineExerciseDraft(
            instanceId: 'a', userExerciseId: 'ue1', name: 'A', notes: 'new'),
      ],
    );
    expect(diff.toUpdate, hasLength(1));
    expect(diff.toUpdate.single.notes.value, 'new');
  });

  test('duplicate naming appends (Copy), then (Copy N)', () {
    expect(RoutineInputMapper.duplicateName('Push', {}), 'Push (Copy)');
    expect(RoutineInputMapper.duplicateName('Push', {'Push (Copy)'}),
        'Push (Copy 2)');
    expect(
        RoutineInputMapper.duplicateName(
            'Push', {'Push (Copy)', 'Push (Copy 2)'}),
        'Push (Copy 3)');
  });
}
