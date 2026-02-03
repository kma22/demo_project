import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/router/app_router.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  final _logger = GetIt.I<AppLogger>();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling);

    return MaterialApp.router(
      title: 'DemoProject',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const _ScrollBehaviorModified(),
      routerConfig: _appRouter.config(
        navigatorObservers: () {
          return [AutoRouteObserver(), _logger.routeLoggerObserver];
        },
      ),
      builder: (context, widget) {
        return MediaQuery(data: mediaQueryData, child: widget!);
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
