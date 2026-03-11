import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

/// Локальная БД приложения.
/// Подробнее: [DRIFT_ARCHITECTURE.md](demo_project/docs/DRIFT_ARCHITECTURE.md)
@DriftDatabase()
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database', native: const DriftNativeOptions());
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // TODO: Реализовать миграции при изменении схемы таблиц.
    },
    beforeOpen: (details) async {
      // FK enforcement
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
