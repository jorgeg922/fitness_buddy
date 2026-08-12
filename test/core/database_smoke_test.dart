import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:fitness_buddy/core/data/dao/user_dao.dart';
import 'package:fitness_buddy/core/data/database.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('schema creates, user row round-trips, FK cascade works', () async {
    final dao = UserDao(db);
    await dao.upsertUser(AppUserTableCompanion.insert(
      id: 'local',
      userName: 'Athlete',
      createdAt: 1000,
    ));

    final user = await dao.getUser('local');
    expect(user, isNotNull);
    expect(user!.userName, 'Athlete');
    expect(user.hasCompletedInitialSetup, isFalse);

    // FK enforcement: routine referencing a missing user must throw.
    expect(
      () => db.routineDao.upsertRoutine(RoutineTableCompanion.insert(
        id: 'r1',
        userId: 'ghost',
        name: 'Push Day',
        createdAt: 1000,
      )),
      throwsA(anything),
    );

    // Cascade: exercise owned by user disappears with the user.
    await db.exerciseDao.upsertExercise(ExerciseTableCompanion.insert(
      id: 'e1',
      ownerUserId: const Value('local'),
      name: 'Custom Press',
      category: 'strength',
      bodyPart: 'chest',
      createdAt: 1000,
    ));
    await (db.delete(db.appUserTable)..where((t) => t.id.equals('local'))).go();
    final orphan = await (db.select(db.exerciseTable)
          ..where((t) => t.id.equals('e1')))
        .getSingleOrNull();
    expect(orphan, isNull);
  });

  test('draft payload JSON converter round-trips', () async {
    final dao = UserDao(db);
    await dao.upsertUser(AppUserTableCompanion.insert(
      id: 'local',
      userName: 'Athlete',
      createdAt: 1000,
    ));

    await db.workoutDraftDao.upsertDraft(
      ActiveWorkoutDraftTableCompanion.insert(
        userId: 'local',
        routineId: 'ad-hoc',
        userExerciseId: 'ue1',
        startedAt: 2000,
        payloadJson: const {
          'sets': [
            {'weight': 135.0, 'reps': 8, 'completed': true},
          ],
          'is_skipped': false,
          'is_completed': false,
        },
      ),
    );

    final drafts = await db.workoutDraftDao.getDrafts('local');
    expect(drafts, hasLength(1));
    expect(drafts.single.payloadJson['sets'], hasLength(1));
    expect(drafts.single.payloadJson['is_completed'], isFalse);

    // Upsert on the same userExerciseId replaces, not duplicates.
    await db.workoutDraftDao.upsertDraft(
      ActiveWorkoutDraftTableCompanion.insert(
        userId: 'local',
        routineId: 'ad-hoc',
        userExerciseId: 'ue1',
        startedAt: 3000,
        payloadJson: const {'sets': [], 'is_skipped': true},
      ),
    );
    final after = await db.workoutDraftDao.getDrafts('local');
    expect(after, hasLength(1));
    expect(after.single.payloadJson['is_skipped'], isTrue);
  });
}
