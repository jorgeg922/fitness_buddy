import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/database.dart';
import '../../../core/providers/database_provider.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../../user/providers/user_providers.dart';
import '../services/workout_bundle_loader.dart';
import '../use_cases/finish_workout_use_case.dart';

final workoutBundleLoaderProvider = Provider<WorkoutBundleLoader>((ref) =>
    WorkoutBundleLoader(
        ref.read(databaseProvider), ref.watch(measurementSystemProvider)));

final finishWorkoutUseCaseProvider = Provider<FinishWorkoutUseCase>((ref) =>
    FinishWorkoutUseCase(
        ref.read(databaseProvider), ref.watch(measurementSystemProvider)));

/// Drives the "resume workout" banner on the home tab.
final activeDraftsProvider =
    StreamProvider<List<ActiveWorkoutDraftRow>>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  return ref
      .read(databaseProvider)
      .workoutDraftDao
      .watchDrafts(userId);
});

/// The change-tick (doc §2): expensive stats FutureProviders watch this and
/// re-run after every finished workout.
final workoutChangeTickProvider = StreamProvider<int>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(databaseProvider).historyDao.watchWorkoutChanges(userId);
});
