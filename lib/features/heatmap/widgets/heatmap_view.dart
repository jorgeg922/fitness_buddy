import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/heatmap_palette.dart';
import '../providers/heatmap_providers.dart';
import 'body_heatmap.dart';
import 'heatmap_placeholder.dart';

/// The single entry point every screen uses to show muscle heat. Renders the
/// interactive Rive figure when the asset is bundled, or the group-bar
/// placeholder (with an optional fitnessvisuals.com CTA) when it isn't —
/// same [intensities] contract either way.
class HeatmapView extends ConsumerStatefulWidget {
  const HeatmapView({
    super.key,
    required this.intensities,
    this.onMuscleClick,
    this.showSideToggle = true,
    this.initialFront = true,
    this.showCta = true,
    this.height,
  });

  /// Muscle key → 0..4.
  final Map<String, double> intensities;
  final ValueChanged<String>? onMuscleClick;
  final bool showSideToggle;
  final bool initialFront;

  /// Whether the no-asset fallback advertises the Rive asset.
  final bool showCta;
  final double? height;

  @override
  ConsumerState<HeatmapView> createState() => _HeatmapViewState();
}

class _HeatmapViewState extends ConsumerState<HeatmapView> {
  late bool _isFront = widget.initialFront;

  @override
  Widget build(BuildContext context) {
    final assetAvailable =
        ref.watch(riveAssetAvailableProvider).value ?? false;
    final isMale = ref.watch(heatmapFigureIsMaleProvider);
    final palette = Theme.of(context).heatmapPalette;

    if (!assetAvailable) {
      return HeatmapPlaceholder(
        intensities: widget.intensities,
        showCta: widget.showCta,
      );
    }

    final artboard = artboardFor(isMale: isMale, isFront: _isFront);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height ?? 320,
          // Remount on artboard change — the controller binds the artboard
          // at mount; a fresh key is the only supported switch mechanism.
          child: BodyHeatmap(
            key: ValueKey(artboard),
            artboardName: artboard,
            palette: palette,
            intensities: widget.intensities,
            onMuscleClick: widget.onMuscleClick,
          ),
        ),
        if (widget.showSideToggle)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: SegmentedButton<bool>(
              showSelectedIcon: false,
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              segments: const [
                ButtonSegment(value: true, label: Text('Front')),
                ButtonSegment(value: false, label: Text('Back')),
              ],
              selected: {_isFront},
              onSelectionChanged: (selection) =>
                  setState(() => _isFront = selection.first),
            ),
          ),
      ],
    );
  }
}
