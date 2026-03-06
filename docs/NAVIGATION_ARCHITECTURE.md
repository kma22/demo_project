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

## Правила кросс-модульной навигации

### Нейминг

Методы в `BaseFeatureNavigation` именуются по шаблону `open<Name>Feature`:
`openRegistrationFeature`, `openChangePasswordFeature`. Это единая конвенция,
которая явно отделяет кросс-модульную навигацию от внутренней.

### Только push

Кросс-модульная навигация -- всегда `router.push(...)`. Фича не должна заменять
чужой стек (`replace`, `popAndPush`). Если фиче нужно закрыть себя перед переходом --
она делает `pop` сама, а затем вызывает метод оркестратора. Это позволяет оркестратору
оставаться тривиальным -- он всегда только `push`, что делает его методы очевидными,
унифицированными и переиспользуемыми.

Сложные сценарии (сброс стека, переход на существующий экран) -- либо отдельный
метод в оркестраторе, либо смена состояния на уровне выше (сессия, guard, redirect).
В обоих случаях стандартные методы `open<Name>Feature` остаются простыми и очевидными.
Причина выбора такого подхода вместо паттерна «мост» --
см. [Почему прямые методы, а не универсальный интерфейс](#почему-прямые-методы-а-не-универсальный-интерфейс).

### Параметры -- только примитивы

В методы `BaseFeatureNavigation` передаются только примитивные типы (`String`, `int`,
`bool`) или (`Map<String, dynamic>`). Никакие модели не должны торчать из фичи
для осуществления перехода в неё -- иначе фичи начнут зависеть от типов друг друга.
При миграции на multi-package это привело бы к циклическим зависимостям между пакетами.

Сериализация и десериализация данных для переходов -- ответственность самих фич.
Отправляющая фича сериализует в примитивы, принимающая -- десериализует обратно.

### Контейнер фичи (multi-package)

Каждая фича определяет свой роутер и контейнер-экран. Контейнер -- корневой узел,
реальные экраны -- его children:

```dart
// Роутер фичи
class SettingsRouter extends RootStackRouter {
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SettingsContainerRoute.page,
      children: [
        AutoRoute(page: SettingsRoute.page, initial: true),
        AutoRoute(page: ChangePasswordRoute.page),
      ],
    ),
  ];
}

// Контейнер -- точка входа, без собственного UI
@RoutePage()
class SettingsContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      delegates: const [SettingsLocalizations.delegate],
      context: context,
      // + BlocProvider / RepositoryProvider для shared state всего flow
      child: const AutoRouter(),
    );
  }
}
```

В полноценной модульной архитектуре пакет изолирован от хост-приложения. Без контейнера хост должен
вручную регистрировать делегаты каждого пакета в `MaterialApp` и знать о его внутренних
экранах -- это нарушает инкапсуляцию и не масштабируется. Контейнер делает фичу
самодостаточной -- она сама регистрирует свою локализацию, управляет навигацией
и провайдит зависимости. Для оркестратора контейнер -- единственная точка входа.

Контейнер отвечает за:
- **Per-feature локализация** -- `Localizations.override` регистрирует делегат фичи,
  делая строки доступными для всех вложенных экранов.
- **Вложенная навигация** -- `AutoRouter()` создаёт изолированный стек. Добавление
  и удаление экранов внутри фичи не затрагивает оркестратор.
- **Scoped state** -- `BlocProvider` на уровне контейнера расшаривает состояние между
  экранами flow. Контейнер disposed -- состояние очищено автоматически.
- **Route Guards** -- guard на контейнере защищает весь flow фичи целиком.

Контейнер создаётся даже если фича содержит один экран -- при расширении фичи
оркестратор и другие модули не потребуют изменений.

#### Почему не применяется в псевдомодульности

- Локализация единая (`AppLocalizations` в `MaterialApp`) -- `Localizations.override` не нужен.
- Один `@AutoRouterConfig` на проект -- вложенный `AutoRouter()` не даёт изоляции,
  маршруты всё равно живут в `app_router.gr.dart`.
- Scoped state решается через `AutoRouteWrapper` на самом экране.

Контейнеры появятся при миграции на multi-package, когда возникнут реальные проблемы
с изоляцией.

### Фичи не знают друг о друге

Всё взаимодействие между фичами идёт через оркестратор навигации. Фича вызывает
`context.router.openRegistrationFeature()` и не знает, какой экран откроется,
из какого модуля, и как устроена навигация внутри целевой фичи.

### Почему прямые методы, а не универсальный интерфейс

Рассматривался паттерн «мост»: единый метод `navigate(router, destination, strategy)`
вместо N методов `open<Name>Feature`. Отклонён по причинам:

- **Избыточность.** Мост добавляет два уровня абстракции (Destination + Strategy),
  которые на текущем масштабе не окупаются. Каждая фича -- один метод, список растёт
  линейно и контролируемо.
- **Читаемость.** `openRegistrationFeature(router)` понятнее, чем
  `navigate(router, RegistrationDestination(), Push())`.
- **ISP (Interface Segregation Principle).** Один жирный сервис с десятками методов --
  тоже не выход. При росте проекта `BaseFeatureNavigation` можно разделить на несколько
  узких интерфейсов по смыслу: `AuthNavigation`, `SettingsNavigation`,
  `InspectionsNavigation`. Каждый модуль зависит только от нужного контракта,
  а реализация в `FeatureNavigation` имплементирует их все.

Если количество фич вырастет до уровня, когда список методов станет неуправляемым --
пересмотреть решение в пользу ISP-декомпозиции.

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
| Локализация                    | Единая `AppLocalizations`               | Per-feature через `Localizations.override` в контейнере |
| Контейнер фичи                 | Не применяется                          | Обёртка навигации + зависимости          |

### Шаги миграции модуля в отдельный пакет

На примере фичи `registration`:

1. Создать пакет `packages/features/registration/` с `pubspec.yaml`,
   добавить зависимости `auto_route`, `auto_route_generator`.
2. Перенести экраны, бизнес-логику и DI-модуль в пакет. Структура внутри не меняется.
3. Добавить контейнер-экран и роутер фичи:
   ```dart
   // packages/features/registration/lib/src/router/registration_router.dart
   @AutoRouterConfig()
   class RegistrationRouter extends RootStackRouter {
     @override
     List<AutoRoute> get routes => [
       AutoRoute(
         page: RegistrationContainerRoute.page,
         children: [
           AutoRoute(page: RegistrationRoute.page, initial: true),
           AutoRoute(page: ConfirmEmailRoute.page),
         ],
       ),
     ];
   }
   ```
   ```dart
   // packages/features/registration/lib/src/presentation/registration_container_screen.dart
   @RoutePage()
   class RegistrationContainerScreen extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Localizations.override(
         delegates: const [RegistrationLocalizations.delegate],
         context: context,
         child: const AutoRouter(),
       );
     }
   }
   ```
4. Запустить `build_runner` внутри пакета -- `.gr.dart` сгенерируется рядом с роутером,
   маршруты будут принадлежать пакету.
5. Обновить barrel пакета -- экспортировать `Router` + `.gr.dart`, убрать экспорт экранов:
   ```dart
   // packages/features/registration/lib/registration.dart
   export 'src/router/registration_router.dart';
   export 'src/router/registration_router.gr.dart';
   ```
6. В `AppRouter` -- заменить прямое объявление маршрута на spread из роутера пакета:
   ```dart
   final _registrationRouter = RegistrationRouter();

   @override
   List<AutoRoute> get routes => [
     ..._registrationRouter.routes,
   ];
   ```
7. Убрать экраны из barrel старого модуля в `lib/features/` -- они теперь живут в пакете.

Каждая фича оборачивается в контейнер-экран, даже если содержит один экран --
см. [Контейнер фичи](#контейнер-фичи-multi-package).

`BaseFeatureNavigation`, DI-контракты и остальная архитектура не требуют изменений.
