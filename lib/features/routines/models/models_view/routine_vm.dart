import 'package:equatable/equatable.dart';

import '../../../../core/taxonomy/body_part.dart';

/// One exercise instance inside a routine. [instanceId] is the routine
/// exercise row id — the same exercise can appear twice with independent
/// identity and history.
class RoutineExerciseVm extends Equatable {
  const RoutineExerciseVm({
    required this.instanceId,
    required this.userExerciseId,
    required this.name,
    required this.bodyPart,
    required this.position,
    this.notes,
  });

  final String instanceId;
  final String userExerciseId;
  final String name;
  final BodyPart bodyPart;
  final int position;
  final String? notes;

  @override
  List<Object?> get props =>
      [instanceId, userExerciseId, name, bodyPart, position, notes];
}

class RoutineVm extends Equatable {
  const RoutineVm({
    required this.id,
    required this.name,
    required this.isFavorite,
    required this.exercises,
    this.lastCompletedAt,
  });

  final String id;
  final String name;
  final bool isFavorite;
  final List<RoutineExerciseVm> exercises;
  final int? lastCompletedAt;

  @override
  List<Object?> get props => [id, name, isFavorite, exercises, lastCompletedAt];
}
