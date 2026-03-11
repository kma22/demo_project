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
import 'package:login/src/presentation/login_container_screen.dart' as _i1;
import 'package:login/src/presentation/login_screen.dart' as _i2;

/// generated route for
/// [_i1.LoginContainerScreen]
class LoginContainerRoute extends _i3.PageRouteInfo<void> {
  const LoginContainerRoute({List<_i3.PageRouteInfo>? children})
    : super(LoginContainerRoute.name, initialChildren: children);

  static const String name = 'LoginContainerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginContainerScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i3.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    required void Function({
      required String accessToken,
      required String refreshToken,
    })
    onSuccess,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i3.WrappedRoute(
        child: _i2.LoginScreen(onSuccess: args.onSuccess, key: args.key),
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({required this.onSuccess, this.key});

  final void Function({
    required String accessToken,
    required String refreshToken,
  })
  onSuccess;

  final _i4.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{onSuccess: $onSuccess, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
