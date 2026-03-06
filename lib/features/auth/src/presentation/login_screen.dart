import 'package:auto_route/auto_route.dart';
import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:demo_project/features/auth/src/presentation/cubit/login_cubit.dart';
import 'package:demo_project/features/auth/src/presentation/widgets/email_field.dart';
import 'package:demo_project/features/auth/src/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// Экран авторизации с формой email/пароль.
@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  final void Function(String, String) onSuccess;

  const LoginScreen({required this.onSuccess, super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => GetIt.I<LoginCubit>(), child: this);
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
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
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                widget.onSuccess(state.accessToken, state.refreshToken);
              } else if (state is LoginErrorState) {
                AppSnackBar.error(context, message: state.message ?? l10n.commonError);
              }
            },
            builder: (context, state) {
              final isLoading = state is LoginLoadingState;

              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: layout.s16),
                  child: Form(
                    key: _formKey,
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(l10n.authLoginTitle, style: textStyles.h1),
                          SizedBox(height: layout.s8),
                          Text(
                            l10n.authLoginSubtitle,
                            style: textStyles.bodyM.copyWith(color: colors.textSecondary),
                          ),
                          SizedBox(height: layout.s32),
                          EmailField(
                            controller: _emailController,
                            enabled: !isLoading,
                            onSubmitted: (_) => _passwordFocusNode.requestFocus(),
                          ),
                          SizedBox(height: layout.s16),
                          PasswordField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            enabled: !isLoading,
                            onSubmitted: (_) => _submit(),
                          ),
                          SizedBox(height: layout.s24),
                          AppButton.primary(
                            title: l10n.authLoginButton,
                            onTap: _submit,
                            expanded: true,
                            loading: isLoading,
                            enabled: !isLoading,
                          ),
                          SizedBox(height: layout.s16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.authNoAccount,
                                style: textStyles.bodyM.copyWith(color: colors.textSecondary),
                              ),
                              TextButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        //TODO(auth): navigate to registration screen
                                      },
                                child: Text(
                                  l10n.authSignUp,
                                  style: textStyles.labelL.copyWith(color: colors.primary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
    if (_formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }
}
