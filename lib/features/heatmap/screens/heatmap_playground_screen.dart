import 'package:flutter/material.dart';

import '../models/muscles.dart';
import '../widgets/heatmap_view.dart';

/// Debug-only playground: per-group sliders + a tap log, to eyeball all 29
/// muscles and verify event extraction. Reached from the home app bar in
/// debug builds.
class HeatmapPlaygroundScreen extends StatefulWidget {
  const HeatmapPlaygroundScreen({super.key});

  @override
  State<HeatmapPlaygroundScreen> createState() =>
      _HeatmapPlaygroundScreenState();
}

class _HeatmapPlaygroundScreenState extends State<HeatmapPlaygroundScreen> {
  final Map<String, double> _groupValues = {
    for (final g in muscleGroups) g.key: 0.0,
  };
  final List<String> _tapLog = [];

  Map<String, double> get _intensities => {
        for (final group in muscleGroups)
          for (final muscle in group.muscles)
            muscle: _groupValues[group.key] ?? 0.0,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heatmap playground')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          HeatmapView(
            intensities: _intensities,
            height: 360,
            onMuscleClick: (muscle) => setState(() {
              _tapLog.insert(0, muscle);
              if (_tapLog.length > 10) _tapLog.removeLast();
            }),
          ),
          if (_tapLog.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Taps: ${_tapLog.join(', ')}',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          for (final group in muscleGroups)
            Row(
              children: [
                SizedBox(width: 110, child: Text(group.label)),
                Expanded(
                  child: Slider(
                    value: _groupValues[group.key]!,
                    max: 4,
                    divisions: 40,
                    label: _groupValues[group.key]!.toStringAsFixed(1),
                    onChanged: (v) =>
                        setState(() => _groupValues[group.key] = v),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
