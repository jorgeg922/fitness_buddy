import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/data/dao/exercise_dao.dart';
import '../../../core/providers/database_provider.dart';
import '../../user/providers/user_providers.dart';
import '../models/exercise_filter.dart';
import '../models/models_view/exercise_vm.dart';
import '../services/read/exercise_query_repository.dart';
import '../services/write/exercise_repository.dart';
import '../use_cases/exercise_use_cases.dart';

final exerciseDaoProvider =
    Provider<ExerciseDao>((ref) => ExerciseDao(ref.read(databaseProvider)));

final exerciseQueryRepoProvider = Provider<ExerciseQueryRepository>(
    (ref) => ExerciseQueryRepository(ref.read(exerciseDaoProvider)));

final exerciseRepoProvider = Provider<ExerciseRepository>(
    (ref) => ExerciseRepository(ref.read(databaseProvider)));

final exerciseUseCasesProvider = Provider<ExerciseUseCases>(
    (ref) => ExerciseUseCases(ref.read(exerciseRepoProvider)));

class ExerciseFilterNotifier extends Notifier<ExerciseFilter> {
  @override
  ExerciseFilter build() => const ExerciseFilter();

  void update(ExerciseFilter filter) => state = filter;

  void reset() => state = const ExerciseFilter();
}

final exerciseFilterProvider =
    NotifierProvider<ExerciseFilterNotifier, ExerciseFilter>(
        ExerciseFilterNotifier.new);

/// The reactive catalog list the UI watches. Changing the filter re-runs the
/// SQL query; any write to the underlying tables re-emits automatically.
final currentUserExercisesProvider = StreamProvider<List<ExerciseVm>>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  final filter = ref.watch(exerciseFilterProvider);
  return ref
      .read(exerciseQueryRepoProvider)
      .watchUserExercises(userId, filter);
});
