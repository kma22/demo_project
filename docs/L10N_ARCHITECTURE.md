# Архитектура локализации

## Контекст

Проект — single-package. `flutter gen-l10n` генерирует один класс `AppLocalizations` на весь
проект — аналогично `flutter_gen` для ассетов. Сгенерированный код размещён в `core/` как общая
инфраструктура, доступная всем слоям.

---

## Почему l10n живёт в Core

### Аналогия с flutter_gen

`flutter_gen_runner` генерирует `Assets` в `lib/core/gen/`. Это не бизнес-логика — это
инфраструктурный код, который нужен всем. `AppLocalizations` — ровно такой же случай:
один генератор, один output, глобальная доступность.

### Граф зависимостей

```
App -> Core/l10n       (MaterialApp конфигурирует delegates)
Features -> Core/l10n  (фичи используют context.l10n.inspectionsEmpty)
Core x-> Features      (правило не нарушено — l10n не знает о фичах)
```

Все строки всех фич лежат в одних ARB-файлах, но это не нарушает модульность:
строки — данные, а не код. Фича зависит от контракта `AppLocalizations`, а не от строк
другой фичи.

### Универсальные модули не зависят от l10n

`l10n` — прикладной модуль: содержит строки конкретного продукта
(см. [LAYERS_ARCHITECTURE.md](LAYERS_ARCHITECTURE.md#зависимости-внутри-core)).
Универсальные core-модули не должны от него зависеть — иначе теряют переиспользуемость.

Текстовые значения приходят снаружи через параметры виджетов:

```dart
// Вызывающий код (фича или App):
AppBodyState.error(
  message: context.l10n.commonError,
  retryLabel: context.l10n.commonRetry,
  onRetry: () => bloc.add(Reload()),
)
```

---

## Структура файлов

```
l10n.yaml                              # конфиг в корне проекта
lib/core/l10n/
  l10n.dart                            # barrel (публичный API модуля)
  arb/
    app_ru.arb                         # шаблон (primary locale)
    app_en.arb                         # English
  generated/                           # output flutter gen-l10n (коммитится)
    app_localizations.dart
    app_localizations_ru.dart
    app_localizations_en.dart
  src/
    extensions/
      l10n_extension.dart              # context.l10n
```

---

## Конвенция ключей ARB

Формат: **camelCase с префиксом модуля**.

| Префикс        | Пример                    | Кто использует           |
|-----------------|---------------------------|--------------------------|
| `common`        | `commonRetry`             | Общие строки (кнопки, состояния) |
| `auth`          | `authLoginTitle`          | Фича авторизации         |
| `inspections`   | `inspectionsEmpty`        | Фича осмотров            |
| `profile`       | `profileLogout`           | Фича профиля             |

Описания (`@key`) обязательны в шаблоне (`app_ru.arb`):
```json
{
  "commonRetry": "Повторить",
  "@commonRetry": { "description": "Кнопка повторной попытки" }
}
```

---

## Команды

```bash
make l10n       # flutter gen-l10n — генерация после изменений в ARB
make rebuild    # clean -> get -> gen-l10n -> build_runner
```

---

## Миграция на multi-package

При переходе на multi-package (Melos) стратегия локализации меняется.

### Проблема

`flutter gen-l10n` работает **на уровне пакета**. Когда фичи станут отдельными пакетами,
единый `AppLocalizations` в `core` перестанет быть доступным — каждый пакет изолирован
и не видит генерированный код другого пакета.

### Решение: l10n на уровне каждого пакета

```
packages/
  core/
    lib/core_l10n/          # общие строки (commonRetry, commonError)
      arb/
      generated/
  features/
    inspections/
      lib/inspections_l10n/ # строки фичи (inspectionsEmpty, inspectionsTitle)
        arb/
        generated/
    auth/
      lib/auth_l10n/        # строки фичи (authLoginTitle, authLogout)
        arb/
        generated/
  app/                      # App не содержит строк — только собирает delegates
```

Каждый пакет имеет свой `l10n.yaml`, свои ARB-файлы, свой сгенерированный класс:
- `CoreLocalizations` — общие строки
- `InspectionsLocalizations` — строки осмотров
- `AuthLocalizations` — строки авторизации

### Что меняется

| Аспект                | Single-package (сейчас)          | Multi-package                     |
|-----------------------|----------------------------------|-----------------------------------|
| Количество классов    | 1 `AppLocalizations`             | N классов (по одному на пакет)    |
| ARB-файлы             | Одна пара в `core/l10n/arb/`     | Пара в каждом пакете              |
| Ключи                 | Префикс фичи в имени            | Без префикса (пространство имён = пакет) |
| MaterialApp delegates | Один список                      | Составной список из всех пакетов  |
| Extension             | `context.l10n`                   | `context.coreL10n`, `context.inspectionsL10n` |

### Что остаётся неизменным

- Универсальные core-модули не зависят от l10n — строки передаются через параметры.
- Принцип «фичи изолированы» сохраняется — каждая фича владеет своими строками.
- Генерированный код по-прежнему коммитится.

### Миграция

1. Перенести ключи с префиксом фичи в ARB-файлы соответствующего пакета.
2. Убрать префикс из ключей (`inspectionsEmpty` -> `empty`).
3. Добавить `l10n.yaml` в каждый пакет.
4. В `app` собрать все delegates в `localizationsDelegates`.
5. Заменить `context.l10n.inspectionsEmpty` на `context.inspectionsL10n.empty`.

Текущий подход (единый `AppLocalizations` с префиксами) — осознанный компромисс для
single-package. Он минимизирует boilerplate и не создаёт преждевременных абстракций,
при этом конвенция префиксов делает миграцию механической.
