import 'package:flutter/material.dart';
import 'package:ui_kit/src/assets_gen/assets.gen.dart';

import 'app_body_state_impl.dart';

/// Стандартные состояния контента экрана UI Kit.
///
/// ```dart
/// AppBodyState.empty(message: 'Нет осмотров')
/// AppBodyState.error(message: 'Ошибка загрузки', onRetry: () => bloc.add(Reload()))
/// AppBodyState.emptySearch(message: 'Ничего не найдено')
/// ```
class AppBodyState {
  const AppBodyState._();

  static final _bodyStates = Assets.images.bodyStates;

  static Widget empty({
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Key? key,
  }) {
    return AppBodyStateImpl(
      key: key,
      image: _bodyStates.emptyBody,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static Widget error({
    required String message,
    required String retryLabel,
    required VoidCallback onRetry,
    Key? key,
  }) {
    return AppBodyStateImpl(
      key: key,
      image: _bodyStates.errorBody,
      message: message,
      actionLabel: retryLabel,
      onAction: onRetry,
    );
  }

  static Widget emptySearch({required String message, Key? key}) {
    return AppBodyStateImpl(key: key, image: _bodyStates.emptySearchBody, message: message);
  }
}
