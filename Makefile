.PHONY: run-dev run-prod build-dev build-prod get generate

# Запуск в Dev режиме
run-dev:
	flutter run -t lib/main_dev.dart --dart-define=ENV=dev

# Запуск в Prod режиме
run-prod:
	flutter run -t lib/main_prod.dart --dart-define=ENV=prod

# Сборка Dev APK
build-dev-apk:
	flutter build apk -t lib/main_dev.dart --dart-define=ENV=dev

# Сборка Prod APK
build-prod-apk:
	flutter build apk -t lib/main_prod.dart --dart-define=ENV=prod

# Получение зависимостей
get:
	flutter pub get

# Генерация кода (injectable, auto_route и т.д.)
generate:
	dart run build_runner build --delete-conflicting-outputs

# Полная очистка и пересборка
rebuild:
	flutter clean
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs
