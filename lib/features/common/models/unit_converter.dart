import 'measurement_system.dart';

/// Canonical storage is imperial (lb, mi, mph) — doc §12.1.
/// Write path: user metric input → imperial. Read path: imperial → user units.
abstract final class UnitConverter {
  static const double _lbPerKg = 2.2046226218;
  static const double _miPerKm = 0.6213711922;

  static double kgToLb(double kg) => kg * _lbPerKg;
  static double lbToKg(double lb) => lb / _lbPerKg;
  static double kmToMi(double km) => km * _miPerKm;
  static double miToKm(double mi) => mi / _miPerKm;
  static double kphToMph(double kph) => kph * _miPerKm;
  static double mphToKph(double mph) => mph / _miPerKm;

  /// Imperial stored value → the user's display system.
  static double weightToUserMs(double lb, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? lb : _round(lbToKg(lb));

  static double distanceToUserMs(double mi, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? mi : _round(miToKm(mi));

  static double speedToUserMs(double mph, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? mph : _round(mphToKph(mph));

  /// User input in their display system → canonical imperial.
  static double weightToImperial(double value, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? value : kgToLb(value);

  static double distanceToImperial(double value, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? value : kmToMi(value);

  static double speedToImperial(double value, MeasurementSystem ms) =>
      ms == MeasurementSystem.us ? value : kphToMph(value);

  static double _round(double v) => (v * 100).roundToDouble() / 100;
}
