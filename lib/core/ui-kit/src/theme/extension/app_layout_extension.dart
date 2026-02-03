import 'dart:ui';
import 'package:flutter/material.dart';

class AppLayoutExtension extends ThemeExtension<AppLayoutExtension> {
  final double s2;
  final double s4;
  final double s8;
  final double s12;
  final double s16;
  final double s24;
  final double s32;

  final double r4;
  final double r8;
  final double r12;
  final double r16;
  final double r100;

  AppLayoutExtension({
    required this.s2,
    required this.s4,
    required this.s8,
    required this.s12,
    required this.s16,
    required this.s24,
    required this.s32,
    required this.r4,
    required this.r8,
    required this.r12,
    required this.r16,
    required this.r100,
  });

  @override
  AppLayoutExtension copyWith({
    double? s2,
    double? s4,
    double? s8,
    double? s12,
    double? s16,
    double? s24,
    double? s32,
    double? r4,
    double? r8,
    double? r12,
    double? r16,
    double? r100,
  }) {
    return AppLayoutExtension(
      s2: s2 ?? this.s2,
      s4: s4 ?? this.s4,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s24: s24 ?? this.s24,
      s32: s32 ?? this.s32,
      r4: r4 ?? this.r4,
      r8: r8 ?? this.r8,
      r12: r12 ?? this.r12,
      r16: r16 ?? this.r16,
      r100: r100 ?? this.r100,
    );
  }

  @override
  AppLayoutExtension lerp(
    covariant ThemeExtension<AppLayoutExtension>? other,
    double t,
  ) {
    if (other is! AppLayoutExtension) return this;
    return AppLayoutExtension(
      s2: lerpDouble(s2, other.s2, t)!,
      s4: lerpDouble(s4, other.s4, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s16: lerpDouble(s16, other.s16, t)!,
      s24: lerpDouble(s24, other.s24, t)!,
      s32: lerpDouble(s32, other.s32, t)!,
      r4: lerpDouble(r4, other.r4, t)!,
      r8: lerpDouble(r8, other.r8, t)!,
      r12: lerpDouble(r12, other.r12, t)!,
      r16: lerpDouble(r16, other.r16, t)!,
      r100: lerpDouble(r100, other.r100, t)!,
    );
  }

  static AppLayoutExtension? of(BuildContext context) =>
      Theme.of(context).extension<AppLayoutExtension>();
}
