enum MeasurementSystem {
  us,
  metric;

  String get weightUnit => this == us ? 'lb' : 'kg';
  String get distanceUnit => this == us ? 'mi' : 'km';
  String get speedUnit => this == us ? 'mph' : 'km/h';
}
