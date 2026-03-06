# Сетевой слой

## Компоненты

### BaseApiClient -- интерфейс

**Путь:** `lib/core/api_client/src/base_api_client.dart`

Контракт сетевого клиента. Репозитории зависят от абстракции, а не от `Dio` напрямую --
упрощает тестирование и замену HTTP-библиотеки.

### ApiClient -- реализация

**Путь:** `lib/core/api_client/src/api_client.dart`

Обертка над `Dio`:
- Выполнение HTTP-запросов (GET, POST, PUT, DELETE)
- Централизованный маппинг ответов и типизация
- Трансформация `DioException` в доменные исключения

### SessionObserver

**Путь:** `lib/core/api_client/src/session_observer.dart`

Глобальный наблюдатель состояния сессии:
- Предоставляет `Stream<void>` для подписки на события истечения сессии
- Мост между сетевым слоем (интерцептор ловит 401) и UI (редирект на логин)

### DioModule -- фабрика

**Путь:** `lib/core/api_client/src/di/dio_module.dart`

Настройка и регистрация `Dio` в DI-контейнере:
- Глобальные таймауты (30с по умолчанию)
- Базовый URL из `EnvironmentData`
- Сборка цепочки интерцепторов
- `OauthInterceptor` триггерит `SessionObserver.emitSessionExpired()` при 401

---

## Обработка ошибок

Все `DioException` перехватываются в `ApiClient` и трансформируются в доменные типы:

- `BadRequestException` -- 400
- `UnauthorizedException` -- 401
- `ConnectionException` -- нет сети / таймаут
- `InvalidDataException` -- ответ не соответствует ожидаемому типу `T`

Клиент извлекает человекочитаемое сообщение и внутренний код ошибки из тела ответа.

**В UI/BLoC не должен попадать `DioException`** -- только доменные типы.
