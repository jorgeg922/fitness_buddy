import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/config_constants.dart';
import 'muscle_group_heat_bars.dart';

/// Shown wherever the interactive heatmap would render when the commercial
/// .riv asset isn't bundled (the public-repo default). The same muscle data
/// renders as heat-colored group bars, so the feature stays genuinely useful
/// — the figure is the upgrade, not the feature.
class HeatmapPlaceholder extends StatelessWidget {
  const HeatmapPlaceholder({
    super.key,
    required this.intensities,
    this.showCta = true,
  });

  /// Muscle key → 0..4, same contract as BodyHeatmap.
  final Map<String, double> intensities;
  final bool showCta;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: MuscleGroupHeatBars(intensities: intensities),
        ),
        if (showCta) const _HeatmapCtaCard(),
      ],
    );
  }
}

class _HeatmapCtaCard extends StatelessWidget {
  const _HeatmapCtaCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.accessibility_new,
                    color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Unlock the interactive muscle heatmap',
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'This app supports an anatomically accurate, tappable body '
              'heatmap powered by a Rive asset from Fitness Visuals. Drop the '
              '.riv file into assets/rive/ to activate it.',
              style: theme.textTheme.bodySmall,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => launchUrl(
                  Uri.parse(ConfigConstants.fitnessVisualsUrl),
                  mode: LaunchMode.externalApplication,
                ),
                child: const Text('Get it at fitnessvisuals.com'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
