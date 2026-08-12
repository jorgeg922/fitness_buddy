import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/pref_keys.dart';
import '../../common/providers/shared_prefs_provider.dart';

export 'rive_runtime_provider.dart';

/// Which figure artwork to render (cosmetic preference, default male).
class HeatmapFigureNotifier extends Notifier<bool> {
  @override
  bool build() =>
      ref.read(sharedPreferencesProvider).getBool(PrefKeys.heatmapFigureIsMale) ??
      true;

  Future<void> set({required bool isMale}) async {
    state = isMale;
    await ref
        .read(sharedPreferencesProvider)
        .setBool(PrefKeys.heatmapFigureIsMale, isMale);
  }
}

final heatmapFigureIsMaleProvider =
    NotifierProvider<HeatmapFigureNotifier, bool>(HeatmapFigureNotifier.new);

/// Artboard name for a side, honoring the figure preference.
String artboardFor({required bool isMale, required bool isFront}) =>
    '${isMale ? 'Male' : 'Female'}-${isFront ? 'Front' : 'Back'}';
