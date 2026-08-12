// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_dao.dart';

// ignore_for_file: type=lint
mixin _$StatsDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  $ExerciseTableTable get exerciseTable => attachedDatabase.exerciseTable;
  $UserExerciseTableTable get userExerciseTable =>
      attachedDatabase.userExerciseTable;
  $HistoryStatsRollupTableTable get historyStatsRollupTable =>
      attachedDatabase.historyStatsRollupTable;
  $ExerciseOverallAggregateTableTable get exerciseOverallAggregateTable =>
      attachedDatabase.exerciseOverallAggregateTable;
  $PersonalRecordEventTableTable get personalRecordEventTable =>
      attachedDatabase.personalRecordEventTable;
  $UserOverallStatsTableTable get userOverallStatsTable =>
      attachedDatabase.userOverallStatsTable;
  $MuscleUsageDailyTableTable get muscleUsageDailyTable =>
      attachedDatabase.muscleUsageDailyTable;
  StatsDaoManager get managers => StatsDaoManager(this);
}

class StatsDaoManager {
  final _$StatsDaoMixin _db;
  StatsDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
  $$ExerciseTableTableTableManager get exerciseTable =>
      $$ExerciseTableTableTableManager(_db.attachedDatabase, _db.exerciseTable);
  $$UserExerciseTableTableTableManager get userExerciseTable =>
      $$UserExerciseTableTableTableManager(
        _db.attachedDatabase,
        _db.userExerciseTable,
      );
  $$HistoryStatsRollupTableTableTableManager get historyStatsRollupTable =>
      $$HistoryStatsRollupTableTableTableManager(
        _db.attachedDatabase,
        _db.historyStatsRollupTable,
      );
  $$ExerciseOverallAggregateTableTableTableManager
  get exerciseOverallAggregateTable =>
      $$ExerciseOverallAggregateTableTableTableManager(
        _db.attachedDatabase,
        _db.exerciseOverallAggregateTable,
      );
  $$PersonalRecordEventTableTableTableManager get personalRecordEventTable =>
      $$PersonalRecordEventTableTableTableManager(
        _db.attachedDatabase,
        _db.personalRecordEventTable,
      );
  $$UserOverallStatsTableTableTableManager get userOverallStatsTable =>
      $$UserOverallStatsTableTableTableManager(
        _db.attachedDatabase,
        _db.userOverallStatsTable,
      );
  $$MuscleUsageDailyTableTableTableManager get muscleUsageDailyTable =>
      $$MuscleUsageDailyTableTableTableManager(
        _db.attachedDatabase,
        _db.muscleUsageDailyTable,
      );
}
