# Архитектура навигации

## Контекст

Это демо-проект, демонстрирующий production-ready архитектуру. Проект — single-package,
но архитектура навигации **заложена под миграцию на multi-package** (Melos, отдельные пакеты).
Все решения ниже — не over-engineering, а осознанный задел: разделение на слои, интерфейс
`BaseFeatureNavigation`, barrel-экспорт экранов — всё это становится обязательным при выносе
модулей в отдельные пакеты.

---

## Слои

### Core -- `lib/core/routing/`

Абстракции. Доступен всем, сам не знает ни о фичах, ни о App.

- **`BaseFeatureNavigation`** — интерфейс кросс-модульной навигации. Фича вызывает
  `navigation.openChangePasswordFeature(router, email)` и не знает, куда ведёт переход.
  В multi-package это единственный способ связать изолированные пакеты.

### App -- `lib/app/router/`

Композиция. Знает обо всём, никто не знает о нём.

- **`AppRouter`** — единственный `@AutoRouterConfig`. Собирает route tree из экранов всех модулей.
- **`FeatureNavigation`** — реализация `BaseFeatureNavigation`. Маппит абстрактные вызовы
  на конкретные маршруты. Регистрируется через DI как `@LazySingleton(as: BaseFeatureNavigation)`.

### Модули -- `lib/core/*/`, `lib/features/*/`

Экраны и бизнес-логика. Каждый модуль:
- Аннотирует экраны `@RoutePage()`.
- Экспортирует их через barrel-файл.
- Для навигации "вовне" использует `BaseFeatureNavigation` из Core.

---

## Импорты и вынужденное ограничение single-package

В multi-package каждый пакет имеет свой `@AutoRouterConfig` и генерирует `.gr.dart`
изолированно — маршруты живут рядом с экранами. В single-package это невозможно:
генератор `auto_route` находит единственный `@AutoRouterConfig` и генерирует **все** маршруты
в `app_router.gr.dart`.

Следствие: `app_router.gr.dart` — это `part of 'app_router.dart'`, и он ссылается на классы
экранов. Поэтому `app_router.dart` **обязан** импортировать экраны. Делает это через barrel:

```
app_router.dart
  -> import logger_manager.dart (barrel)     [OK] App -> Core
    -> export talker_logger_screen.dart      [OK] внутренний экран виден через публичный API
```

В multi-package этот импорт заменится на импорт пакета, а экран перестанет торчать из barrel —
он будет скрыт за `.gr.dart` пакета.

---

## Миграция на multi-package

Архитектура спроектирована так, что при выносе модуля в отдельный пакет меняется
только инфраструктура маршрутизации, а бизнес-логика и слои остаются нетронутыми:

| Аспект                         | Single-package (сейчас)                 | Multi-package                            |
| ------------------------------ | --------------------------------------- | ---------------------------------------- |
| `@AutoRouterConfig`            | Один, в `AppRouter`                     | Свой в каждом пакете                     |
| `.gr.dart`                     | Все маршруты в `app_router.gr.dart`     | Каждый пакет генерирует свой             |
| Barrel экспортирует экран      | Да (вынужденно)                         | Нет -- экспортирует `Router` + `.gr.dart` |
| `AppRouter` собирает routes    | Напрямую: `AutoRoute(page:)`            | Через spread: `..._module.routes`        |
| `BaseFeatureNavigation`        | Работает                                | Работает без изменений                   |
| DI-контракты                   | Работают                                | Работают без изменений                   |

### Шаги миграции модуля в отдельный пакет

На примере `logger_manager`:

1. Создать пакет `packages/core/logger_manager/` с `pubspec.yaml`,
   добавить зависимости `auto_route`, `auto_route_generator`.
2. Перенести экраны, бизнес-логику и DI-модуль в пакет. Структура внутри не меняется.
3. Добавить в пакет собственный роутер:
   ```dart
   // packages/core/logger_manager/lib/src/router/logger_manager_router.dart
   @AutoRouterConfig()
   class LoggerManagerRouter extends RootStackRouter {
     @override
     List<AutoRoute> get routes => [AutoRoute(page: TalkerLoggerRoute.page)];
   }
   ```
4. Запустить `build_runner` внутри пакета -- `.gr.dart` сгенерируется рядом с роутером,
   `TalkerLoggerRoute` будет принадлежать пакету.
5. Обновить barrel пакета -- экспортировать `Router` + `.gr.dart`, убрать экспорт экрана:
   ```dart
   // packages/core/logger_manager/lib/logger_manager.dart
   export 'src/router/logger_manager_router.dart';
   export 'src/router/logger_manager_router.gr.dart';
   export 'src/app_logger.dart';
   ```
6. В `AppRouter` -- заменить прямое объявление маршрута на spread из роутера пакета:
   ```dart
   final _loggerManagerRouter = LoggerManagerRouter();

   @override
   List<AutoRoute> get routes => [
     ..._loggerManagerRouter.routes,
   ];
   ```
7. Убрать экран из barrel старого модуля в `lib/core/` -- он теперь живёт в пакете.

`BaseFeatureNavigation`, DI-контракты и остальная архитектура не требуют изменений.
