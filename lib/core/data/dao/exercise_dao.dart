import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/cardio_profile_table.dart';
import '../tables/exercise_table.dart';
import '../tables/progression_policy_table.dart';
import '../tables/strength_profile_table.dart';
import '../tables/user_exercise_table.dart';

part 'exercise_dao.g.dart';

/// One joined row of the user's catalog view.
class UserExerciseJoinedRow {
  UserExerciseJoinedRow({
    required this.exercise,
    required this.userExercise,
    this.strengthProfile,
    this.cardioProfile,
    this.progressionPolicy,
  });

  final ExerciseRow exercise;
  final UserExerciseRow userExercise;
  final StrengthProfileRow? strengthProfile;
  final CardioProfileRow? cardioProfile;
  final ProgressionPolicyRow? progressionPolicy;
}

@DriftAccessor(tables: [
  ExerciseTable,
  UserExerciseTable,
  StrengthProfileTable,
  CardioProfileTable,
  ProgressionPolicyTable,
])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  ExerciseDao(super.db);

  // --- catalog (seeding) ---

  Future<List<ExerciseRow>> getSystemExercises() =>
      (select(exerciseTable)..where((t) => t.ownerUserId.isNull())).get();

  Future<void> upsertExercise(ExerciseTableCompanion row) =>
      into(exerciseTable).insertOnConflictUpdate(row);

  // --- user link rows ---

  Future<List<UserExerciseRow>> getUserExercises(String userId) =>
      (select(userExerciseTable)
            ..where((t) => t.userId.equals(userId) & t.deletedOn.isNull()))
          .get();

  Future<UserExerciseRow?> getUserExerciseById(String id) =>
      (select(userExerciseTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertUserExercise(UserExerciseTableCompanion row) =>
      into(userExerciseTable).insertOnConflictUpdate(row);

  Future<void> upsertStrengthProfile(StrengthProfileTableCompanion row) =>
      into(strengthProfileTable).insertOnConflictUpdate(row);

  Future<void> upsertCardioProfile(CardioProfileTableCompanion row) =>
      into(cardioProfileTable).insertOnConflictUpdate(row);

  Future<void> upsertProgressionPolicy(ProgressionPolicyTableCompanion row) =>
      into(progressionPolicyTable).insertOnConflictUpdate(row);

  Future<void> markLastPerformed(String userExerciseId, int epochMs) =>
      (update(userExerciseTable)..where((t) => t.id.equals(userExerciseId)))
          .write(UserExerciseTableCompanion(lastPerformedAt: Value(epochMs)));

  Future<void> setFavorite(String userExerciseId, bool isFavorite) =>
      (update(userExerciseTable)..where((t) => t.id.equals(userExerciseId)))
          .write(UserExerciseTableCompanion(isFavorite: Value(isFavorite)));

  Future<void> softDeleteUserExercise(String userExerciseId, int epochMs) =>
      (update(userExerciseTable)..where((t) => t.id.equals(userExerciseId)))
          .write(UserExerciseTableCompanion(deletedOn: Value(epochMs)));

  // --- joined catalog reads (filter/sort pushed into SQL by callers) ---

  Stream<List<UserExerciseJoinedRow>> watchUserExerciseJoinedRows(
    String userId, {
    Expression<bool> Function(
            $ExerciseTableTable ex, $UserExerciseTableTable ue)?
        where,
  }) {
    final query = select(userExerciseTable).join([
      innerJoin(
          exerciseTable, exerciseTable.id.equalsExp(userExerciseTable.exerciseId)),
      leftOuterJoin(
          strengthProfileTable,
          strengthProfileTable.userExerciseId
              .equalsExp(userExerciseTable.id)),
      leftOuterJoin(cardioProfileTable,
          cardioProfileTable.userExerciseId.equalsExp(userExerciseTable.id)),
      leftOuterJoin(
          progressionPolicyTable,
          progressionPolicyTable.userExerciseId
              .equalsExp(userExerciseTable.id)),
    ])
      ..where(userExerciseTable.userId.equals(userId) &
          userExerciseTable.deletedOn.isNull() &
          (where?.call(exerciseTable, userExerciseTable) ??
              const Constant(true)));

    return query.watch().map((rows) => rows
        .map((r) => UserExerciseJoinedRow(
              exercise: r.readTable(exerciseTable),
              userExercise: r.readTable(userExerciseTable),
              strengthProfile: r.readTableOrNull(strengthProfileTable),
              cardioProfile: r.readTableOrNull(cardioProfileTable),
              progressionPolicy: r.readTableOrNull(progressionPolicyTable),
            ))
        .toList());
  }

  Future<UserExerciseJoinedRow?> getFullUserExercise(
      String userExerciseId) async {
    final r = await (select(userExerciseTable).join([
      innerJoin(exerciseTable,
          exerciseTable.id.equalsExp(userExerciseTable.exerciseId)),
      leftOuterJoin(strengthProfileTable,
          strengthProfileTable.userExerciseId.equalsExp(userExerciseTable.id)),
      leftOuterJoin(cardioProfileTable,
          cardioProfileTable.userExerciseId.equalsExp(userExerciseTable.id)),
      leftOuterJoin(
          progressionPolicyTable,
          progressionPolicyTable.userExerciseId
              .equalsExp(userExerciseTable.id)),
    ])
          ..where(userExerciseTable.id.equals(userExerciseId)))
        .getSingleOrNull();
    if (r == null) return null;
    return UserExerciseJoinedRow(
      exercise: r.readTable(exerciseTable),
      userExercise: r.readTable(userExerciseTable),
      strengthProfile: r.readTableOrNull(strengthProfileTable),
      cardioProfile: r.readTableOrNull(cardioProfileTable),
      progressionPolicy: r.readTableOrNull(progressionPolicyTable),
    );
  }
}
