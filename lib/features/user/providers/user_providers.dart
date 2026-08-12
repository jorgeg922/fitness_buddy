import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/config_constants.dart';
import '../../../core/data/dao/user_dao.dart';
import '../../../core/data/database.dart';
import '../../../core/providers/database_provider.dart';

final userDaoProvider =
    Provider<UserDao>((ref) => UserDao(ref.read(databaseProvider)));

/// Offline build: the single local user. Constant, but kept as a provider so
/// a future multi-user/auth build only changes this one spot.
final currentUserIdProvider =
    Provider<String>((ref) => ConfigConstants.localUserId);

/// Creates the local user row on first run. Part of the startup gate.
Future<void> ensureLocalUser(UserDao dao) async {
  final existing = await dao.getUser(ConfigConstants.localUserId);
  if (existing != null) return;
  await dao.upsertUser(AppUserTableCompanion.insert(
    id: ConfigConstants.localUserId,
    userName: 'Athlete',
    createdAt: DateTime.now().millisecondsSinceEpoch,
  ));
}

final currentUserProvider = StreamProvider<AppUserRow?>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(userDaoProvider).watchUser(userId);
});
