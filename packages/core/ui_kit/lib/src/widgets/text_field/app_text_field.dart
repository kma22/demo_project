import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

/// Поле ввода UI Kit.
///
/// Стилизация border, fill, hint — из [InputDecorationTheme] в [AppThemeData].
/// Виджет добавляет label над полем и прокидывает стандартные параметры.
///
/// ```dart
/// AppTextField(
///   label: 'Email',
///   hintText: 'example@mail.com',
///   controller: _controller,
///   validator: (v) => v?.isEmpty == true ? 'Обязательное поле' : null,
///   keyboardType: TextInputType.emailAddress,
/// )
/// ```
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  const AppTextField({
    this.label,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.suffixIcon,
    this.prefixIcon,
    this.autofillHints,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final label = this.label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label, style: textStyles.labelM.copyWith(color: colors.textSecondary)),
          SizedBox(height: layout.s8),
        ],
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus,
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          obscureText: obscureText,
          autofillHints: autofillHints,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          onFieldSubmitted: onSubmitted,
          style: textStyles.bodyM.copyWith(
            color: enabled ? colors.textPrimary : colors.textDisabled,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
