import 'package:demo_project/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool enabled;
  final ValueChanged<String>? onSubmitted;

  const PasswordField({
    required this.controller,
    this.focusNode,
    this.enabled = true,
    this.onSubmitted,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;
  static const _minLength = 6;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final layout = context.layout;

    return AppTextField(
      label: l10n.loginPasswordLabel,
      hintText: l10n.loginPasswordHint,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscure,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      enabled: widget.enabled,
      onSubmitted: widget.onSubmitted,
      suffixIcon: IconButton(
        key: const Key('password_visibility_toggle'),
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: colors.textTertiary,
          size: layout.s20,
        ),
      ),
      validator: (value) {
        final password = value ?? '';

        if (password.isEmpty) return l10n.loginPasswordEmpty;

        if (password.length < _minLength) return l10n.loginPasswordTooShort;

        return null;
      },
    );
  }
}
