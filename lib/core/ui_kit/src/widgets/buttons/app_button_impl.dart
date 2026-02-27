import 'package:demo_project/core/ui_kit/src/theme/extension/app_layout_extension.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/enums/app_button_type.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/model/app_button_style.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/model/app_button_style_factory.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AppButtonImpl extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool enabled;
  final bool loading;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AppButtonSize size;
  final AppButtonType type;
  final bool expanded;

  const AppButtonImpl({
    required this.title,
    required this.type,
    this.onTap,
    this.enabled = true,
    this.loading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.size = AppButtonSize.medium,
    this.expanded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final style = AppButtonStyleFactory.resolve(type, enabled, colors);
    final borderRadius = BorderRadius.circular(layout.r100);
    final border = style.border;

    return Semantics(
      button: true,
      enabled: enabled,
      child: Material(
        color: style.background,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: enabled && !loading ? onTap : null,
          borderRadius: borderRadius,
          overlayColor: WidgetStateProperty.all(style.overlay),
          child: Container(
            height: _height(layout),
            padding: EdgeInsets.symmetric(horizontal: layout.s24),
            decoration: border != null
                ? BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(color: border),
                  )
                : null,
            child: loading
                ? _ButtonLoader(style: style, expanded: expanded)
                : _ButtonContent(
                    title: title,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    style: style,
                    expanded: expanded,
                  ),
          ),
        ),
      ),
    );
  }

  double _height(AppLayoutExtension layout) => switch (size) {
    AppButtonSize.small => layout.s40,
    AppButtonSize.medium => layout.s48,
    AppButtonSize.large => layout.s64,
  };
}

class _ButtonLoader extends StatelessWidget {
  final AppButtonStyle style;
  final bool expanded;

  const _ButtonLoader({required this.style, required this.expanded});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: layout.s20,
          height: layout.s20,
          child: CircularProgressIndicator(
            strokeWidth: layout.s2,
            color: style.foreground,
          ),
        ),
      ],
    );
  }
}

class _ButtonContent extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AppButtonStyle style;
  final bool expanded;

  const _ButtonContent({
    required this.title,
    required this.style,
    required this.expanded,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final textStyles = context.textStyles;

    final prefixIcon = this.prefixIcon;
    final suffixIcon = this.suffixIcon;

    return Row(
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ?prefixIcon,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s8),
          child: Text(
            title,
            style: textStyles.bodyM.copyWith(color: style.foreground, fontWeight: FontWeight.w600),
          ),
        ),
        ?suffixIcon,
      ],
    );
  }
}
