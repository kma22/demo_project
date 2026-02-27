import 'package:flutter/material.dart';

class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  final TextStyle display;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle bodyL;
  final TextStyle bodyM;
  final TextStyle bodyS;
  final TextStyle labelL;
  final TextStyle labelM;
  final TextStyle labelS;

  AppTextStyleExtension({
    required this.display,
    required this.h1,
    required this.h2,
    required this.h3,
    required this.bodyL,
    required this.bodyM,
    required this.bodyS,
    required this.labelL,
    required this.labelM,
    required this.labelS,
  });

  @override
  AppTextStyleExtension copyWith({
    TextStyle? display,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? bodyL,
    TextStyle? bodyM,
    TextStyle? bodyS,
    TextStyle? labelL,
    TextStyle? labelM,
    TextStyle? labelS,
  }) {
    return AppTextStyleExtension(
      display: display ?? this.display,
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      bodyL: bodyL ?? this.bodyL,
      bodyM: bodyM ?? this.bodyM,
      bodyS: bodyS ?? this.bodyS,
      labelL: labelL ?? this.labelL,
      labelM: labelM ?? this.labelM,
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
      h3: TextStyle.lerp(h3, other.h3, t)!,
      bodyL: TextStyle.lerp(bodyL, other.bodyL, t)!,
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t)!,
      bodyS: TextStyle.lerp(bodyS, other.bodyS, t)!,
      labelL: TextStyle.lerp(labelL, other.labelL, t)!,
      labelM: TextStyle.lerp(labelM, other.labelM, t)!,
      labelS: TextStyle.lerp(labelS, other.labelS, t)!,
    );
  }

  static AppTextStyleExtension? of(BuildContext context) =>
      Theme.of(context).extension<AppTextStyleExtension>();
}
