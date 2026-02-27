import 'dart:ui';
import 'package:flutter/material.dart';

class AppLayoutExtension extends ThemeExtension<AppLayoutExtension> {
  // ===== Spacing (padding / margin / gaps)
  final double s2;
  final double s4;
  final double s6;
  final double s8;
  final double s12;
  final double s16;
  final double s20;
  final double s24;
  final double s32;
  final double s40;
  final double s48;
  final double s64;

  // ===== Radius (border radius)
  final double r4;
  final double r6;
  final double r8;
  final double r12;
  final double r16;
  final double r24;
  final double r32;
  final double r64;

  /// Circle / pill / avatar
  final double r100;

  const AppLayoutExtension({
    required this.s2,
    required this.s4,
    required this.s6,
    required this.s8,
    required this.s12,
    required this.s16,
    required this.s20,
    required this.s24,
    required this.s32,
    required this.s40,
    required this.s48,
    required this.s64,
    required this.r4,
    required this.r6,
    required this.r8,
    required this.r12,
    required this.r16,
    required this.r24,
    required this.r32,
    required this.r64,
    required this.r100,
  });

  @override
  AppLayoutExtension copyWith({
    double? s2,
    double? s4,
    double? s6,
    double? s8,
    double? s12,
    double? s16,
    double? s20,
    double? s24,
    double? s32,
    double? s40,
    double? s48,
    double? s64,
    double? r4,
    double? r6,
    double? r8,
    double? r12,
    double? r16,
    double? r24,
    double? r32,
    double? r64,
    double? r100,
  }) {
    return AppLayoutExtension(
      s2: s2 ?? this.s2,
      s4: s4 ?? this.s4,
      s6: s6 ?? this.s6,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s20: s20 ?? this.s20,
      s24: s24 ?? this.s24,
      s32: s32 ?? this.s32,
      s40: s40 ?? this.s40,
      s48: s48 ?? this.s48,
      s64: s64 ?? this.s64,
      r4: r4 ?? this.r4,
      r6: r6 ?? this.r6,
      r8: r8 ?? this.r8,
      r12: r12 ?? this.r12,
      r16: r16 ?? this.r16,
      r24: r24 ?? this.r24,
      r32: r32 ?? this.r32,
      r64: r64 ?? this.r64,
      r100: r100 ?? this.r100,
    );
  }

  @override
  AppLayoutExtension lerp(covariant ThemeExtension<AppLayoutExtension>? other, double t) {
    if (other is! AppLayoutExtension) return this;

    return AppLayoutExtension(
      s2: lerpDouble(s2, other.s2, t)!,
      s4: lerpDouble(s4, other.s4, t)!,
      s6: lerpDouble(s6, other.s6, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s16: lerpDouble(s16, other.s16, t)!,
      s20: lerpDouble(s20, other.s20, t)!,
      s24: lerpDouble(s24, other.s24, t)!,
      s32: lerpDouble(s32, other.s32, t)!,
      s40: lerpDouble(s40, other.s40, t)!,
      s48: lerpDouble(s48, other.s48, t)!,
      s64: lerpDouble(s64, other.s64, t)!,
      r4: lerpDouble(r4, other.r4, t)!,
      r6: lerpDouble(r6, other.r6, t)!,
      r8: lerpDouble(r8, other.r8, t)!,
      r12: lerpDouble(r12, other.r12, t)!,
      r16: lerpDouble(r16, other.r16, t)!,
      r24: lerpDouble(r24, other.r24, t)!,
      r32: lerpDouble(r32, other.r32, t)!,
      r64: lerpDouble(r64, other.r64, t)!,
      r100: lerpDouble(r100, other.r100, t)!,
    );
  }

  static AppLayoutExtension? of(BuildContext context) =>
      Theme.of(context).extension<AppLayoutExtension>();
}
