import 'package:drift/drift.dart';

/// Generic local K/V: seed-content versions, maintenance timestamps.
@DataClassName('AppMetadataRow')
class AppMetadataTable extends Table {
  TextColumn get dataKey => text()();
  TextColumn get dataValue => text()();

  @override
  Set<Column> get primaryKey => {dataKey};
}
