import 'package:equatable/equatable.dart';

import '../../../core/taxonomy/body_part.dart';
import '../../../core/taxonomy/exercise_category.dart';

enum ExerciseSort { nameAsc, lastPerformedDesc, favoritesFirst }

/// UI filter state, pushed into SQL by the query repository (filtering
/// happens in the database, not in Dart).
class ExerciseFilter extends Equatable {
  const ExerciseFilter({
    this.searchText = '',
    this.category,
    this.bodyPart,
    this.favoritesOnly = false,
    this.sort = ExerciseSort.nameAsc,
  });

  final String searchText;
  final ExerciseCategory? category;
  final BodyPart? bodyPart;
  final bool favoritesOnly;
  final ExerciseSort sort;

  ExerciseFilter copyWith({
    String? searchText,
    ExerciseCategory? Function()? category,
    BodyPart? Function()? bodyPart,
    bool? favoritesOnly,
    ExerciseSort? sort,
  }) =>
      ExerciseFilter(
        searchText: searchText ?? this.searchText,
        category: category != null ? category() : this.category,
        bodyPart: bodyPart != null ? bodyPart() : this.bodyPart,
        favoritesOnly: favoritesOnly ?? this.favoritesOnly,
        sort: sort ?? this.sort,
      );

  bool get isDefault =>
      searchText.isEmpty &&
      category == null &&
      bodyPart == null &&
      !favoritesOnly;

  @override
  List<Object?> get props =>
      [searchText, category, bodyPart, favoritesOnly, sort];
}
