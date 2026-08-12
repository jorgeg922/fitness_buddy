import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../user/providers/user_providers.dart';
import '../models/models_view/routine_vm.dart';
import '../services/read/routine_query_repository.dart';
import '../services/write/routine_repository.dart';
import '../use_cases/routine_use_cases.dart';

final routineQueryRepoProvider = Provider<RoutineQueryRepository>(
    (ref) => RoutineQueryRepository(ref.read(databaseProvider)));

final routineRepoProvider = Provider<RoutineRepository>(
    (ref) => RoutineRepository(ref.read(databaseProvider)));

final routineUseCasesProvider = Provider<RoutineUseCases>((ref) =>
    RoutineUseCases(
        ref.read(routineRepoProvider), ref.read(routineQueryRepoProvider)));

final currentUserRoutinesProvider = StreamProvider<List<RoutineVm>>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(routineQueryRepoProvider).watchRoutines(userId);
});
