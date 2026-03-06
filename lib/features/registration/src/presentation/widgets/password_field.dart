import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool enabled;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;

  const PasswordField({
    required this.label,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.enabled = true,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction = TextInputAction.done,
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  static final _inputFilter = FilteringTextInputFormatter.allow(
    RegExp(r'[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?`~]'),
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppTextField(
      label: widget.label,
      hintText: widget.hintText,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscure,
      textInputAction: widget.textInputAction,
      autofillHints: const [AutofillHints.newPassword],
      enabled: widget.enabled,
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      inputFormatters: [_inputFilter],
      onSubmitted: widget.onSubmitted,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: colors.textTertiary,
          size: 20,
        ),
      ),
    );
  }
}
