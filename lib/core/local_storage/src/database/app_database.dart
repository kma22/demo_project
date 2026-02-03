import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

/// Основной класс локальной базы данных приложения.
///
/// Использует [Drift] для реактивного управления данными и [drift_flutter]
/// для кроссплатформенного подключения.
///
/// Подробнее: [DRIFT_ARCHITECTURE.md](demo_project/docs/docs/DRIFT_ARCHITECTURE.md)
@DriftDatabase(tables: [])
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        // Конфигурация пути и параметров SQLite для мобильных платформ.
      ),
    );
  }

  /// Конфигурация стратегии миграции и инициализации БД.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // TODO: Реализовать миграции при изменении схемы таблиц.
        },
        beforeOpen: (details) async {
          // Включение поддержки внешних ключей (Foreign Keys) для обеспечения целостности данных.
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
