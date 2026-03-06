import 'package:demo_project/core/l10n/generated/app_localizations.dart';
import 'package:demo_project/core/ui_kit/src/theme/app_theme_data.dart';
import 'package:demo_project/core/ui_kit/src/theme/enums/theme_data_type.dart';
import 'package:demo_project/features/login/src/presentation/widgets/email_field.dart';
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

  Future<void> pumpEmailField(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppThemeData().getTheme(ThemeDataType.light),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Scaffold(
          body: Form(
            autovalidateMode: AutovalidateMode.always,
            child: EmailField(controller: controller),
          ),
        ),
      ),
    );
  }

  group('EmailField', () {
    testWidgets('shows empty error when submitted empty', (tester) async {
      await pumpEmailField(tester);
      await tester.pump();

      expect(find.text(l10n.loginEmailEmpty), findsOneWidget);
    });

    testWidgets('shows invalid error for email without @', (tester) async {
      await pumpEmailField(tester);

      await tester.enterText(find.byType(TextFormField), 'userexample.com');
      await tester.pump();

      expect(find.text(l10n.loginEmailInvalid), findsOneWidget);
    });

    testWidgets('shows invalid error for email without domain', (tester) async {
      await pumpEmailField(tester);

      await tester.enterText(find.byType(TextFormField), 'user@');
      await tester.pump();

      expect(find.text(l10n.loginEmailInvalid), findsOneWidget);
    });

    testWidgets('passes validation for valid email', (tester) async {
      await pumpEmailField(tester);

      await tester.enterText(find.byType(TextFormField), 'user@example.com');
      await tester.pump();

      final formState = tester.state<FormState>(find.byType(Form));
      expect(formState.validate(), true);
    });

    testWidgets('converts input to lowercase', (tester) async {
      await pumpEmailField(tester);

      await tester.enterText(find.byType(TextFormField), 'User@Example.COM');
      await tester.pump();

      expect(controller.text, 'user@example.com');
    });
  });
}
