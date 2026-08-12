import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/pref_keys.dart';
import '../models/measurement_system.dart';

/// Overridden in main() with the real instance so all prefs reads are
/// synchronous everywhere else (doc §8.1).
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Overridden in main()'),
);

class MeasurementSystemNotifier extends Notifier<MeasurementSystem> {
  @override
  MeasurementSystem build() {
    final stored =
        ref.read(sharedPreferencesProvider).getString(PrefKeys.measurementSystem);
    return MeasurementSystem.values.asNameMap()[stored] ?? MeasurementSystem.us;
  }

  Future<void> set(MeasurementSystem ms) async {
    state = ms;
    await ref
        .read(sharedPreferencesProvider)
        .setString(PrefKeys.measurementSystem, ms.name);
  }
}

final measurementSystemProvider =
    NotifierProvider<MeasurementSystemNotifier, MeasurementSystem>(
        MeasurementSystemNotifier.new);
