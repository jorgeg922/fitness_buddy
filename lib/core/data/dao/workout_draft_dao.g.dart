// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_draft_dao.dart';

// ignore_for_file: type=lint
mixin _$WorkoutDraftDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  $ActiveWorkoutDraftTableTable get activeWorkoutDraftTable =>
      attachedDatabase.activeWorkoutDraftTable;
  WorkoutDraftDaoManager get managers => WorkoutDraftDaoManager(this);
}

class WorkoutDraftDaoManager {
  final _$WorkoutDraftDaoMixin _db;
  WorkoutDraftDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
  $$ActiveWorkoutDraftTableTableTableManager get activeWorkoutDraftTable =>
      $$ActiveWorkoutDraftTableTableTableManager(
        _db.attachedDatabase,
        _db.activeWorkoutDraftTable,
      );
}
