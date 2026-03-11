import 'package:flutter/material.dart';

import 'base_colors.dart';

class AppLightColors extends BaseColors {
  // --- Core Semantic ---
  @override
  Color get background => const Color(0xFFF8FAFC); // Slate 50

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceVariant => const Color(0xFFF1F5F9); // Slate 100

  @override
  Color get surfaceElevated => const Color(0xFFFFFFFF);

  @override
  Color get onBackground => const Color(0xFF0F172A); // Slate 900

  @override
  Color get onSurface => const Color(0xFF0F172A); // Slate 900

  @override
  Color get primary => const Color(0xFF4F46E5); // Indigo 600

  @override
  Color get onPrimary => staticWhite;

  @override
  Color get primaryLight => const Color(0xFFEEF2FF); // Indigo 50

  @override
  Color get divider => const Color(0xFFE2E8F0); // Slate 200

  @override
  Color get border => const Color(0xFFCBD5E1); // Slate 300

  @override
  Color get overlay => const Color(0x66000000);

  // --- Constant Colors ---
  @override
  Color get staticWhite => const Color(0xFFFFFFFF);

  @override
  Color get staticBlack => const Color(0xFF000000);

  // --- Content ---
  @override
  Color get textPrimary => const Color(0xFF0F172A); // Slate 900

  @override
  Color get textSecondary => const Color(0xFF64748B); // Slate 500

  @override
  Color get textTertiary => const Color(0xFF94A3B8); // Slate 400

  @override
  Color get textDisabled => const Color(0xFFCBD5E1); // Slate 300

  @override
  Color get textInverted => const Color(0xFFF8FAFC); // Slate 50

  @override
  Color get iconPrimary => primary;

  @override
  Color get iconSecondary => const Color(0xFF94A3B8); // Slate 400

  // --- Interactive States ---
  @override
  Color get disabled => const Color(0xFFF1F5F9); // Slate 100

  // --- Status ---
  @override
  Color get success => const Color(0xFF10B981); // Emerald 500

  @override
  Color get error => const Color(0xFFEF4444); // Red 500

  @override
  Color get warning => const Color(0xFFF59E0B); // Amber 500

  @override
  Color get info => const Color(0xFF3B82F6); // Blue 500

  // --- Primitive Palette (Tailwind Slate) ---
  @override
  Color get gray100 => const Color(0xFFF8FAFC); // Slate 50

  @override
  Color get gray200 => const Color(0xFFF1F5F9); // Slate 100

  @override
  Color get gray300 => const Color(0xFFE2E8F0); // Slate 200

  @override
  Color get gray400 => const Color(0xFFCBD5E1); // Slate 300

  @override
  Color get gray500 => const Color(0xFF94A3B8); // Slate 400

  @override
  Color get gray600 => const Color(0xFF64748B); // Slate 500

  @override
  Color get gray700 => const Color(0xFF475569); // Slate 600

  @override
  Color get gray800 => const Color(0xFF1E293B); // Slate 800

  @override
  Color get gray900 => const Color(0xFF0F172A); // Slate 900

  // --- Shimmer ---
  @override
  Color get shimmerBase => const Color(0xFFCBD5E1); // Slate 300

  @override
  Color get shimmerHighlight => const Color(0xFFF8FAFC); // Slate 50

  // --- Brand Variants ---
  @override
  Color get primaryVariant => const Color(0xFF6366F1); // Indigo 500

  @override
  Color get accentVariant => const Color(0xFF06B6D4); // Cyan 500
}
