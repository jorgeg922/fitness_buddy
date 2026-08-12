import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/app_user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [AppUserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<AppUserRow?> getUser(String id) =>
      (select(appUserTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<AppUserRow?> watchUser(String id) =>
      (select(appUserTable)..where((t) => t.id.equals(id)))
          .watchSingleOrNull();

  Future<void> upsertUser(AppUserTableCompanion row) =>
      into(appUserTable).insertOnConflictUpdate(row);

  Future<void> updateUserWeight(String id, double? weightLb) =>
      (update(appUserTable)..where((t) => t.id.equals(id)))
          .write(AppUserTableCompanion(userWeight: Value(weightLb)));
}
