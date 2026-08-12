// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dao.dart';

// ignore_for_file: type=lint
mixin _$UserDaoMixin on DatabaseAccessor<AppDatabase> {
  $AppUserTableTable get appUserTable => attachedDatabase.appUserTable;
  UserDaoManager get managers => UserDaoManager(this);
}

class UserDaoManager {
  final _$UserDaoMixin _db;
  UserDaoManager(this._db);
  $$AppUserTableTableTableManager get appUserTable =>
      $$AppUserTableTableTableManager(_db.attachedDatabase, _db.appUserTable);
}
