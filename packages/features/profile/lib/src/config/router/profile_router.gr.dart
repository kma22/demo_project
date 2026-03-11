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
import 'package:profile/src/presentation/profile_container_screen.dart' as _i1;
import 'package:profile/src/presentation/profile_screen.dart' as _i2;

/// generated route for
/// [_i1.ProfileContainerScreen]
class ProfileContainerRoute extends _i3.PageRouteInfo<void> {
  const ProfileContainerRoute({List<_i3.PageRouteInfo>? children})
    : super(ProfileContainerRoute.name, initialChildren: children);

  static const String name = 'ProfileContainerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.ProfileContainerScreen();
    },
  );
}

/// generated route for
/// [_i2.ProfileScreen]
class ProfileRoute extends _i3.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    required _i4.VoidCallback onLogout,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         ProfileRoute.name,
         args: ProfileRouteArgs(onLogout: onLogout, key: key),
         initialChildren: children,
       );

  static const String name = 'ProfileRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return _i2.ProfileScreen(onLogout: args.onLogout, key: args.key);
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({required this.onLogout, this.key});

  final _i4.VoidCallback onLogout;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{onLogout: $onLogout, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileRouteArgs) return false;
    return onLogout == other.onLogout && key == other.key;
  }

  @override
  int get hashCode => onLogout.hashCode ^ key.hashCode;
}
