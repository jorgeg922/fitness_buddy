# Contributing to FitnessBuddy

Thanks for your interest! FitnessBuddy is a fully offline Flutter workout
tracker built around a muscle-heatmap visualization. Contributions of all
sizes are welcome.

## Getting started

```bash
git clone https://github.com/jorgeg922/fitness_buddy.git
cd fitness_buddy
flutter pub get
dart run build_runner build --force-jit   # drift codegen
flutter run
```

The app builds and runs **without** the commercial Rive heatmap asset — see
`assets/rive/README.md`. Heatmap surfaces fall back to muscle-group bars, so
you can develop every feature without it.

## Architecture in 30 seconds

Strict one-way layering, repeated in every feature:

```
Widget → Riverpod provider → UseCase (Result<T>) → Repository (read/write split) → Drift DAO → SQLite
```

- `lib/core/` — Drift schema/DAOs, taxonomy enums, theme.
- `lib/features/<name>/` — feature-first modules (models / services /
  use_cases / providers / screens / widgets).
- All numeric data is stored in **imperial** and converted at the edges.
- Charts and heatmaps read pre-computed rollup tables, never raw set logs.

## Ground rules

- `flutter analyze` must be clean and `flutter test` green before a PR.
- New logic wants a unit test (the in-memory Drift pattern in `test/` makes
  this cheap).
- Keep the layering: UI never touches a DAO or write repository directly.
- One feature per PR where possible.

## Reporting bugs

Open a GitHub issue with reproduction steps, expected vs actual behavior,
and your Flutter version (`flutter --version`).
