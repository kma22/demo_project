# Code Style

## Язык

- **Код** (имена классов, переменных, тестов, комментарии в коде) -- английский.
- **Документация для людей** (`docs/`, ARB `@description`) -- русский.

---

## Нейминг

- Файлы: `snake_case.dart`.
- Классы: `PascalCase`.
- Интерфейсы: `abstract interface class Base*` (`BaseApiClient`, `BaseAuthRepository`).
- Реализации: без префикса (`ApiClient implements BaseApiClient`).
- Barrel-файлы: имя модуля (`ui_kit.dart`, `routing.dart`, `l10n.dart`).
- Конвенция ключей l10n: camelCase с префиксом фичи (`commonRetry`, `authLoginTitle`).

---

## Структура модуля

- `src/` -- внутренняя реализация. Извне не импортировать, только через barrel.
- Barrel-файл = публичный API модуля. Экспортирует только то, что нужно потребителям.

---

## Форматирование и линтер

- **Длина строки:** 100 символов.
- **Форматирование:** `dart format --line-length=100`. Запуск: `make format`.
- **Линтер:** `flutter_lints` -- строгие правила. Проверка: `make analyze`.

---

## Doc-comments

- Публичные API модулей -- doc-comments обязательны.
- Интерфейсы (`Base*`) -- doc-comments даже внутренние.
- Остальной внутренний код -- self-documenting, комментарии только где логика неочевидна.

