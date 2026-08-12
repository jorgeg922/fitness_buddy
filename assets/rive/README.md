# Interactive Muscle Heatmap Asset

FitnessBuddy's interactive body heatmap is powered by the **Human Anatomy Advanced 3.0**
Rive asset from [Fitness Visuals](https://fitnessvisuals.com).

The asset is a commercial product and is **not included** in this repository.
The app builds and runs perfectly without it — the heatmap surfaces fall back to a
built-in muscle-group breakdown with the same data.

## Enabling the full heatmap

1. Get the asset at [fitnessvisuals.com](https://fitnessvisuals.com)
2. Copy `human_anatomy_advanced_v3.0.riv` into this folder:

   ```
   assets/rive/human_anatomy_advanced_v3.0.riv
   ```

3. Rebuild the app (`flutter run`). The interactive heatmap activates automatically -
   no code changes needed.

## What you get

- Anatomically accurate male & female figures, front and back views
- 29 individually addressable muscles with 5-level heat interpolation
- Tap-a-muscle interactivity (used by the Stats screen drill-down)
- Fully themeable heat palette
