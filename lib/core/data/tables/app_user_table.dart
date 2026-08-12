import 'package:drift/drift.dart';

/// Root of the FK graph. Offline build: exactly one row (id = 'local').
@DataClassName('AppUserRow')
class AppUserTable extends Table {
  TextColumn get id => text()();
  TextColumn get userName => text()();
  IntColumn get createdAt => integer()();
  BoolColumn get hasCompletedInitialSetup =>
      boolean().withDefault(const Constant(false))();

  /// Body weight in lbs (canonical imperial), nullable until the user sets it.
  RealColumn get userWeight => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
