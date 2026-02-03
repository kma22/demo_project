import 'package:flutter/material.dart';

class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  final TextStyle display;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle bodyL;
  final TextStyle bodyM;
  final TextStyle bodyS;
  final TextStyle labelS;

  AppTextStyleExtension({
    required this.display,
    required this.h1,
    required this.h2,
    required this.bodyL,
    required this.bodyM,
    required this.bodyS,
    required this.labelS,
  });

  @override
  AppTextStyleExtension copyWith({
    TextStyle? display,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? bodyL,
    TextStyle? bodyM,
    TextStyle? bodyS,
    TextStyle? labelS,
  }) {
    return AppTextStyleExtension(
      display: display ?? this.display,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      bodyL: bodyL ?? this.bodyL,
      bodyM: bodyM ?? this.bodyM,
      bodyS: bodyS ?? this.bodyS,
      labelS: labelS ?? this.labelS,
    );
  }

  @override
  AppTextStyleExtension lerp(
    covariant ThemeExtension<AppTextStyleExtension>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtension) return this;
    return AppTextStyleExtension(
      display: TextStyle.lerp(display, other.display, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      bodyL: TextStyle.lerp(bodyL, other.bodyL, t)!,
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t)!,
      bodyS: TextStyle.lerp(bodyS, other.bodyS, t)!,
      labelS: TextStyle.lerp(labelS, other.labelS, t)!,
    );
  }

  static AppTextStyleExtension? of(BuildContext context) =>
      Theme.of(context).extension<AppTextStyleExtension>();
}
