import 'package:flutter/material.dart';

import '../../../core/taxonomy/exercise_category.dart';
import '../../../core/theme/app_custom_colors.dart';
import '../models/models_view/exercise_vm.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.onTap,
    required this.onToggleFavorite,
  });

  final ExerciseVm exercise;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            exercise.category == ExerciseCategory.strength
                ? Icons.fitness_center
                : Icons.directions_run,
            color: theme.colorScheme.onPrimaryContainer,
            size: 20,
          ),
        ),
        title: Text(exercise.name,
            maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${exercise.bodyPart.label} · ${exercise.modalityLabel}'
          '${exercise.isCustom ? ' · Custom' : ''}',
          style: theme.textTheme.bodySmall,
        ),
        trailing: IconButton(
          icon: Icon(
            exercise.isFavorite ? Icons.star : Icons.star_border,
            color: exercise.isFavorite
                ? theme.customColors.favorite
                : theme.customColors.subduedText,
          ),
          onPressed: onToggleFavorite,
        ),
      ),
    );
  }
}
