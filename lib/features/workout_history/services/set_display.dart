import '../../../core/data/database.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/unit_converter.dart';

/// Formats a stored (imperial) set log for display in the user's unit
/// system, e.g. "135×8", "2.5mi / 20m", "×12", "45s".
String formatLoggedSet(SetLogRow set, MeasurementSystem ms) {
  if (set.weight != null && set.reps != null) {
    final weight = UnitConverter.weightToUserMs(set.weight!, ms);
    final display = weight == weight.roundToDouble()
        ? weight.toInt().toString()
        : weight.toStringAsFixed(1);
    return '$display×${set.reps}';
  }
  if (set.distance != null) {
    final distance = UnitConverter.distanceToUserMs(set.distance!, ms);
    final minutes = (set.durationSeconds ?? 0) ~/ 60;
    return '${distance.toStringAsFixed(1)}${ms.distanceUnit}'
        '${minutes > 0 ? ' / ${minutes}m' : ''}';
  }
  if (set.reps != null) return '×${set.reps}';
  if (set.durationSeconds != null) return '${set.durationSeconds}s';
  return '—';
}
