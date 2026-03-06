# Flutter Demo Project: Pure Modular Architecture

Демо-проект, демонстрирующий production-ready подход к разработке на Flutter
с чистой модульной архитектурой. Основная цель -- показать архитектурные решения,
позволяющие масштабировать приложение на неограниченное количество независимых модулей.

> Проект использует псевдомодульную архитектуру: модули живут в одном пакете,
> но следуют тем же правилам изоляции, что и полноценные Dart-пакеты
> (barrel-файлы, запрет прямых импортов из чужих `src/`, граф зависимостей
> App -> Features -> Core). От multi-package структуры отказались в пользу скорости
> разработки -- принципы те же, накладные расходы минимальны.
> Подробнее о миграции на multi-package -- в [NAVIGATION_ARCHITECTURE.md](docs/NAVIGATION_ARCHITECTURE.md).
>
> Компромиссы single-package:
> - **Роутинг** -- один `@AutoRouterConfig`, все маршруты в `app_router.gr.dart`, экраны вынуждены торчать из barrel
> - **Локализация** -- единый `AppLocalizations`, общие ARB-файлы, разделение через префиксы ключей
> - **Ассеты** -- один `assets.gen.dart` в `core/gen/`, доступный всем слоям
> - **DI** -- единый `injection.config.dart` на весь проект
> - **Тесты** -- запрет импорта чужого `src/` держится на дисциплине, не на компиляторе
> - **Feature Containers** -- не применяются (per-feature локализация, scoped state и вложенная навигация не нужны)
>
> Каждый компромисс задокументирован с планом миграции -- см. документацию ниже.

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
    navigation/                 # Bottom navigation bar
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
    login/                      # Авторизация (валидация через Form)
    registration/               # Регистрация (валидация через UseCase)
    home/                       # Главный экран
    profile/                    # Профиль пользователя
```

Подробнее о каждом слое -- в [docs/LAYERS_ARCHITECTURE.md](docs/LAYERS_ARCHITECTURE.md).

## Документация

- [Архитектура слоев](docs/LAYERS_ARCHITECTURE.md) -- App / Core / Features, граф зависимостей, модульность
- [Навигация](docs/NAVIGATION_ARCHITECTURE.md) -- паттерн "Оркестратор", кросс-модульные правила, миграция на multi-package
- [Сетевой слой](docs/API_CLIENT_ARCHITECTURE.md) -- ApiClient, SessionObserver, обработка ошибок
- [Локальное хранилище](docs/DRIFT_ARCHITECTURE.md) -- Drift DB, миграции
- [UI Kit и темы](docs/UI_THEME_ARCHITECTURE.md) -- ThemeExtension, дизайн-токены, ThemeManager
- [Локализация](docs/L10N_ARCHITECTURE.md) -- ARB-конвенции, структура, миграция на multi-package

## Архитектурные решения в фичах

### Два подхода к валидации: Login vs Registration

Проект намеренно демонстрирует два различных подхода к валидации форм,
чтобы показать когда какой уместен и как каждый ложится в архитектуру.

**Login -- валидация на уровне виджетов (Form + validator)**

```
EmailField.validator -> Form.validate() -> submit
PasswordField.validator -> Form.validate() -> submit
```

Простая форма с двумя полями. Правила тривиальны (не пусто, формат email, мин. длина).
Валидация встроена в виджеты через `TextFormField.validator`, кубит получает уже
провалидированные данные. Минимум кода, максимум пользы от стандартных средств Flutter.

**Registration -- валидация в domain-слое (UseCase)**

```
UI (сырые данные) -> Cubit -> ValidateRegistrationUseCase -> ошибки в стейте
                           -> RegisterUseCase (нормализация, запрос)
```

Форма сложнее: кросс-валидация полей (пароль == подтверждение), каскад правил пароля
(длина -> uppercase -> lowercase -> digit), нормализация email. Валидация вынесена
в `ValidateRegistrationUseCase` -- чистая функция, покрытая unit-тестами.
Динамическая валидация: ошибки появляются по мере ввода, но только после первой
попытки отправки.

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
