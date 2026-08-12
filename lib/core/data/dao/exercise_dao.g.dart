// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dao.dart';

// ignore_for_file: type=lint
mixin _$ExerciseDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  $ExerciseTableTable get exerciseTable => attachedDatabase.exerciseTable;
  $UserExerciseTableTable get userExerciseTable =>
      attachedDatabase.userExerciseTable;
  $StrengthProfileTableTable get strengthProfileTable =>
      attachedDatabase.strengthProfileTable;
  $CardioProfileTableTable get cardioProfileTable =>
      attachedDatabase.cardioProfileTable;
  $ProgressionPolicyTableTable get progressionPolicyTable =>
      attachedDatabase.progressionPolicyTable;
  ExerciseDaoManager get managers => ExerciseDaoManager(this);
}

class ExerciseDaoManager {
  final _$ExerciseDaoMixin _db;
  ExerciseDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
  $$ExerciseTableTableTableManager get exerciseTable =>
      $$ExerciseTableTableTableManager(_db.attachedDatabase, _db.exerciseTable);
  $$UserExerciseTableTableTableManager get userExerciseTable =>
      $$UserExerciseTableTableTableManager(
        _db.attachedDatabase,
        _db.userExerciseTable,
      );
  $$StrengthProfileTableTableTableManager get strengthProfileTable =>
      $$StrengthProfileTableTableTableManager(
        _db.attachedDatabase,
        _db.strengthProfileTable,
      );
  $$CardioProfileTableTableTableManager get cardioProfileTable =>
      $$CardioProfileTableTableTableManager(
        _db.attachedDatabase,
        _db.cardioProfileTable,
      );
  $$ProgressionPolicyTableTableTableManager get progressionPolicyTable =>
      $$ProgressionPolicyTableTableTableManager(
        _db.attachedDatabase,
        _db.progressionPolicyTable,
      );
}
