import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/src/config/l10n/localization_extension.dart';
import 'package:ui_kit/ui_kit.dart';

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
      label: l10n.emailLabel,
      hintText: l10n.emailHint,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      enabled: enabled,
      onSubmitted: onSubmitted,
      inputFormatters: [LowerCaseTextFormatter(), _inputFilter],
      validator: (value) {
        final email = value?.trim() ?? '';

        if (email.isEmpty) return l10n.emailEmpty;

        if (!_emailRegex.hasMatch(email)) return l10n.emailInvalid;

        return null;
      },
    );
  }
}
