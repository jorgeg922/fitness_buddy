import 'package:drift/drift.dart';

import '../../../../core/data/database.dart';
import '../../../../core/taxonomy/cardio_modality.dart';
import '../../../../core/taxonomy/exercise_category.dart';
import '../../../../core/taxonomy/strength_modality.dart';

/// Write side: every mutation is one transaction over the whole aggregate.
class ExerciseRepository {
  ExerciseRepository(this._db);

  final AppDatabase _db;

  Future<void> createCustomExercise({
    required String exerciseId,
    required String userExerciseId,
    required String userId,
    required String name,
    required ExerciseCategory category,
    required String bodyPartName,
    StrengthModality? strengthModality,
    CardioModality? cardioModality,
    String? notes,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return _db.transaction(() async {
      await _db.exerciseDao.upsertExercise(ExerciseTableCompanion.insert(
        id: exerciseId,
        ownerUserId: Value(userId),
        name: name,
        category: category.name,
        bodyPart: bodyPartName,
        createdAt: now,
      ));
      await _db.exerciseDao.upsertUserExercise(UserExerciseTableCompanion.insert(
        id: userExerciseId,
        userId: userId,
        exerciseId: exerciseId,
        createdAt: now,
        notes: Value(notes),
      ));
      if (category == ExerciseCategory.strength) {
        await _db.exerciseDao
            .upsertStrengthProfile(StrengthProfileTableCompanion.insert(
          userExerciseId: userExerciseId,
          strengthModality:
              (strengthModality ?? StrengthModality.weighted).name,
        ));
      } else {
        await _db.exerciseDao
            .upsertCardioProfile(CardioProfileTableCompanion.insert(
          userExerciseId: userExerciseId,
          cardioModality: (cardioModality ?? CardioModality.endurance).name,
        ));
      }
      await _db.exerciseDao.upsertProgressionPolicy(
          ProgressionPolicyTableCompanion.insert(
              userExerciseId: userExerciseId));
    });
  }

  /// Only name/bodyPart/modality/notes are editable; category is fixed after
  /// creation (history depends on its metric shape).
  Future<void> updateCustomExercise({
    required String exerciseId,
    required String userExerciseId,
    required String name,
    required String bodyPartName,
    StrengthModality? strengthModality,
    CardioModality? cardioModality,
    String? notes,
  }) {
    return _db.transaction(() async {
      await (_db.update(_db.exerciseTable)
            ..where((t) => t.id.equals(exerciseId)))
          .write(ExerciseTableCompanion(
        name: Value(name),
        bodyPart: Value(bodyPartName),
      ));
      await (_db.update(_db.userExerciseTable)
            ..where((t) => t.id.equals(userExerciseId)))
          .write(UserExerciseTableCompanion(notes: Value(notes)));
      if (strengthModality != null) {
        await (_db.update(_db.strengthProfileTable)
              ..where((t) => t.userExerciseId.equals(userExerciseId)))
            .write(StrengthProfileTableCompanion(
                strengthModality: Value(strengthModality.name)));
      }
      if (cardioModality != null) {
        await (_db.update(_db.cardioProfileTable)
              ..where((t) => t.userExerciseId.equals(userExerciseId)))
            .write(CardioProfileTableCompanion(
                cardioModality: Value(cardioModality.name)));
      }
    });
  }

  /// Soft delete — history referencing the user-exercise stays intact.
  Future<void> softDelete(String userExerciseId) =>
      _db.exerciseDao.softDeleteUserExercise(
          userExerciseId, DateTime.now().millisecondsSinceEpoch);

  Future<void> setFavorite(String userExerciseId, bool isFavorite) =>
      _db.exerciseDao.setFavorite(userExerciseId, isFavorite);

  Future<void> updateNotes(String userExerciseId, String? notes) =>
      (_db.update(_db.userExerciseTable)
            ..where((t) => t.id.equals(userExerciseId)))
          .write(UserExerciseTableCompanion(notes: Value(notes)));
}
