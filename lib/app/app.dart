import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/router/app_router.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
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
        return MaterialApp(
          title: 'DemoProject',
          debugShowCheckedModeBanner: false,
          scrollBehavior: const _ScrollBehaviorModified(),
          theme: _themeManager.currentThemeData,
          home: const _ButtonShowcaseScreen(),
          builder: (context, widget) {
            return Provider<AppThemeManager>.value(value: _themeManager, child: widget);
          },
        );
      },
    );
  }

  // ignore: unused_element
  Widget _buildRouter() {
    return MaterialApp.router(
      title: 'DemoProject',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const _ScrollBehaviorModified(),
      theme: _themeManager.currentThemeData,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [AutoRouteObserver(), _logger.routeLoggerObserver],
      ),
      builder: (context, widget) {
        return Provider<AppThemeManager>.value(value: _themeManager, child: widget);
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

//TODO Временный экран для проверки кнопок. Удалить после ревью.

class _ButtonShowcaseScreen extends StatefulWidget {
  const _ButtonShowcaseScreen();

  @override
  State<_ButtonShowcaseScreen> createState() => _ButtonShowcaseScreenState();
}

class _ButtonShowcaseScreenState extends State<_ButtonShowcaseScreen> {
  final _loadingButtons = <String>{};

  void _toggleLoading(String id) {
    setState(() {
      if (_loadingButtons.contains(id)) {
        _loadingButtons.remove(id);
      } else {
        _loadingButtons.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final themeManager = Provider.of<AppThemeManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Showcase'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: () {
              final current = themeManager.currentTheme;
              themeManager.changeTheme = switch (current) {
                AppThemeType.light => AppThemeType.dark,
                AppThemeType.dark => AppThemeType.light,
                AppThemeType.system =>
                  Theme.of(context).brightness == Brightness.dark
                      ? AppThemeType.light
                      : AppThemeType.dark,
              };
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(layout.s24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Primary ---
            Text('Primary', style: textStyles.h2.copyWith(color: colors.textPrimary)),
            SizedBox(height: layout.s12),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.primary(title: 'Large', size: AppButtonSize.large, onTap: () {}),
                AppButton.primary(title: 'Medium', onTap: () {}),
                AppButton.primary(title: 'Small', size: AppButtonSize.small, onTap: () {}),
              ],
            ),
            SizedBox(height: layout.s8),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.primary(title: 'Disabled', enabled: false),
                AppButton.primary(
                  title: 'Loading',
                  loading: _loadingButtons.contains('p'),
                  onTap: () => _toggleLoading('p'),
                ),
                AppButton.primary(
                  title: 'With Icon',
                  prefixIcon: Icon(Icons.add, size: 18, color: colors.onPrimary),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: layout.s8),
            AppButton.primary(title: 'Expanded', expanded: true, onTap: () {}),

            SizedBox(height: layout.s32),

            // --- Secondary ---
            Text('Secondary', style: textStyles.h2.copyWith(color: colors.textPrimary)),
            SizedBox(height: layout.s12),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.secondary(title: 'Large', size: AppButtonSize.large, onTap: () {}),
                AppButton.secondary(title: 'Medium', onTap: () {}),
                AppButton.secondary(title: 'Small', size: AppButtonSize.small, onTap: () {}),
              ],
            ),
            SizedBox(height: layout.s8),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.secondary(title: 'Disabled'),
                AppButton.secondary(
                  title: 'Loading',
                  loading: _loadingButtons.contains('s'),
                  onTap: () => _toggleLoading('s'),
                ),
                AppButton.secondary(
                  title: 'With Icon',
                  prefixIcon: Icon(Icons.filter_list, size: 18, color: colors.textPrimary),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: layout.s8),
            AppButton.secondary(title: 'Expanded', expanded: true, onTap: () {}),

            SizedBox(height: layout.s32),

            // --- Ghost ---
            Text('Ghost', style: textStyles.h2.copyWith(color: colors.textPrimary)),
            SizedBox(height: layout.s12),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.ghost(title: 'Large', size: AppButtonSize.large, onTap: () {}),
                AppButton.ghost(title: 'Medium', onTap: () {}),
                AppButton.ghost(title: 'Small', size: AppButtonSize.small, onTap: () {}),
              ],
            ),
            SizedBox(height: layout.s8),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.ghost(title: 'Disabled'),
                AppButton.ghost(
                  title: 'Loading',
                  loading: _loadingButtons.contains('g'),
                  onTap: () => _toggleLoading('g'),
                ),
              ],
            ),

            SizedBox(height: layout.s32),

            // --- Destructive ---
            Text('Destructive', style: textStyles.h2.copyWith(color: colors.textPrimary)),
            SizedBox(height: layout.s12),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.destructive(title: 'Large', size: AppButtonSize.large, onTap: () {}),
                AppButton.destructive(title: 'Medium', onTap: () {}),
                AppButton.destructive(title: 'Small', size: AppButtonSize.small, onTap: () {}),
              ],
            ),
            SizedBox(height: layout.s8),
            Wrap(
              spacing: layout.s12,
              runSpacing: layout.s12,
              children: [
                AppButton.destructive(title: 'Disabled'),
                AppButton.destructive(
                  title: 'Loading',
                  loading: _loadingButtons.contains('d'),
                  onTap: () => _toggleLoading('d'),
                ),
              ],
            ),
            SizedBox(height: layout.s8),
            AppButton.destructive(title: 'Delete Account', expanded: true, onTap: () {}),

            SizedBox(height: layout.s48),
          ],
        ),
      ),
    );
  }
}
