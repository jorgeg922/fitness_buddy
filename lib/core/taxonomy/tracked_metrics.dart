/// Which input fields a live-workout set form shows.
enum TrackedMetrics { weight, reps, duration, distance, speed }

/// Which metrics can generate a PR event.
enum TrackedMetricsPr {
  maxWeight('Max weight'),
  oneRepMax('Est. 1RM'),
  maxRepsSet('Most reps in a set'),
  maxVolumeSession('Session volume'),
  maxDistance('Longest distance'),
  maxSpeed('Top speed'),
  maxDuration('Longest duration');

  const TrackedMetricsPr(this.label);
  final String label;
}
