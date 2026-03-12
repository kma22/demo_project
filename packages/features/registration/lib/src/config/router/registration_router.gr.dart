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
import 'package:registration/src/presentation/registration_container_screen.dart'
    as _i1;
import 'package:registration/src/presentation/registration_screen.dart' as _i2;

/// generated route for
/// [_i1.RegistrationContainerScreen]
class RegistrationContainerRoute extends _i3.PageRouteInfo<void> {
  const RegistrationContainerRoute({List<_i3.PageRouteInfo>? children})
    : super(RegistrationContainerRoute.name, initialChildren: children);

  static const String name = 'RegistrationContainerRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.RegistrationContainerScreen();
    },
  );
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i3.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    required void Function({
      required String accessToken,
      required String refreshToken,
    })
    onSuccess,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         RegistrationRoute.name,
         args: RegistrationRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'RegistrationRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationRouteArgs>();
      return _i3.WrappedRoute(
        child: _i2.RegistrationScreen(onSuccess: args.onSuccess, key: args.key),
      );
    },
  );
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({required this.onSuccess, this.key});

  final void Function({
    required String accessToken,
    required String refreshToken,
  })
  onSuccess;

  final _i4.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{onSuccess: $onSuccess, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegistrationRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}
