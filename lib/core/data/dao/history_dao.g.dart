// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dao.dart';

// ignore_for_file: type=lint
mixin _$HistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  $RoutineTableTable get routineTable => attachedDatabase.routineTable;
  $WorkoutLogTableTable get workoutLogTable => attachedDatabase.workoutLogTable;
  $ExerciseTableTable get exerciseTable => attachedDatabase.exerciseTable;
  $UserExerciseTableTable get userExerciseTable =>
      attachedDatabase.userExerciseTable;
  $RoutineExerciseTableTable get routineExerciseTable =>
      attachedDatabase.routineExerciseTable;
  $ExercisePerformanceLogTableTable get exercisePerformanceLogTable =>
      attachedDatabase.exercisePerformanceLogTable;
  $SetLogTableTable get setLogTable => attachedDatabase.setLogTable;
  HistoryDaoManager get managers => HistoryDaoManager(this);
}

class HistoryDaoManager {
  final _$HistoryDaoMixin _db;
  HistoryDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
  $$RoutineTableTableTableManager get routineTable =>
      $$RoutineTableTableTableManager(_db.attachedDatabase, _db.routineTable);
  $$WorkoutLogTableTableTableManager get workoutLogTable =>
      $$WorkoutLogTableTableTableManager(
        _db.attachedDatabase,
        _db.workoutLogTable,
      );
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
  $$ExercisePerformanceLogTableTableTableManager
  get exercisePerformanceLogTable =>
      $$ExercisePerformanceLogTableTableTableManager(
        _db.attachedDatabase,
        _db.exercisePerformanceLogTable,
      );
  $$SetLogTableTableTableManager get setLogTable =>
      $$SetLogTableTableTableManager(_db.attachedDatabase, _db.setLogTable);
}
