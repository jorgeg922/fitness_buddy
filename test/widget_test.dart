import 'package:drift/native.dart';
import 'package:fitness_buddy/core/data/database.dart';
import 'package:fitness_buddy/core/providers/database_provider.dart';
import 'package:fitness_buddy/features/common/providers/shared_prefs_provider.dart';
import 'package:fitness_buddy/features/home/providers/startup_provider.dart';
import 'package:fitness_buddy/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App shell renders the four nav tabs', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          databaseProvider.overrideWithValue(db),
          // Seeding is covered by seed_loader_test; skip it in shell tests.
          appStartupProvider.overrideWith((ref) => Future.value()),
        ],
        child: const FitnessBuddyApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Exercises'), findsOneWidget);
    expect(find.text('Routines'), findsOneWidget);
    expect(find.text('Stats'), findsOneWidget);

    // Unmount, then advance fake time so drift's zero-duration stream-close
    // timers fire before the framework verifies no timers are pending.
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 100));
  });
}
