import 'package:drift/drift.dart';

import '../../../../core/data/dao/exercise_dao.dart';
import '../../models/exercise_filter.dart';
import '../../models/models_view/exercise_vm.dart';

/// Read side: streams + one-shot reads, no writes. Filtering happens in SQL.
class ExerciseQueryRepository {
  ExerciseQueryRepository(this._dao);

  final ExerciseDao _dao;

  Stream<List<ExerciseVm>> watchUserExercises(
      String userId, ExerciseFilter filter) {
    return _dao
        .watchUserExerciseJoinedRows(
          userId,
          where: (ex, ue) {
            Expression<bool> predicate = const Constant(true);
            if (filter.searchText.isNotEmpty) {
              final pattern = '%${filter.searchText.trim()}%';
              predicate = predicate & ex.name.like(pattern);
            }
            if (filter.category != null) {
              predicate = predicate & ex.category.equals(filter.category!.name);
            }
            if (filter.bodyPart != null) {
              final names =
                  filter.bodyPart!.expanded.map((p) => p.name).toList();
              predicate = predicate & ex.bodyPart.isIn(names);
            }
            if (filter.favoritesOnly) {
              predicate = predicate & ue.isFavorite.equals(true);
            }
            return predicate;
          },
        )
        .map((rows) => _sort(rows.map((r) => r.toVm()).toList(), filter.sort));
  }

  List<ExerciseVm> _sort(List<ExerciseVm> list, ExerciseSort sort) {
    switch (sort) {
      case ExerciseSort.nameAsc:
        list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      case ExerciseSort.lastPerformedDesc:
        list.sort((a, b) =>
            (b.lastPerformedAt ?? 0).compareTo(a.lastPerformedAt ?? 0));
      case ExerciseSort.favoritesFirst:
        list.sort((a, b) {
          if (a.isFavorite != b.isFavorite) return a.isFavorite ? -1 : 1;
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
    }
    return list;
  }

  Future<UserExerciseJoinedRow?> getFullUserExercise(String userExerciseId) =>
      _dao.getFullUserExercise(userExerciseId);
}
