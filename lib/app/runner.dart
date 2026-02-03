import 'package:demo_project/app/app.dart';
import 'package:demo_project/app/di/injection.dart';
import 'package:flutter/material.dart';

/// Класс для инициализации и запуска приложения.
/// Инкапсулирует общую логику для всех энвайрментов.
/// Точка инициализации приложения.
/// Обеспечивает единую последовательность запуска для всех конфигураций.
Future<void> runMainApp(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(environment);

  // Место для расширения: инициализация системных сервисов (Error tracking, Firebase, etc.)

  runApp(const App());
}
