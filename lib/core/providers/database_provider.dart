import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';

/// Process-lifetime singleton.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase.open();
  ref.onDispose(db.close);
  return db;
});
