import 'package:demo_project/core/ui_kit/src/theme/layout/base_layout.dart';

class AppLayout extends BaseLayout {
  // ===== Spacing (padding / margin / gaps)

  @override
  double get s2 => 2;

  @override
  double get s4 => 4;

  @override
  double get s6 => 6;

  @override
  double get s8 => 8;

  @override
  double get s12 => 12;

  @override
  double get s16 => 16;

  @override
  double get s20 => 20;

  @override
  double get s24 => 24;

  @override
  double get s32 => 32;

  @override
  double get s40 => 40;

  @override
  double get s48 => 48;

  @override
  double get s64 => 64;

  // ===== Radius (border radius)

  @override
  double get r4 => 4; // small elements, chips

  @override
  double get r6 => 6;

  @override
  double get r8 => 8; // buttons, inputs

  @override
  double get r12 => 12; // cards

  @override
  double get r16 => 16; // large cards / modals

  @override
  double get r24 => 24;

  @override
  double get r32 => 32;

  @override
  double get r64 => 64;

  @override
  double get r100 => 100; // circle / pill
}
