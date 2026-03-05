import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Временная заглушка экрана логина.
@RoutePage()
class LoginScreen extends StatelessWidget {
  final void Function(String, String) onSuccess;

  const LoginScreen({required this.onSuccess, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onSuccess('fake_access', 'fake_refresh');
          },
          child: const Text('Войти'),
        ),
      ),
    );
  }
}
