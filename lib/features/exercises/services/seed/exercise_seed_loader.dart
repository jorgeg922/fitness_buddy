import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/data/database.dart';
import '../../../../core/taxonomy/cardio_modality.dart';
import '../../../../core/taxonomy/exercise_category.dart';
import '../../../../core/taxonomy/strength_modality.dart';

/// Versioned-upsert seeding (doc §6):
/// - Exercises missing from the DB are ALWAYS inserted (new content reaches
///   old installs without a version bump).
/// - Existing rows are only re-upserted when assetVersion > storedVersion,
///   and corrections propagate into per-user profile rows.
/// - One transaction; the version marker is written last.
/// - Fail open: a bad asset logs and returns, never bricks startup.
class ExerciseSeedLoader {
  ExerciseSeedLoader(this._db);

  static const _versionKey = 'system_exercises_version';
  static const _assetPath = 'assets/data/system_exercises.json';
  static final _log = Logger('ExerciseSeedLoader');

  final AppDatabase _db;

  Future<void> loadSystemExercises() async {
    try {
      final raw = await rootBundle.loadString(_assetPath);
      final envelope = jsonDecode(raw) as Map<String, dynamic>;
      final assetVersion = envelope['version'] as int;
      final entries = (envelope['system_exercises'] as List)
          .cast<Map<String, dynamic>>()
          .map(SeedExercise.fromJson)
          .toList();

      final storedVersion =
          int.tryParse(await _db.appMetadataDao.getValue(_versionKey) ?? '') ??
              0;
      final isUpgrade = assetVersion > storedVersion;

      final existingIds =
          (await _db.exerciseDao.getSystemExercises()).map((e) => e.id).toSet();

      await _db.transaction(() async {
        final toWrite = entries
            .where((seed) => isUpgrade || !existingIds.contains(seed.id))
            .map((seed) => seed.toCompanion())
            .toList();
        await _db.batch((b) => b.insertAllOnConflictUpdate(
            _db.exerciseTable, toWrite));
        if (isUpgrade) {
          for (final seed in entries.where(
              (seed) => existingIds.contains(seed.id))) {
            await _propagateProfileCorrections(seed);
          }
          await _db.appMetadataDao.setValue(_versionKey, '$assetVersion');
        }
      });
    } catch (e, st) {
      _log.severe('System exercise seed failed — continuing without', e, st);
    }
  }

  /// On a version bump, push corrected modality/multiplier into every user's
  /// profile rows for this exercise.
  Future<void> _propagateProfileCorrections(SeedExercise seed) async {
    final links = await (_db.select(_db.userExerciseTable)
          ..where((t) => t.exerciseId.equals(seed.id)))
        .get();
    for (final link in links) {
      if (seed.strengthModality != null) {
        await (_db.update(_db.strengthProfileTable)
              ..where((t) => t.userExerciseId.equals(link.id)))
            .write(StrengthProfileTableCompanion(
          strengthModality: Value(seed.strengthModality!.name),
          volumeMultiplier: Value(seed.volumeMultiplier),
        ));
      }
      if (seed.cardioModality != null) {
        await (_db.update(_db.cardioProfileTable)
              ..where((t) => t.userExerciseId.equals(link.id)))
            .write(CardioProfileTableCompanion(
          cardioModality: Value(seed.cardioModality!.name),
        ));
      }
    }
  }

