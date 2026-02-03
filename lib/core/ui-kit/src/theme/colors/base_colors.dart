
import 'package:flutter/material.dart';

abstract class BaseColors {
  // --- Core Semantic Tokens ---
  Color get background;
  Color get surface;
  Color get primary;
  Color get onPrimary;

  // --- Secondary Semantic Tokens ---
  Color get tapBarBg;
  Color get iconBg;
  Color get buttonBg;
  Color get segmentBg;
  Color get popUpBg;
  
  // --- Constant Colors ---
  Color get staticWhite;
  Color get staticBlack;

  // --- Content Tokens ---
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;
  Color get textInverted;
  Color get iconPrimary;

  // --- Status Tokens ---
  Color get success;
  Color get error;
  Color get warning;

  // --- Minimal Primitive Palettes ---
  /// Grayscale
  Color get gray100;
  Color get gray200;
  Color get gray300;
  Color get gray400;
  Color get gray500;
  Color get gray600;
  Color get gray700;
  Color get gray800;
  Color get gray900;

  /// Brand/Accent variants (if needed for states)
  Color get primaryVariant;
  Color get accentVariant;
}
