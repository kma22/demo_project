import 'package:demo_project/core/l10n/generated/app_localizations.dart';
import 'package:demo_project/core/ui_kit/src/theme/app_theme_data.dart';
import 'package:demo_project/core/ui_kit/src/theme/enums/theme_data_type.dart';
import 'package:demo_project/features/login/src/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TextEditingController controller;
  late AppLocalizations l10n;

  setUp(() async {
    controller = TextEditingController();
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  tearDown(() {
    controller.dispose();
  });

  Future<void> pumpPasswordField(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppThemeData().getTheme(ThemeDataType.light),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Scaffold(
          body: Form(
            autovalidateMode: AutovalidateMode.always,
            child: PasswordField(controller: controller),
          ),
        ),
      ),
    );
  }

  group('PasswordField', () {
    testWidgets('shows empty error when submitted empty', (tester) async {
      await pumpPasswordField(tester);
      await tester.pump();

      expect(find.text(l10n.loginPasswordEmpty), findsOneWidget);
    });

    testWidgets('shows too short error for less than 6 characters', (tester) async {
      await pumpPasswordField(tester);

      await tester.enterText(find.byType(TextFormField), '12345');
      await tester.pump();

      expect(find.text(l10n.loginPasswordTooShort), findsOneWidget);
    });

    testWidgets('passes validation for 6+ characters', (tester) async {
      await pumpPasswordField(tester);

      await tester.enterText(find.byType(TextFormField), '123456');
      await tester.pump();

      final formState = tester.state<FormState>(find.byType(Form));
      expect(formState.validate(), true);
    });

    testWidgets('toggles password visibility', (tester) async {
      await pumpPasswordField(tester);

      final toggleButton = find.byKey(const Key('password_visibility_toggle'));

      // Initially obscured
      final field = tester.widget<EditableText>(find.byType(EditableText));
      expect(field.obscureText, isTrue);

      // Tap visibility toggle
      await tester.tap(toggleButton);
      await tester.pump();

      // Now visible
      final fieldAfter = tester.widget<EditableText>(find.byType(EditableText));
      expect(fieldAfter.obscureText, isFalse);
    });
  });
}
