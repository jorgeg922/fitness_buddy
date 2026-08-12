/// Chart metrics; each maps to a history_stats_rollup column.
enum DisplayMetrics {
  totalVolume('Total volume'),
  totalReps('Total reps'),
  setCount('Sets'),
  maxWeight('Max weight'),
  oneRepMax('Est. 1RM'),
  totalDuration('Duration'),
  totalDistance('Distance'),
  maxSpeed('Max speed'),
  avgSpeed('Avg speed'),
  distanceVsDuration('Distance vs duration');

  const DisplayMetrics(this.label);
  final String label;
}