  /// Phase 2 of per-user seeding: one user_exercise + profile + progression
  /// policy per catalog exercise the user isn't linked to yet.
  Future<void> linkSystemExercisesToUser(String userId) async {
    try {
      final system = await _db.exerciseDao.getSystemExercises();
      final linked = (await (_db.select(_db.userExerciseTable)
                ..where((t) => t.userId.equals(userId)))
              .get())
          .map((r) => r.exerciseId)
          .toSet();
      final now = DateTime.now().millisecondsSinceEpoch;
      const uuid = Uuid();

      // Re-read seed JSON for modality/multiplier (they live in profiles,
      // not exercise_table).
      final raw = await rootBundle.loadString(_assetPath);
      final envelope = jsonDecode(raw) as Map<String, dynamic>;
      final seedById = {
        for (final e in (envelope['system_exercises'] as List)
            .cast<Map<String, dynamic>>()
            .map(SeedExercise.fromJson))
          e.id: e,
      };

      // Build all rows first, then land them in three batch inserts — one
      // row-per-await was painfully slow through the background isolate.
      final userExercises = <UserExerciseTableCompanion>[];
      final strengthProfiles = <StrengthProfileTableCompanion>[];
      final cardioProfiles = <CardioProfileTableCompanion>[];
      final policies = <ProgressionPolicyTableCompanion>[];

      for (final exercise in system) {
        if (linked.contains(exercise.id)) continue;
        final seed = seedById[exercise.id];
        final userExerciseId = uuid.v4();

        userExercises.add(UserExerciseTableCompanion.insert(
          id: userExerciseId,
          userId: userId,
          exerciseId: exercise.id,
          createdAt: now,
        ));

        final category = ExerciseCategory.parse(exercise.category);
        if (category == ExerciseCategory.strength) {
          strengthProfiles.add(StrengthProfileTableCompanion.insert(
            userExerciseId: userExerciseId,
            strengthModality:
                (seed?.strengthModality ?? StrengthModality.weighted).name,
            volumeMultiplier: Value(seed?.volumeMultiplier ?? 1.0),
          ));
        } else {
          cardioProfiles.add(CardioProfileTableCompanion.insert(
            userExerciseId: userExerciseId,
            cardioModality:
                (seed?.cardioModality ?? CardioModality.endurance).name,
          ));
        }

        policies.add(ProgressionPolicyTableCompanion.insert(
            userExerciseId: userExerciseId));
      }

      if (userExercises.isEmpty) return;
      await _db.transaction(() async {
        await _db.batch((b) {
          b.insertAllOnConflictUpdate(_db.userExerciseTable, userExercises);
          b.insertAllOnConflictUpdate(
              _db.strengthProfileTable, strengthProfiles);
          b.insertAllOnConflictUpdate(_db.cardioProfileTable, cardioProfiles);
          b.insertAllOnConflictUpdate(_db.progressionPolicyTable, policies);
        });
      });
    } catch (e, st) {
      _log.severe('Linking system exercises failed', e, st);
    }
  }

  /// Two starter routines, guarded by routine-count == 0. Must run after
  /// [linkSystemExercisesToUser]: routine rows reference user_exercise ids.
  Future<void> generateSampleRoutinesForUser(String userId) async {
    try {
      if (await _db.routineDao.countRoutines(userId) > 0) return;

      final raw = await rootBundle.loadString('assets/data/sample_routines.json');
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final routines = (data['sample_routines'] as List).cast<Map<String, dynamic>>();
      final links =
          (data['sample_routine_exercises'] as List).cast<Map<String, dynamic>>();

      // exercise_id in the JSON is the SYSTEM exercise id; resolve through
      // the user's link rows.
      final userExercises = await (_db.select(_db.userExerciseTable)
            ..where((t) => t.userId.equals(userId)))
          .get();
      final userExerciseBySystemId = {
        for (final ue in userExercises) ue.exerciseId: ue.id,
      };

      final now = DateTime.now().millisecondsSinceEpoch;
      const uuid = Uuid();

      await _db.transaction(() async {
        for (final routine in routines) {
          final routineId = uuid.v4();
          await _db.routineDao.upsertRoutine(RoutineTableCompanion.insert(
            id: routineId,
            userId: userId,
            name: routine['name'] as String,
            createdAt: now,
          ));
          for (final link in links
              .where((l) => l['routine_id'] == routine['id'])) {
            final userExerciseId =
                userExerciseBySystemId[link['exercise_id'] as String];
            if (userExerciseId == null) continue;
            await _db.routineDao
                .upsertRoutineExercise(RoutineExerciseTableCompanion.insert(
              id: uuid.v4(),
              userId: userId,
              routineId: routineId,
              userExerciseId: userExerciseId,
              exPosition: link['position'] as int,
            ));
          }
        }
      });
    } catch (e, st) {
      _log.severe('Sample routine generation failed', e, st);
    }
  }
}

class SeedExercise {
  SeedExercise({
    required this.id,
    required this.name,
    required this.category,
    required this.bodyPart,
    required this.isFoundation,
    required this.volumeMultiplier,
    this.strengthModality,
    this.cardioModality,
  });

  factory SeedExercise.fromJson(Map<String, dynamic> json) => SeedExercise(
        id: json['id'] as String,
        name: json['name'] as String,
        category: json['category'] as String,
        bodyPart: json['body_part'] as String,
        isFoundation: json['is_foundation'] as bool? ?? false,
        volumeMultiplier: (json['volume_multiplier'] as num?)?.toDouble() ?? 1.0,
        strengthModality:
            StrengthModality.tryParse(json['strength_modality'] as String?),
        cardioModality:
            CardioModality.tryParse(json['cardio_modality'] as String?),
      );

  final String id;
  final String name;
  final String category;
  final String bodyPart;
  final bool isFoundation;
  final double volumeMultiplier;
  final StrengthModality? strengthModality;
  final CardioModality? cardioModality;

  ExerciseTableCompanion toCompanion() => ExerciseTableCompanion.insert(
        id: id,
        name: name,
        category: category,
        bodyPart: bodyPart,
        createdAt: 0,
        isFoundation: Value(isFoundation),
      );
}
