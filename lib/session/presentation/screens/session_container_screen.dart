import 'package:auto_route/auto_route.dart';
import 'package:demo_project/router/app_router.dart';
import 'package:demo_project/session/presentation/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/login.dart';

/// Корневой контейнер приложения.
///
/// Декларативно переключает поддеревья маршрутов
/// в зависимости от состояния сессии.
@RoutePage()
class SessionContainerScreen extends StatelessWidget {
  const SessionContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionCubit = context.read<SessionCubit>();

    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (_) => [
            if (state is SessionLoadingState) const SplashRoute(),
            if (state is AuthenticatedState) const AuthenticatedContainerRoute(),
            if (state is UnauthenticatedState)
              UnauthenticatedContainerRoute(
                children: [
                  LoginContainerRoute(
                    children: [LoginRoute(onSuccess: sessionCubit.onLoginSuccess)],
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
