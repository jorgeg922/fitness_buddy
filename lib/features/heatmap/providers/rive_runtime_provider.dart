import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/config_constants.dart';

/// Whether RiveNative.init() succeeded. Overridden in main().
final riveRuntimeAvailableProvider = Provider<bool>((ref) => false);

/// Whether the commercial .riv asset is bundled in this build. The asset is
/// git-ignored, so cloners run without it — every heatmap surface must fall
/// back gracefully (see HeatmapView).
final riveAssetAvailableProvider = FutureProvider<bool>((ref) async {
  if (!ref.watch(riveRuntimeAvailableProvider)) return false;
  try {
    await rootBundle.load(ConfigConstants.riveAssetPath);
    return true;
  } catch (_) {
    return false;
  }
});
