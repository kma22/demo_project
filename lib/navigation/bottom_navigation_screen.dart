import 'package:auto_route/auto_route.dart';
import 'package:demo_project/di/injection.dart';
import 'package:demo_project/l10n/l10n.dart';
import 'package:demo_project/session/presentation/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:profile/profile.dart';
import 'package:ui_kit/ui_kit.dart';

/// Экран с bottom navigation bar.
///
/// Оркестрирует табы authenticated-зоны через [AutoTabsScaffold].
/// Резолвит [SessionCubit] из DI для logout, чтобы не пробрасывать callback
/// через всю цепочку контейнеров.
@RoutePage()
class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final onLogout = getIt<SessionCubit>().logout;

    return AutoTabsScaffold(
      backgroundColor: colors.background,
      resizeToAvoidBottomInset: false,
      routes: [
        HomeRoute(onLogout: onLogout),
        ProfileRoute(onLogout: onLogout),
      ],
      transitionBuilder: (context, child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return _BottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: colors.surface,
      indicatorColor: colors.primaryLight,
      surfaceTintColor: Colors.transparent,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: colors.iconSecondary),
          selectedIcon: Icon(Icons.home, color: colors.primary),
          label: l10n.bottomNavHome,
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline, color: colors.iconSecondary),
          selectedIcon: Icon(Icons.person, color: colors.primary),
          label: l10n.bottomNavProfile,
        ),
      ],
    );
  }
}
