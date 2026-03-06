import 'dart:async';

import 'package:injectable/injectable.dart';

/// Наблюдатель за состоянием сессии.
/// Позволяет подписываться на события истечения авторизации для выполнения редиректа.
/// Подробнее: [API_CLIENT_ARCHITECTURE.md](demo_project/docs/API_CLIENT_ARCHITECTURE.md)
@lazySingleton
class SessionObserver {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get onSessionExpired => _controller.stream;

  void emitSessionExpired() {
    if (!_controller.isClosed) _controller.add(null);
  }

  @disposeMethod
  void dispose() => _controller.close();
}
