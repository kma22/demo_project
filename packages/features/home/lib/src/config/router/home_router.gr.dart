// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:home/src/presentation/home_container_screen.dart' as _i1;
import 'package:home/src/presentation/home_screen.dart' as _i2;

/// generated route for
/// [_i1.HomeContainerScreen]
class HomeContainerRoute extends _i3.PageRouteInfo<void> {
  const HomeContainerRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeContainerRoute.name, initialChildren: children);

  static const String name = 'HomeContainerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeContainerScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i4.VoidCallback onLogout,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(onLogout: onLogout, key: key),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return _i2.HomeScreen(onLogout: args.onLogout, key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.onLogout, this.key});

  final _i4.VoidCallback onLogout;

  final _i4.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{onLogout: $onLogout, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return onLogout == other.onLogout && key == other.key;
  }

  @override
  int get hashCode => onLogout.hashCode ^ key.hashCode;
}
