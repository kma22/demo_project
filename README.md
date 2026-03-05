# Flutter Demo Project: Pure Modular Architecture

Демо-проект, демонстрирующий production-ready подход к разработке на Flutter
с чистой модульной архитектурой. Основная цель -- показать архитектурные решения,
позволяющие масштабировать приложение на неограниченное количество независимых модулей.

> На текущем этапе реализован фундамент и архитектурные контракты (Core-слой, навигация,
> API-клиент, UI Kit, локализация, session management). Слой функциональных модулей
> (`features/`) подготовлен к наполнению бизнес-логикой.

## Стек технологий

| Категория            | Инструменты                                                                         |
|----------------------|-------------------------------------------------------------------------------------|
| State Management     | `flutter_bloc`, `provider`, `ValueNotifier`                                         |
| Dependency Injection | `get_it` + `injectable`                                                             |
| Navigation           | `auto_route` (паттерн "Оркестратор")                                                |
| Networking           | `dio` с доменными исключениями и интерцепторами                                     |
| Local Storage        | `drift` (SQLite), `flutter_secure_storage`, `shared_preferences`                    |
| UI Kit               | Theme extensions, дизайн-токены, Google Fonts (Inter)                               |
| Localization         | `flutter gen-l10n`, ARB-файлы (ru/en)                                               |
| Logging              | `talker` + `talker_dio_logger` + `talker_flutter`                                   |
| Code Generation      | `build_runner`, `flutter_gen_runner`, `auto_route_generator`, `injectable_generator` |
| Linting              | `flutter_lints`                                                                     |

## Структура проекта

```
lib/
  main.dart                     # Единая точка входа (env через --dart-define)
  app/
    di/                         # Глобальный DI (injectable)
    router/                     # AppRouter + FeatureNavigation
    session/                    # Session management, декларативный роутинг
  core/
    api_client/                 # Dio-обертка, интерцепторы, доменные исключения
    environment_data/           # Dev/Prod конфигурации
    gen/                        # flutter_gen (типобезопасные ассеты)
    l10n/                       # Локализация (ARB, generated, extensions)
    local_storage/              # Drift DB, Secure Storage
    logger_manager/             # Talker, кастомные log-типы
    routing/                    # BaseFeatureNavigation (контракты)
    ui_kit/                     # Тема, токены, виджеты
  features/
    auth/                       # Авторизация
    home/                       # Главный экран
```

Подробнее о каждом слое -- в [docs/LAYERS_ARCHITECTURE.md](docs/LAYERS_ARCHITECTURE.md).

## Документация

- [Архитектура слоев](docs/LAYERS_ARCHITECTURE.md) -- App / Core / Features, граф зависимостей, модульность
- [Навигация](docs/NAVIGATION_ARCHITECTURE.md) -- паттерн "Оркестратор", BaseFeatureNavigation
- [Сетевой слой](docs/API_CLIENT_ARCHITECTURE.md) -- ApiClient, SessionObserver, обработка ошибок
- [Локальное хранилище](docs/DRIFT_ARCHITECTURE.md) -- Drift DB, миграции
- [UI Kit и темы](docs/UI_THEME_ARCHITECTURE.md) -- ThemeExtension, дизайн-токены, ThemeManager
- [Локализация](docs/L10N_ARCHITECTURE.md) -- ARB-конвенции, структура, миграция на multi-package

## Setup

**Requirements:** Flutter SDK ^3.9.2

**Шаги:**

1. `flutter pub get` -- установить зависимости
2. `make generate` -- сгенерировать код (DI, роуты, drift, ассеты)
3. `make l10n` -- сгенерировать локализацию
4. `make run-dev` -- запустить в dev-окружении

Или одной командой: `make rebuild && make run-dev`.

## Make-команды

```bash
make run-dev          # Запуск в dev-окружении
make run-prod         # Запуск в prod-окружении
make generate         # Генерация кода (build_runner)
make l10n             # Генерация локализации (flutter gen-l10n)
make analyze          # Статический анализ
make format           # Форматирование (dart format --line-length=100)
make test             # Запуск тестов
make rebuild          # Полная пересборка (clean -> get -> l10n -> generate)
```

### Настройка окружения

Параметры окружения (Base URL и др.) настраиваются в `lib/core/environment_data/`.
Окружение задается через `--dart-define=ENV=dev|prod`.

## Работа с Git

Перед созданием merge request:

1. `make format` -- убедиться, что код отформатирован
2. `make analyze` -- убедиться, что нет ошибок и warnings
3. `make generate` -- если менялись аннотации (DI, роуты, drift)
4. `make l10n` -- если менялись ARB-файлы
5. Проверить, что barrel-файлы актуальны -- новые публичные классы экспортированы
