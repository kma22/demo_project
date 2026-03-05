.PHONY: run-dev run-prod build-dev build-prod get l10n generate analyze format test

# Запуск в Dev режиме
run-dev:
	flutter run --dart-define=ENV=dev

# Запуск в Prod режиме
run-prod:
	flutter run --dart-define=ENV=prod

# Сборка Dev APK
build-dev-apk:
	flutter build apk --dart-define=ENV=dev

# Сборка Prod APK
build-prod-apk:
	flutter build apk --dart-define=ENV=prod

# Получение зависимостей
get:
	flutter pub get

# Генерация локализации
l10n:
	flutter gen-l10n

# Генерация кода (injectable, auto_route и т.д.)
generate:
	dart run build_runner build --delete-conflicting-outputs

# Статический анализ
analyze:
	flutter analyze

# Форматирование всех Dart-файлов
format:
	dart format --line-length=100 lib/

# Запуск всех тестов
test:
	flutter test

# Полная очистка и пересборка
rebuild:
	flutter clean
	flutter pub get
	flutter gen-l10n
	dart run build_runner build --delete-conflicting-outputs
