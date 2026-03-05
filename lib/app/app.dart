import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/router/app_router.dart';
import 'package:demo_project/app/session/presentation/cubit/session_cubit.dart';
import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  final _themeManager = GetIt.I<AppThemeManager>();
  final _logger = GetIt.I<AppLogger>();

  @override
  void initState() {
    super.initState();
    _themeManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _themeManager.controller,
      builder: (context, _, _) {
        return MaterialApp.router(
          title: 'DemoProject',
          debugShowCheckedModeBanner: false,
          scrollBehavior: const _ScrollBehaviorModified(),
          theme: _themeManager.currentThemeData,
          locale: const Locale('ru'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: _appRouter.config(
            navigatorObservers: () => [AutoRouteObserver(), _logger.routeLoggerObserver],
          ),
          builder: (context, widget) {
            return Provider<AppThemeManager>.value(
              value: _themeManager,
              child: BlocProvider<SessionCubit>.value(
                value: GetIt.I<SessionCubit>(),
                child: widget,
              ),
            );
          },
        );
      },
    );
  }
}

class _ScrollBehaviorModified extends ScrollBehavior {
  const _ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
