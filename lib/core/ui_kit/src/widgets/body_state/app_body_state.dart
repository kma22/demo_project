import 'package:demo_project/core/gen/assets.gen.dart';
import 'package:demo_project/core/ui_kit/src/widgets/body_state/app_body_state_impl.dart';
import 'package:flutter/material.dart';

/// Стандартные состояния контента экрана UI Kit.
///
/// ```dart
/// AppBodyState.empty(message: 'Нет осмотров')
/// AppBodyState.error(message: 'Ошибка загрузки', onRetry: () => bloc.add(Reload()))
/// AppBodyState.emptySearch(message: 'Ничего не найдено')
/// ```
class AppBodyState {
  const AppBodyState._();

  static final _bodyStates = Assets.uiKit.images.bodyStates;

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
    required VoidCallback onRetry,
    String retryLabel = 'Повторить',
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
