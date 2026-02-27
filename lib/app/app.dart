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
          home: const _ComponentShowcaseScreen(),
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

//TODO Временный экран для демонстрации UI Kit. Удалить после ревью.

class _ComponentShowcaseScreen extends StatefulWidget {
  const _ComponentShowcaseScreen();

  @override
  State<_ComponentShowcaseScreen> createState() => _ComponentShowcaseScreenState();
}

class _ComponentShowcaseScreenState extends State<_ComponentShowcaseScreen> {
  final _loadingButtons = <String>{};
  final _shimmerEnabled = ValueNotifier(true);

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
  void dispose() {
    _shimmerEnabled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final themeManager = Provider.of<AppThemeManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Kit Showcase'),
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
      body: AppRefreshIndicator(
        onRefresh: () async {
          await Future<void>.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(layout.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================== BUTTONS ====================
              _sectionTitle('Buttons', textStyles, colors),

              // Primary
              _label('Primary', textStyles, colors),
              SizedBox(height: layout.s8),
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

              SizedBox(height: layout.s24),

              // Secondary
              _label('Secondary', textStyles, colors),
              SizedBox(height: layout.s8),
              Wrap(
                spacing: layout.s12,
                runSpacing: layout.s12,
                children: [
                  AppButton.secondary(title: 'Medium', onTap: () {}),
                  AppButton.secondary(title: 'Disabled'),
                  AppButton.secondary(
                    title: 'Loading',
                    loading: _loadingButtons.contains('s'),
                    onTap: () => _toggleLoading('s'),
                  ),
                ],
              ),

              SizedBox(height: layout.s24),

              // Ghost
              _label('Ghost', textStyles, colors),
              SizedBox(height: layout.s8),
              Wrap(
                spacing: layout.s12,
                runSpacing: layout.s12,
                children: [
                  AppButton.ghost(title: 'Medium', onTap: () {}),
                  AppButton.ghost(title: 'Disabled'),
                ],
              ),

              SizedBox(height: layout.s24),

              // Destructive
              _label('Destructive', textStyles, colors),
              SizedBox(height: layout.s8),
              Wrap(
                spacing: layout.s12,
                runSpacing: layout.s12,
                children: [
                  AppButton.destructive(title: 'Medium', onTap: () {}),
                  AppButton.destructive(title: 'Disabled'),
                ],
              ),
              SizedBox(height: layout.s8),
              AppButton.destructive(title: 'Delete Account', expanded: true, onTap: () {}),

              _divider(layout),

              // ==================== LOADERS ====================
              _sectionTitle('Loaders', textStyles, colors),
              Row(
                spacing: layout.s32,
                children: [
                  Column(
                    children: [
                      AppLoader.small(),
                      SizedBox(height: layout.s8),
                      Text('Small', style: textStyles.labelS.copyWith(color: colors.textTertiary)),
                    ],
                  ),
                  Column(
                    children: [
                      AppLoader.medium(),
                      SizedBox(height: layout.s8),
                      Text('Medium', style: textStyles.labelS.copyWith(color: colors.textTertiary)),
                    ],
                  ),
                  Column(
                    children: [
                      AppLoader.large(),
                      SizedBox(height: layout.s8),
                      Text('Large', style: textStyles.labelS.copyWith(color: colors.textTertiary)),
                    ],
                  ),
                  Column(
                    children: [
                      AppLoader.medium(color: colors.error),
                      SizedBox(height: layout.s8),
                      Text('Custom', style: textStyles.labelS.copyWith(color: colors.textTertiary)),
                    ],
                  ),
                ],
              ),

              _divider(layout),

              // ==================== TEXT FIELD ====================
              _sectionTitle('Text Field', textStyles, colors),
              const AppTextField(
                label: 'Email',
                hintText: 'example@mail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: layout.s16),
              const AppTextField(label: 'Password', hintText: 'Enter password', obscureText: true),
              SizedBox(height: layout.s16),
              const AppTextField(
                label: 'With error',
                hintText: 'Type something',
                errorText: 'This field is required',
              ),
              SizedBox(height: layout.s16),
              const AppTextField(label: 'Disabled', hintText: 'Cannot edit', enabled: false),

              _divider(layout),

              // ==================== SNACK BARS ====================
              _sectionTitle('Snack Bars', textStyles, colors),
              Wrap(
                spacing: layout.s12,
                runSpacing: layout.s12,
                children: [
                  AppButton.primary(
                    title: 'Success',
                    size: AppButtonSize.small,
                    prefixIcon: Icon(Icons.check, size: 16, color: colors.onPrimary),
                    onTap: () => AppSnackBar.success(context, message: 'Changes saved'),
                  ),
                  AppButton.destructive(
                    title: 'Error',
                    size: AppButtonSize.small,
                    prefixIcon: Icon(Icons.close, size: 16, color: colors.staticWhite),
                    onTap: () => AppSnackBar.error(context, message: 'Network error'),
                  ),
                  AppButton.secondary(
                    title: 'Info',
                    size: AppButtonSize.small,
                    prefixIcon: Icon(Icons.info_outline, size: 16, color: colors.textPrimary),
                    onTap: () => AppSnackBar.info(context, message: 'Copied to clipboard'),
                  ),
                ],
              ),

              _divider(layout),

              // ==================== SHIMMER ====================
              _sectionTitle('Shimmer', textStyles, colors),
              ValueListenableBuilder(
                valueListenable: _shimmerEnabled,
                builder: (context, enabled, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppButton.ghost(
                        title: enabled ? 'Stop shimmer' : 'Start shimmer',
                        size: AppButtonSize.small,
                        onTap: () => _shimmerEnabled.value = !enabled,
                      ),
                      SizedBox(height: layout.s12),
                      AppShimmer(
                        enabled: enabled,
                        child: Column(
                          children: List.generate(3, (_) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: layout.s12),
                              child: Row(
                                children: [
                                  Skeleton.leaf(
                                    child: Container(
                                      width: layout.s48,
                                      height: layout.s48,
                                      decoration: BoxDecoration(
                                        color: colors.surfaceVariant,
                                        borderRadius: BorderRadius.circular(layout.r8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: layout.s12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Skeleton.leaf(
                                          child: Container(
                                            height: layout.s16,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: colors.surfaceVariant,
                                              borderRadius: BorderRadius.circular(layout.r4),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: layout.s8),
                                        Skeleton.leaf(
                                          child: Container(
                                            height: layout.s12,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              color: colors.surfaceVariant,
                                              borderRadius: BorderRadius.circular(layout.r4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),

              _divider(layout),

              // ==================== BODY STATES ====================
              _sectionTitle('Body States', textStyles, colors),

              _label('Empty', textStyles, colors),
              SizedBox(height: layout.s8),
              SizedBox(height: 550, child: AppBodyState.empty(message: 'No inspections yet')),

              SizedBox(height: layout.s24),

              _label('Error', textStyles, colors),
              SizedBox(height: layout.s8),
              SizedBox(
                height: 550,
                child: AppBodyState.error(
                  message: 'Failed to load data',
                  onRetry: () => AppSnackBar.info(context, message: 'Retrying...'),
                ),
              ),

              SizedBox(height: layout.s24),

              _label('Empty Search', textStyles, colors),
              SizedBox(height: layout.s8),
              SizedBox(height: 550, child: AppBodyState.emptySearch(message: 'No results found')),

              SizedBox(height: layout.s48),

              // ==================== REFRESH ====================
              Center(
                child: Text(
                  'Pull down to test RefreshIndicator',
                  style: textStyles.labelM.copyWith(color: colors.textTertiary),
                ),
              ),

              SizedBox(height: layout.s48),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, AppTextStyleExtension textStyles, AppColorsExtension colors) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s16),
      child: Text(title, style: textStyles.h2.copyWith(color: colors.textPrimary)),
    );
  }

  Widget _label(String title, AppTextStyleExtension textStyles, AppColorsExtension colors) {
    return Text(title, style: textStyles.labelL.copyWith(color: colors.textSecondary));
  }

  Widget _divider(AppLayoutExtension layout) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s32),
      child: const Divider(),
    );
  }
}
