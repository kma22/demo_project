import 'package:demo_project/core/ui-kit/src/theme/colors/base_colors.dart';
import 'package:flutter/material.dart';

class AppLightColors extends BaseColors {
  @override
  Color get background => const Color(0xFFF8FAFC); // Slate 50

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get primary => const Color(0xFF4F46E5); // Indigo 600

  @override
  Color get onPrimary => staticWhite;

  @override
  Color get tapBarBg => const Color(0x66FFFFFF);

  @override
  Color get iconBg => const Color(0x29000000);

  @override
  Color get buttonBg => const Color(0x33FFFFFF);

  @override
  Color get segmentBg => const Color(0x0D000000);

  @override
  Color get popUpBg => const Color(0x66000000);

  @override
  Color get staticWhite => const Color(0xFFFFFFFF);

  @override
  Color get staticBlack => const Color(0xFF000000);

  @override
  Color get textPrimary => const Color(0xFF0F172A); // Slate 900

  @override
  Color get textSecondary => const Color(0xFF64748B); // Slate 500

  @override
  Color get textTertiary => const Color(0xFF94A3B8); // Slate 400

  @override
  Color get textInverted => const Color(0xFFF8FAFC); // Slate 50

  @override
  Color get iconPrimary => primary;

  @override
  Color get success => const Color(0xFF10B981); // Emerald 500

  @override
  Color get error => const Color(0xFFEF4444); // Red 500

  @override
  Color get warning => const Color(0xFFF59E0B); // Amber 500

  @override
  Color get gray100 => const Color(0xFFF8FAFC);
  @override
  Color get gray200 => const Color(0xFFF1F5F9);
  @override
  Color get gray300 => const Color(0xFFE2E8F0);
  @override
  Color get gray400 => const Color(0xFFCBD5E1);
  @override
  Color get gray500 => const Color(0xFF94A3B8);
  @override
  Color get gray600 => const Color(0xFF64748B);
  @override
  Color get gray700 => const Color(0xFF475569);
  @override
  Color get gray800 => const Color(0xFF334155);
  @override
  Color get gray900 => const Color(0xFF0F172A);

  @override
  Color get primaryVariant => const Color(0xFF6366F1); // Indigo 500
  @override
  Color get accentVariant => const Color(0xFF06B6D4); // Cyan 500
}
