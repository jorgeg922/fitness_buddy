import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/app_metadata_table.dart';

part 'app_metadata_dao.g.dart';

@DriftAccessor(tables: [AppMetadataTable])
class AppMetadataDao extends DatabaseAccessor<AppDatabase>
    with _$AppMetadataDaoMixin {
  AppMetadataDao(super.db);

  Future<String?> getValue(String key) =>
      (select(appMetadataTable)..where((t) => t.dataKey.equals(key)))
          .getSingleOrNull()
          .then((row) => row?.dataValue);

  Future<void> setValue(String key, String value) =>
      into(appMetadataTable).insertOnConflictUpdate(
          AppMetadataTableCompanion.insert(dataKey: key, dataValue: value));
}
