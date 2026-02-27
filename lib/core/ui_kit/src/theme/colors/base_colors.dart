import 'package:flutter/material.dart';

abstract class BaseColors {
  // --- Core Semantic Tokens ---
  Color get background;
  Color get surface;
  Color get surfaceVariant;
  Color get surfaceElevated;
  Color get onBackground;
  Color get onSurface;
  Color get primary;
  Color get onPrimary;
  Color get primaryLight;
  Color get divider;
  Color get border;
  Color get overlay;

  // --- Constant Colors ---
  Color get staticWhite;
  Color get staticBlack;

  // --- Content Tokens ---
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get textDisabled;
  Color get textInverted;
  Color get iconPrimary;
  Color get iconSecondary;

  // --- Interactive State Tokens ---
  Color get disabled;

  // --- Status Tokens ---
  Color get success;
  Color get error;
  Color get warning;
  Color get info;

  // --- Primitive Palette (Tailwind Slate) ---
  Color get gray100;
  Color get gray200;
  Color get gray300;
  Color get gray400;
  Color get gray500;
  Color get gray600;
  Color get gray700;
  Color get gray800;
  Color get gray900;

  // --- Shimmer ---
  Color get shimmerBase;
  Color get shimmerHighlight;

  // --- Brand Variants ---
  Color get primaryVariant;
  Color get accentVariant;
}
