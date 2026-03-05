import 'package:demo_project/app/app.dart';
import 'package:demo_project/app/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');

  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env);

  // TODO: Firebase, Crashlytics, etc.

  runApp(const App());
}
