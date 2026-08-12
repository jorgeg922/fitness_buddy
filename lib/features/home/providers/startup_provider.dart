import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_provider.dart';
import '../../exercises/services/seed/exercise_seed_loader.dart';
import '../../user/providers/user_providers.dart';

/// Startup gate: seeds the catalog and ensures the local user + links before
/// the home screen shows real data. Every step fails open (doc §8.1/§14) —
/// a bad asset degrades content, never blocks first frame.
final appStartupProvider = FutureProvider<void>((ref) async {
  final db = ref.read(databaseProvider);
  final userId = ref.read(currentUserIdProvider);
  final seeder = ExerciseSeedLoader(db);

  await ensureLocalUser(ref.read(userDaoProvider));
  await seeder.loadSystemExercises();
  await seeder.linkSystemExercisesToUser(userId);
  await seeder.generateSampleRoutinesForUser(userId);
});
