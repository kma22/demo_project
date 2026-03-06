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
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required VoidCallback onLogout,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(onLogout: onLogout, key: key),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return HomeScreen(onLogout: args.onLogout, key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.onLogout, this.key});

  final VoidCallback onLogout;

  final Key? key;

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

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    required void Function({
      required String accessToken,
      required String refreshToken,
    })
    onSuccess,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return WrappedRoute(
        child: LoginScreen(onSuccess: args.onSuccess, key: args.key),
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

  final Key? key;

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
/// [TalkerLoggerScreen]
class TalkerLoggerRoute extends PageRouteInfo<void> {
  const TalkerLoggerRoute({List<PageRouteInfo>? children})
    : super(TalkerLoggerRoute.name, initialChildren: children);

  static const String name = 'TalkerLoggerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TalkerLoggerScreen();
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
