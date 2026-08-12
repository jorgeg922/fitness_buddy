import 'package:fitness_buddy/core/theme/app_theme.dart';
import 'package:fitness_buddy/features/heatmap/providers/heatmap_providers.dart';
import 'package:fitness_buddy/features/heatmap/widgets/heatmap_placeholder.dart';
import 'package:fitness_buddy/features/heatmap/widgets/heatmap_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_buddy/features/common/providers/shared_prefs_provider.dart';

void main() {
  testWidgets(
      'HeatmapView degrades to the placeholder + CTA when the .riv is absent',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          // Simulate a clone without the commercial asset.
          riveRuntimeAvailableProvider.overrideWithValue(false),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeatmapView(
                intensities: const {'pectoralisMajor': 4.0, 'biceps': 2.0},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(HeatmapPlaceholder), findsOneWidget);
    expect(find.text('Unlock the interactive muscle heatmap'), findsOneWidget);
    expect(find.textContaining('fitnessvisuals.com'), findsOneWidget);
    // Group bars still render the data.
    expect(find.text('Chest'), findsOneWidget);
    expect(find.text('Biceps'), findsOneWidget);
  });
}
