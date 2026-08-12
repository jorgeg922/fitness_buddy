import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/config_constants.dart';
import '../../../core/constants/pref_keys.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/unit_converter.dart';
import '../../common/providers/shared_prefs_provider.dart';
import '../../heatmap/providers/heatmap_providers.dart';
import '../../user/providers/user_providers.dart';
import '../providers/theme_mode_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ms = ref.watch(measurementSystemProvider);
    final themeMode = ref.watch(themeModeProvider);
    final figureIsMale = ref.watch(heatmapFigureIsMaleProvider);
    final user = ref.watch(currentUserProvider).value;
    final assetAvailable = ref.watch(riveAssetAvailableProvider).value ?? false;

    final weightLb = user?.userWeight;
    final weightDisplay = weightLb == null
        ? 'Not set'
        : '${UnitConverter.weightToUserMs(weightLb, ms).toStringAsFixed(1)} '
            '${ms.weightUnit}';

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const _SectionHeader('Preferences'),
          ListTile(
            title: const Text('Units'),
            trailing: SegmentedButton<MeasurementSystem>(
              showSelectedIcon: false,
              style: const ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              segments: const [
                ButtonSegment(
                    value: MeasurementSystem.us, label: Text('lb / mi')),
                ButtonSegment(
                    value: MeasurementSystem.metric, label: Text('kg / km')),
              ],
              selected: {ms},
              onSelectionChanged: (s) => ref
                  .read(measurementSystemProvider.notifier)
                  .set(s.first),
            ),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: SegmentedButton<ThemeMode>(
              showSelectedIcon: false,
              style: const ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              segments: const [
                ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                ButtonSegment(value: ThemeMode.system, label: Text('Auto')),
              ],
              selected: {themeMode},
              onSelectionChanged: (s) =>
                  ref.read(themeModeProvider.notifier).set(s.first),
            ),
          ),
          ListTile(
            title: const Text('Heatmap figure'),
            subtitle: const Text('Which body artwork the heatmap renders'),
            trailing: SegmentedButton<bool>(
              showSelectedIcon: false,
              style: const ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              segments: const [
                ButtonSegment(value: true, label: Text('Male')),
                ButtonSegment(value: false, label: Text('Female')),
              ],
              selected: {figureIsMale},
              onSelectionChanged: (s) => ref
                  .read(heatmapFigureIsMaleProvider.notifier)
                  .set(isMale: s.first),
            ),
          ),
          const _SectionHeader('Profile'),
          ListTile(
            title: const Text('Body weight'),
            subtitle: Text(weightDisplay),
            trailing: const Icon(Icons.edit_outlined),
            onTap: () => _editBodyWeight(context, ref, ms, weightLb),
          ),
          const _SectionHeader('About'),
          ListTile(
            leading: Icon(
              assetAvailable
                  ? Icons.check_circle_outline
                  : Icons.accessibility_new,
              color: theme.colorScheme.primary,
            ),
            title: Text(assetAvailable
                ? 'Interactive muscle heatmap active'
                : 'Get the interactive muscle heatmap'),
            subtitle: Text(assetAvailable
                ? 'Powered by Fitness Visuals — Human Anatomy Advanced'
                : 'This build renders muscle stats as bars. The tappable '
                    'body heatmap is powered by a Rive asset from '
                    'fitnessvisuals.com — drop it into assets/rive/ to '
                    'activate.'),
            onTap: () => launchUrl(
              Uri.parse(ConfigConstants.fitnessVisualsUrl),
              mode: LaunchMode.externalApplication,
            ),
          ),
          ListTile(
            title: const Text('Reset dialog preferences'),
            subtitle: const Text('Re-enable all "don\'t ask again" warnings'),
            onTap: () async {
              final prefs = ref.read(sharedPreferencesProvider);
              for (final key in PrefKeys.resettable) {
                await prefs.remove(key);
              }
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preferences reset.')));
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> _editBodyWeight(BuildContext context, WidgetRef ref,
      MeasurementSystem ms, double? currentLb) async {
    final controller = TextEditingController(
      text: currentLb == null
          ? ''
          : UnitConverter.weightToUserMs(currentLb, ms).toStringAsFixed(1),
    );
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Body weight (${ms.weightUnit})'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result == null) return;
    final value = double.tryParse(result.replaceAll(',', '.'));
    if (value == null || value <= 0) return;
    final lb = UnitConverter.weightToImperial(value, ms);
    await ref
        .read(userDaoProvider)
        .updateUserWeight(ref.read(currentUserIdProvider), lb);
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
