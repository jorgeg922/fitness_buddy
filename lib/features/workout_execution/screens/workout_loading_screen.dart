import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user/providers/user_providers.dart';
import '../models/models_dto/workout_input_bundle.dart';
import '../providers/workout_providers.dart';
import 'workout_execution_screen.dart';

/// All workout entry points converge here (doc §8.2): resolve the input
/// bundle, then swap to the execution screen.
class WorkoutLoadingScreen extends ConsumerStatefulWidget {
  const WorkoutLoadingScreen.forRoutine({
    super.key,
    required String this.routineId,
    required String this.routineName,
  })  : userExerciseId = null,
        resume = false;

  const WorkoutLoadingScreen.adhoc({
    super.key,
    required String this.userExerciseId,
  })  : routineId = null,
        routineName = null,
        resume = false;

  const WorkoutLoadingScreen.resume({super.key})
      : routineId = null,
        routineName = null,
        userExerciseId = null,
        resume = true;

  final String? routineId;
  final String? routineName;
  final String? userExerciseId;
  final bool resume;

  @override
  ConsumerState<WorkoutLoadingScreen> createState() =>
      _WorkoutLoadingScreenState();
}

class _WorkoutLoadingScreenState extends ConsumerState<WorkoutLoadingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _load());
  }

  Future<void> _load() async {
    final loader = ref.read(workoutBundleLoaderProvider);
    final userId = ref.read(currentUserIdProvider);

    WorkoutExecutionInputBundle? bundle;
    if (widget.resume) {
      bundle = await loader.loadResume(userId);
    } else if (widget.routineId != null) {
      bundle = await loader.loadForRoutine(
          userId, widget.routineId!, widget.routineName!);
    } else if (widget.userExerciseId != null) {
      bundle = await loader.loadAdhoc(userId, widget.userExerciseId!);
    }

    if (!mounted) return;
    if (bundle == null || bundle.exercises.isEmpty) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing to start.')));
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (_) => WorkoutExecutionScreen(bundle: bundle!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
