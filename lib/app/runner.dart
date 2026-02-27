import 'package:demo_project/app/app.dart';
import 'package:demo_project/app/di/injection.dart';
import 'package:flutter/material.dart';

/// Точка инициализации и запуска приложения.
Future<void> runMainApp(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(environment);

  // TODO: Firebase, Crashlytics, etc.

  runApp(const App());
}
