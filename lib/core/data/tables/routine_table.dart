import 'package:drift/drift.dart';

import 'app_user_table.dart';

@DataClassName('RoutineRow')
class RoutineTable extends Table {
  TextColumn get id => text()();
  TextColumn get userId =>
      text().references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  IntColumn get lastCompletedAt => integer().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {userId, name},
      ];
}
