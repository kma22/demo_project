import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final ValueChanged<String>? onSubmitted;

  const EmailField({required this.controller, this.enabled = true, this.onSubmitted, super.key});

  static final _emailRegex = RegExp(
    r'^[A-Za-zА-Яа-я\d._%+-]+@[A-Za-zА-Яа-я\d.-]+\.[A-Za-zА-Яа-я]{2,}$',
  );
  static final _inputFilter = FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@._-]'));

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppTextField(
      label: l10n.authEmailLabel,
      hintText: l10n.authEmailHint,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      enabled: enabled,
      onSubmitted: onSubmitted,
      inputFormatters: [LowerCaseTextFormatter(), _inputFilter],
      validator: (value) {
        final email = value?.trim() ?? '';

        if (email.isEmpty) return l10n.authEmailEmpty;

        if (!_emailRegex.hasMatch(email)) return l10n.authEmailInvalid;

        return null;
      },
    );
  }
}
