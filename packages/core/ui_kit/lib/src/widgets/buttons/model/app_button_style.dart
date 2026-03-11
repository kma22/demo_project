import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppButtonStyle extends Equatable {
  final Color background;
  final Color foreground;
  final Color? border;
  final Color overlay;

  const AppButtonStyle({
    required this.background,
    required this.foreground,
    required this.overlay,
    this.border,
  });

  @override
  List<Object?> get props => [background, foreground, border, overlay];
}
