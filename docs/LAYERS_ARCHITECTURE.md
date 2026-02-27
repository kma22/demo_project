# Архитектура слоев

## Контекст

Демо-проект, демонстрирующий production-ready подход к организации Flutter-приложения.
Проект живет в одном пакете (single-package), но архитектура слоев **заложена под миграцию
на multi-package** (Melos, отдельные Dart-пакеты). Разделение на App / Core / Features,
barrel-файлы, интерфейсы навигации -- все это становится обязательным при физическом
разделении на пакеты. В single-package это осознанный задел, а не over-engineering.

---

## Слои

### App Layer -- `lib/app/`

Точка сборки. Знает обо всех модулях, никто не знает о нем.

- Инициализация приложения, точки входа (`main_dev.dart`, `main_prod.dart`)
- Глобальный DI (`injection.dart`)
- `AppRouter` -- единственный `@AutoRouterConfig`, собирает route tree
- `FeatureNavigation` -- реализация `BaseFeatureNavigation`, маппит абстрактные вызовы на конкретные маршруты

### Core Layer -- `lib/core/`

Фундамент. Общие сервисы и контракты. Не зависит от фич.

- Сеть: `ApiClient`, обработка ошибок, интерцепторы ([API_CLIENT_ARCHITECTURE.md](API_CLIENT_ARCHITECTURE.md))
- Хранилище: Drift DB, Secure Storage ([DRIFT_ARCHITECTURE.md](DRIFT_ARCHITECTURE.md))
- Навигация: `BaseFeatureNavigation`, контракты ([NAVIGATION_ARCHITECTURE.md](NAVIGATION_ARCHITECTURE.md))
- UI Kit: тема, токены, виджеты ([UI_THEME_ARCHITECTURE.md](UI_THEME_ARCHITECTURE.md))
- Инфраструктура: логирование, DI-модули

### Features Layer -- `lib/features/`

Бизнес-логика. Каждая фича -- автономный модуль.

- Внутри может быть `data/`, `domain/`, `presentation/` для сложных фич, плоская структура для простых
- Фичи изолированы друг от друга. Общее выносится в Core
- Для навигации "вовне" используется `BaseFeatureNavigation` из Core

---

## Граф зависимостей

```
App -> Features -> Core
App -> Core
Features x-> Features   (фичи изолированы)
Core x-> Features        (ядро не знает о фичах)
Core x-> App             (ядро не знает о приложении)
```

---

## Модульность и импорты

Каждая папка в `core/` или `features/` -- условный пакет. У каждого есть barrel-файл,
выполняющий роль публичного API модуля.

**Правила импорта:**
- Внутри своего модуля -- любые файлы напрямую
- Из чужого модуля -- только через barrel. Прямой импорт из `src/` запрещен

**Barrel-файл** экспортирует только то, что нужно потребителям. `src/` -- внутренняя реализация.

При миграции на multi-package barrel-файлы станут `lib/<module>.dart` пакета,
а правила импорта будут enforced на уровне Dart package system.

---

## Структура модуля

```
lib/core/api_client/
  src/                          -- внутренняя реализация
    api_client.dart
    base_api_client.dart
    di/
      dio_module.dart
  api_client.dart               -- barrel-файл (публичный API)
```

```
lib/features/some_feature/
  src/
    data/
    domain/
    presentation/
  some_feature.dart             -- barrel-файл
```
