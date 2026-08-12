import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/constants/config_constants.dart';
import '../models/heatmap_palette.dart';
import '../models/muscles.dart';

/// Renders one artboard of the Fitness Visuals "Human Anatomy Advanced 3.0"
/// asset and drives every muscle's intensity + palette via the asset's nested
/// view models. Adapted from the vendor's reference implementation.
///
/// Valid [artboardName]s: 'Male-Front', 'Male-Back', 'Female-Front',
/// 'Female-Back'. When changing at runtime give the widget a
/// `ValueKey(artboardName)` so it fully remounts with a fresh controller.
///
/// [intensities] keys must match [allMuscles]; range 0–4; missing keys
/// default to 0. Writes to muscles absent from the current artboard are
/// silent no-ops.
class BodyHeatmap extends StatefulWidget {
  const BodyHeatmap({
    super.key,
    required this.artboardName,
    required this.palette,
    required this.intensities,
    this.onMuscleClick,
  });

  final String artboardName;
  final HeatmapPalette palette;
  final Map<String, double> intensities;

  /// Fires with the muscle key when the user taps a muscle hit box.
  final ValueChanged<String>? onMuscleClick;

  @override
  State<BodyHeatmap> createState() => _BodyHeatmapState();
}

/// Cached handles for one muscle's nested VMs. Resolving once at load time
/// makes each subsequent update a plain property write.
class _MuscleHandles {
  _MuscleHandles({
    required this.muscleVm,
    required this.paletteVm,
    required this.intensity,
    required this.baseColor,
    required this.colorLevel1,
    required this.colorLevel2,
    required this.colorLevel3,
    required this.colorLevel4,
  });

  final ViewModelInstance muscleVm;
  final ViewModelInstance? paletteVm;
  final ViewModelInstanceNumber? intensity;
  final ViewModelInstanceColor? baseColor;
  final ViewModelInstanceColor? colorLevel1;
  final ViewModelInstanceColor? colorLevel2;
  final ViewModelInstanceColor? colorLevel3;
  final ViewModelInstanceColor? colorLevel4;

  void dispose() {
    intensity?.dispose();
    baseColor?.dispose();
    colorLevel1?.dispose();
    colorLevel2?.dispose();
    colorLevel3?.dispose();
    colorLevel4?.dispose();
    paletteVm?.dispose();
    muscleVm.dispose();
  }
}

const String _paletteVmName = 'palette';

final Set<String> _muscleSet = Set<String>.unmodifiable(allMuscles);

/// Pulls the muscle key out of a Rive event. In v3.0 the events are named
/// `<muscle>Pressed` and carry the muscle key as the VALUE of a custom
/// string property — so the property scan is the path that actually fires.
/// The event-name check stays as a cheap fast path in case a future asset
/// version names events after the muscle directly.
String? _extractMuscleName(Event event) {
  for (final prop in event.properties.values) {
    if (prop is CustomStringProperty && _muscleSet.contains(prop.value)) {
      return prop.value;
    }
  }
  if (_muscleSet.contains(event.name)) return event.name;
  return null;
}

class _BodyHeatmapState extends State<BodyHeatmap> {
  late final FileLoader _fileLoader = FileLoader.fromAsset(
    ConfigConstants.riveAssetPath,
    riveFactory: Factory.rive,
  );

  ViewModelInstance? _bodyVm;
  final Map<String, _MuscleHandles> _handles = {};
  StateMachine? _stateMachine;

  @override
  void didUpdateWidget(covariant BodyHeatmap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.palette != oldWidget.palette) {
      _applyPalette();
    }
    if (!_intensitiesEqual(widget.intensities, oldWidget.intensities)) {
      _applyIntensities();
    }
  }

  bool _intensitiesEqual(Map<String, double> a, Map<String, double> b) {
    if (a.length != b.length) return false;
    for (final entry in a.entries) {
      if (b[entry.key] != entry.value) return false;
    }
    return true;
  }

  void _cacheHandles() {
    _disposeHandles();
    final bodyVm = _bodyVm;
    if (bodyVm == null) return;

    for (final name in allMuscles) {
      final muscleVm = bodyVm.viewModel(name);
      // Muscle absent from this artboard — skip silently.
      if (muscleVm == null) continue;

      final paletteVm = muscleVm.viewModel(_paletteVmName);
      _handles[name] = _MuscleHandles(
        muscleVm: muscleVm,
        paletteVm: paletteVm,
        intensity: muscleVm.number('intensity'),
        baseColor: paletteVm?.color('baseColor'),
        colorLevel1: paletteVm?.color('colorLevel1'),
        colorLevel2: paletteVm?.color('colorLevel2'),
        colorLevel3: paletteVm?.color('colorLevel3'),
        colorLevel4: paletteVm?.color('colorLevel4'),
      );
    }
  }

  void _applyIntensities() {
    for (final entry in _handles.entries) {
      entry.value.intensity?.value = widget.intensities[entry.key] ?? 0;
    }
  }

  void _applyPalette() {
    for (final h in _handles.values) {
      h.baseColor?.value = widget.palette.base;
      h.colorLevel1?.value = widget.palette.level1;
      h.colorLevel2?.value = widget.palette.level2;
      h.colorLevel3?.value = widget.palette.level3;
      h.colorLevel4?.value = widget.palette.level4;
    }
  }

  void _disposeHandles() {
    for (final h in _handles.values) {
      h.dispose();
    }
    _handles.clear();
  }

  void _handleRiveEvent(Event event) {
    final muscle = _extractMuscleName(event);
    if (muscle != null) widget.onMuscleClick?.call(muscle);
  }

  @override
  void dispose() {
    // VM handles hold native resources — release them explicitly.
    _stateMachine?.removeEventListener(_handleRiveEvent);
    _stateMachine = null;
    _disposeHandles();
    _bodyVm?.dispose();
    _fileLoader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveWidgetBuilder(
      fileLoader: _fileLoader,
      artboardSelector: ArtboardSelector.byName(widget.artboardName),
      dataBind: DataBind.auto(),
      onLoaded: (state) {
        // dataBind here returns the already-bound instance, giving us the
        // same VM tree the renderer reads from.
        _bodyVm?.dispose();
        _bodyVm = state.controller.dataBind(DataBind.auto());
        _cacheHandles();
        _applyPalette();
        _applyIntensities();

        // onLoaded can fire again on reload — detach before re-attaching.
        _stateMachine?.removeEventListener(_handleRiveEvent);
        _stateMachine = state.controller.stateMachine
          ..addEventListener(_handleRiveEvent);
      },
      builder: (context, state) => switch (state) {
        RiveLoading() => const Center(child: CircularProgressIndicator()),
        RiveFailed() => Center(
            child: Text('Heatmap failed to load: ${state.error}'),
          ),
        RiveLoaded() => RiveWidget(
            controller: state.controller,
            fit: Fit.contain,
          ),
      },
    );
  }
}
