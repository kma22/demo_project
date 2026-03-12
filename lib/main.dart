import 'package:demo_project/app.dart';
import 'package:demo_project/di/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');

  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(env);

  // TODO: Firebase, Crashlytics, etc.

  runApp(const App());
}
