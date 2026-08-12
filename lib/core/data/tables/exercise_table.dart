import 'package:drift/drift.dart';

import 'app_user_table.dart';

/// Shared exercise definition. `ownerUserId` NULL = system catalog exercise;
/// non-null = that user's custom exercise.
@DataClassName('ExerciseRow')
class ExerciseTable extends Table {
  TextColumn get id => text()();
  TextColumn get ownerUserId => text()
      .nullable()
      .references(AppUserTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();

  /// ExerciseCategory.name: 'strength' | 'cardio'.
  TextColumn get category => text()();

  /// BodyPart.name.
  TextColumn get bodyPart => text()();
  TextColumn get thumbnailPath => text().nullable()();
  IntColumn get createdAt => integer()();
  BoolColumn get isFoundation => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
        {ownerUserId, name},
      ];
}
