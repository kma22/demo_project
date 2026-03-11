import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_field.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_validation_error.dart';
import 'package:demo_project/features/registration/src/presentation/cubit/registration_cubit.dart';
import 'package:demo_project/features/registration/src/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:routing/routing.dart';
import 'package:ui_kit/ui_kit.dart';

/// Экран регистрации с валидацией в domain-слое.
@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  final void Function({required String accessToken, required String refreshToken}) onSuccess;

  const RegistrationScreen({required this.onSuccess, super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => GetIt.I<RegistrationCubit>(), child: this);
  }

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  static final _emailInputFilter = FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@._-]'));

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colors.background,
        appBar: AppBar(
          backgroundColor: colors.background,
          foregroundColor: colors.textPrimary,
          elevation: 0,
        ),
        body: SafeArea(
          child: BlocConsumer<RegistrationCubit, RegistrationState>(
            listener: (context, state) {
              if (state is RegistrationSuccessState) {
                widget.onSuccess(accessToken: state.accessToken, refreshToken: state.refreshToken);
              } else if (state is RegistrationErrorState) {
                AppSnackBar.error(context, message: state.message ?? l10n.commonError);
              }
            },
            builder: (context, state) {
              final isLoading = state is RegistrationLoadingState;

              return Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: layout.s16),
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(l10n.registrationTitle, style: textStyles.h1),
                        SizedBox(height: layout.s8),
                        Text(
                          l10n.registrationSubtitle,
                          style: textStyles.bodyM.copyWith(color: colors.textSecondary),
                        ),
                        SizedBox(height: layout.s32),
                        AppTextField(
                          label: l10n.registrationEmailLabel,
                          hintText: l10n.registrationEmailHint,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.email],
                          enabled: !isLoading,
                          errorText: _resolveError(
                            l10n,
                            state.fieldErrors,
                            RegistrationField.email,
                          ),
                          onChanged: _onFieldChanged,
                          inputFormatters: [LowerCaseTextFormatter(), _emailInputFilter],
                          onSubmitted: (_) => _passwordFocusNode.requestFocus(),
                        ),
                        SizedBox(height: layout.s16),
                        PasswordField(
                          label: l10n.registrationPasswordLabel,
                          hintText: l10n.registrationPasswordHint,
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.next,
                          enabled: !isLoading,
                          errorText: _resolveError(
                            l10n,
                            state.fieldErrors,
                            RegistrationField.password,
                          ),
                          onChanged: _onFieldChanged,
                          onSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
                        ),
                        SizedBox(height: layout.s16),
                        PasswordField(
                          label: l10n.registrationConfirmPasswordLabel,
                          hintText: l10n.registrationConfirmPasswordHint,
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          enabled: !isLoading,
                          errorText: _resolveError(
                            l10n,
                            state.fieldErrors,
                            RegistrationField.confirmPassword,
                          ),
                          onChanged: _onFieldChanged,
                          onSubmitted: (_) => _submit(),
                        ),
                        SizedBox(height: layout.s24),
                        AppButton.primary(
                          title: l10n.registrationButton,
                          onTap: _submit,
                          expanded: true,
                          loading: isLoading,
                        ),
                        SizedBox(height: layout.s16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.registrationHaveAccount,
                              style: textStyles.bodyM.copyWith(color: colors.textSecondary),
                            ),
                            TextButton(
                              onPressed: isLoading ? null : () => context.router.maybePop(),
                              child: Text(
                                l10n.registrationSignIn,
                                style: textStyles.labelL.copyWith(color: colors.primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<RegistrationCubit>().register(
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
  }

  void _onFieldChanged(String _) {
    context.read<RegistrationCubit>().validateFields(
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
  }

  String? _resolveError(
    AppLocalizations l10n,
    Map<RegistrationField, RegistrationValidationError> errors,
    RegistrationField field,
  ) {
    final error = errors[field];
    if (error == null) return null;

    return switch (error) {
      RegistrationValidationError.empty => switch (field) {
        RegistrationField.email => l10n.registrationEmailEmpty,
        RegistrationField.password => l10n.registrationPasswordEmpty,
        RegistrationField.confirmPassword => l10n.registrationConfirmPasswordEmpty,
      },
      RegistrationValidationError.invalidEmail => l10n.registrationEmailInvalid,
      RegistrationValidationError.passwordTooShort => l10n.registrationPasswordTooShort,
      RegistrationValidationError.passwordNoUppercase => l10n.registrationPasswordNoUppercase,
      RegistrationValidationError.passwordNoLowercase => l10n.registrationPasswordNoLowercase,
      RegistrationValidationError.passwordNoDigit => l10n.registrationPasswordNoDigit,
      RegistrationValidationError.passwordsDoNotMatch => l10n.registrationPasswordsDoNotMatch,
    };
  }
}
