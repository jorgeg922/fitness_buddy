import 'package:flutter/material.dart';

import '../models/heatmap_palette.dart';
import '../models/muscles.dart';

/// The 14 muscle groups ranked by heat, as heat-colored bars. Shares the
/// figure's intensity contract so both views always agree.
class MuscleGroupHeatBars extends StatelessWidget {
  const MuscleGroupHeatBars({
    super.key,
    required this.intensities,
    this.onGroupTap,
  });

  /// Muscle key → 0..4.
  final Map<String, double> intensities;
  final ValueChanged<MuscleGroup>? onGroupTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.heatmapPalette;

    final groupHeat = <MuscleGroup, double>{
      for (final group in muscleGroups)
        group: group.muscles
            .map((m) => intensities[m] ?? 0.0)
            .fold(0.0, (a, b) => a > b ? a : b),
    };
    final ranked = groupHeat.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: [
        for (final entry in ranked)
          InkWell(
            onTap:
                onGroupTap == null ? null : () => onGroupTap!(entry.key),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      entry.key.label,
                      style: theme.textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (entry.value / 4.0).clamp(0.0, 1.0),
                        minHeight: 10,
                        backgroundColor: palette.base.withValues(alpha: .35),
                        color: palette.colorFor(entry.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
