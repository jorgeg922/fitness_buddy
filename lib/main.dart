import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:rive/rive.dart' as rive;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'features/app_settings/providers/theme_mode_provider.dart';
import 'features/common/providers/shared_prefs_provider.dart';
import 'features/heatmap/providers/rive_runtime_provider.dart';
import 'features/home/providers/startup_provider.dart';
import 'features/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _configureLogging();

  // Fail open: a broken Rive runtime disables the heatmap, never the app.
  var riveRuntimeReady = false;
  try {
    await rive.RiveNative.init();
    riveRuntimeReady = true;
  } catch (e, st) {
    Logger('bootstrap').warning('Rive init failed; heatmap disabled', e, st);
  }

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        riveRuntimeAvailableProvider.overrideWithValue(riveRuntimeReady),
      ],
      child: const FitnessBuddyApp(),
    ),
  );
}

void _configureLogging() {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((r) {
    debugPrint('[${r.level.name}] ${r.loggerName}: ${r.message}'
        '${r.error != null ? ' — ${r.error}' : ''}');
  });
}

/// Blocks on first-run seeding; seeding fails open so the error branch is
/// effectively unreachable, but degrade to the shell anyway.
class _StartupGate extends ConsumerWidget {
  const _StartupGate();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(appStartupProvider);
    return startup.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => const HomeScreen(),
      data: (_) => const HomeScreen(),
    );
  }
}

class FitnessBuddyApp extends ConsumerWidget {
  const FitnessBuddyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'FitnessBuddy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      home: const _StartupGate(),
    );
  }
}
