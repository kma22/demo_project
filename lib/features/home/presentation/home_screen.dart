import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Временная заглушка главного экрана.
@RoutePage()
class HomeScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const HomeScreen({required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: onLogout, child: const Text('Выйти')),
      ),
    );
  }
}
