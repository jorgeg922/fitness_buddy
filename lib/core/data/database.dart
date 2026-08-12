import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'dao/app_metadata_dao.dart';
import 'dao/exercise_dao.dart';
import 'dao/history_dao.dart';
import 'dao/routine_dao.dart';
import 'dao/stats_dao.dart';
import 'dao/user_dao.dart';
import 'dao/workout_draft_dao.dart';
import 'structs/json_map_converter.dart';
import 'tables/active_workout_draft_table.dart';
import 'tables/app_metadata_table.dart';
import 'tables/app_user_table.dart';
import 'tables/cardio_profile_table.dart';
import 'tables/exercise_overall_aggregate_table.dart';
import 'tables/exercise_performance_log_table.dart';
import 'tables/exercise_table.dart';
import 'tables/history_stats_rollup_table.dart';
import 'tables/muscle_usage_daily_table.dart';
import 'tables/personal_record_event_table.dart';
import 'tables/progression_policy_table.dart';
import 'tables/routine_exercise_table.dart';
import 'tables/routine_table.dart';
import 'tables/set_log_table.dart';
import 'tables/strength_profile_table.dart';
import 'tables/user_exercise_table.dart';
import 'tables/user_overall_stats_table.dart';
import 'tables/workout_log_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    AppUserTable,
    AppMetadataTable,
    ExerciseTable,
    UserExerciseTable,
    StrengthProfileTable,
    CardioProfileTable,
    ProgressionPolicyTable,
    RoutineTable,
    RoutineExerciseTable,
    WorkoutLogTable,
    ExercisePerformanceLogTable,
    SetLogTable,
    ActiveWorkoutDraftTable,
    HistoryStatsRollupTable,
    ExerciseOverallAggregateTable,
    PersonalRecordEventTable,
    UserOverallStatsTable,
    MuscleUsageDailyTable,
  ],
  daos: [
    UserDao,
    AppMetadataDao,
    ExerciseDao,
    RoutineDao,
    WorkoutDraftDao,
    HistoryDao,
    StatsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Executor stays injectable so tests can pass NativeDatabase.memory().
  AppDatabase(super.e);

  AppDatabase.open() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _createIndexes();
        },
        onUpgrade: (m, from, to) async {
          // Additive migrations only. Indexes re-issued every upgrade — they
          // are IF NOT EXISTS, so this is safe and covers migrated installs.
          await _createIndexes();
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  Future<void> _createIndexes() async {
    const statements = [
      'CREATE INDEX IF NOT EXISTS idx_workout_log_user_time '
          'ON workout_log_table (user_id, performed_at)',
      'CREATE INDEX IF NOT EXISTS idx_perf_log_workout '
          'ON exercise_performance_log_table (workout_log_id)',
      'CREATE INDEX IF NOT EXISTS idx_perf_log_user_exercise '
          'ON exercise_performance_log_table (user_exercise_id, performed_at)',
      'CREATE INDEX IF NOT EXISTS idx_set_log_perf '
          'ON set_log_table (exercise_performance_log_id)',
      'CREATE INDEX IF NOT EXISTS idx_rollup_exercise_day '
          'ON history_stats_rollup_table (user_exercise_id, day_epoch)',
      'CREATE INDEX IF NOT EXISTS idx_user_exercise_user '
          'ON user_exercise_table (user_id, is_favorite)',
      'CREATE INDEX IF NOT EXISTS idx_muscle_usage_user_day '
          'ON muscle_usage_daily_table (user_id, day_epoch)',
      'CREATE INDEX IF NOT EXISTS idx_pr_event_user_time '
          'ON personal_record_event_table (user_id, achieved_at)',
    ];
    for (final s in statements) {
      await customStatement(s);
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    return NativeDatabase.createInBackground(File(p.join(dir.path, 'app.db')));
  });
}
