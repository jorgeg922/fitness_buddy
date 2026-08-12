// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dao.dart';

// ignore_for_file: type=lint
mixin _$RoutineDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  $RoutineTableTable get routineTable => attachedDatabase.routineTable;
  $ExerciseTableTable get exerciseTable => attachedDatabase.exerciseTable;
  $UserExerciseTableTable get userExerciseTable =>
      attachedDatabase.userExerciseTable;
  $RoutineExerciseTableTable get routineExerciseTable =>
      attachedDatabase.routineExerciseTable;
  RoutineDaoManager get managers => RoutineDaoManager(this);
}

class RoutineDaoManager {
  final _$RoutineDaoMixin _db;
  RoutineDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
  $$RoutineTableTableTableManager get routineTable =>
      $$RoutineTableTableTableManager(_db.attachedDatabase, _db.routineTable);
  $$ExerciseTableTableTableManager get exerciseTable =>
      $$ExerciseTableTableTableManager(_db.attachedDatabase, _db.exerciseTable);
  $$UserExerciseTableTableTableManager get userExerciseTable =>
      $$UserExerciseTableTableTableManager(
        _db.attachedDatabase,
        _db.userExerciseTable,
      );
  $$RoutineExerciseTableTableTableManager get routineExerciseTable =>
      $$RoutineExerciseTableTableTableManager(
        _db.attachedDatabase,
        _db.routineExerciseTable,
      );
}
