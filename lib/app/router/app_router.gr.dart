// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthenticatedContainerScreen]
class AuthenticatedContainerRoute extends PageRouteInfo<void> {
  const AuthenticatedContainerRoute({List<PageRouteInfo>? children})
    : super(AuthenticatedContainerRoute.name, initialChildren: children);

  static const String name = 'AuthenticatedContainerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticatedContainerScreen();
    },
  );
}

/// generated route for
/// [BottomNavigationScreen]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
    : super(BottomNavigationRoute.name, initialChildren: children);

  static const String name = 'BottomNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavigationScreen();
    },
  );
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    required void Function({
      required String accessToken,
      required String refreshToken,
    })
    onSuccess,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         RegistrationRoute.name,
         args: RegistrationRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'RegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegistrationRouteArgs>();
      return WrappedRoute(
        child: RegistrationScreen(onSuccess: args.onSuccess, key: args.key),
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

  final Key? key;

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

/// generated route for
/// [SessionContainerScreen]
class SessionContainerRoute extends PageRouteInfo<void> {
  const SessionContainerRoute({List<PageRouteInfo>? children})
    : super(SessionContainerRoute.name, initialChildren: children);

  static const String name = 'SessionContainerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SessionContainerScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [UnauthenticatedContainerScreen]
class UnauthenticatedContainerRoute extends PageRouteInfo<void> {
  const UnauthenticatedContainerRoute({List<PageRouteInfo>? children})
    : super(UnauthenticatedContainerRoute.name, initialChildren: children);

  static const String name = 'UnauthenticatedContainerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnauthenticatedContainerScreen();
    },
  );
}
