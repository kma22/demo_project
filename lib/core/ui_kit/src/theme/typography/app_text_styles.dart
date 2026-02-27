import 'package:demo_project/core/ui_kit/src/theme/typography/base_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles extends BaseTextStyles {
  @override
  TextStyle get display => GoogleFonts.inter(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get h1 => GoogleFonts.inter(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w700,
      );

  @override
  TextStyle get h2 => GoogleFonts.inter(
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get h3 => GoogleFonts.inter(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get bodyL => GoogleFonts.inter(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get bodyM => GoogleFonts.inter(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get bodyS => GoogleFonts.inter(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      );

  @override
  TextStyle get labelL => GoogleFonts.inter(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get labelM => GoogleFonts.inter(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get labelS => GoogleFonts.inter(
        fontSize: 10,
        height: 12 / 10,
        fontWeight: FontWeight.w700,
      );
}
