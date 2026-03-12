import 'package:flutter_test/flutter_test.dart';
import 'package:registration/src/domain/entity/registration_field.dart';
import 'package:registration/src/domain/entity/registration_validation_error.dart';
import 'package:registration/src/domain/use_case/validate_registration_use_case.dart';

void main() {
  late ValidateRegistrationUseCase useCase;

  setUp(() {
    useCase = ValidateRegistrationUseCase();
  });

  group('ValidateRegistrationUseCase', () {
    const validEmail = 'user@test.com';
    const validPassword = 'Password1';
    const validConfirm = 'Password1';

    test('returns empty map for valid input', () {
      final errors = useCase(
        email: validEmail,
        password: validPassword,
        confirmPassword: validConfirm,
      );

      expect(errors, isEmpty);
    });

    group('email validation', () {
      test('empty email returns empty error', () {
        final errors = useCase(email: '', password: validPassword, confirmPassword: validConfirm);

        expect(errors[RegistrationField.email], RegistrationValidationError.empty);
      });

      test('invalid email returns invalidEmail error', () {
        final errors = useCase(
          email: 'not-an-email',
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors[RegistrationField.email], RegistrationValidationError.invalidEmail);
      });

      test('email without domain returns invalidEmail error', () {
        final errors = useCase(
          email: 'user@',
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors[RegistrationField.email], RegistrationValidationError.invalidEmail);
      });

      test('valid email passes', () {
        final errors = useCase(
          email: validEmail,
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors.containsKey(RegistrationField.email), isFalse);
      });

      test('trims email before validation', () {
        final errors = useCase(
          email: '  $validEmail  ',
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors.containsKey(RegistrationField.email), isFalse);
      });
    });

    group('password validation', () {
      test('empty password returns empty error', () {
        final errors = useCase(email: validEmail, password: '', confirmPassword: '');

        expect(errors[RegistrationField.password], RegistrationValidationError.empty);
      });

      test('password shorter than 6 chars returns passwordTooShort', () {
        final errors = useCase(email: validEmail, password: 'Ab1', confirmPassword: 'Ab1');

        expect(errors[RegistrationField.password], RegistrationValidationError.passwordTooShort);
      });

      test('password without uppercase returns passwordNoUppercase', () {
        final errors = useCase(
          email: validEmail,
          password: 'password1',
          confirmPassword: 'password1',
        );

        expect(errors[RegistrationField.password], RegistrationValidationError.passwordNoUppercase);
      });

      test('password without lowercase returns passwordNoLowercase', () {
        final errors = useCase(
          email: validEmail,
          password: 'PASSWORD1',
          confirmPassword: 'PASSWORD1',
        );

        expect(errors[RegistrationField.password], RegistrationValidationError.passwordNoLowercase);
      });

      test('password without digit returns passwordNoDigit', () {
        final errors = useCase(
          email: validEmail,
          password: 'Password',
          confirmPassword: 'Password',
        );

        expect(errors[RegistrationField.password], RegistrationValidationError.passwordNoDigit);
      });

      test('valid password passes', () {
        final errors = useCase(
          email: validEmail,
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors.containsKey(RegistrationField.password), isFalse);
      });
    });

    group('confirm password validation', () {
      test('empty confirmPassword returns empty error', () {
        final errors = useCase(email: validEmail, password: validPassword, confirmPassword: '');

        expect(errors[RegistrationField.confirmPassword], RegistrationValidationError.empty);
      });

      test('mismatched passwords returns passwordsDoNotMatch', () {
        final errors = useCase(
          email: validEmail,
          password: validPassword,
          confirmPassword: 'Different1',
        );

        expect(
          errors[RegistrationField.confirmPassword],
          RegistrationValidationError.passwordsDoNotMatch,
        );
      });

      test('matching passwords pass', () {
        final errors = useCase(
          email: validEmail,
          password: validPassword,
          confirmPassword: validConfirm,
        );

        expect(errors.containsKey(RegistrationField.confirmPassword), isFalse);
      });
    });

    group('multiple errors', () {
      test('returns errors for all invalid fields', () {
        final errors = useCase(email: '', password: '', confirmPassword: '');

        expect(errors.length, 3);
        expect(errors[RegistrationField.email], RegistrationValidationError.empty);
        expect(errors[RegistrationField.password], RegistrationValidationError.empty);
        expect(errors[RegistrationField.confirmPassword], RegistrationValidationError.empty);
      });

      test('validates each field independently', () {
        final errors = useCase(email: 'bad-email', password: 'short', confirmPassword: 'mismatch');

        expect(errors[RegistrationField.email], RegistrationValidationError.invalidEmail);
        expect(errors[RegistrationField.password], RegistrationValidationError.passwordTooShort);
        expect(
          errors[RegistrationField.confirmPassword],
          RegistrationValidationError.passwordsDoNotMatch,
        );
      });
    });

    group('validation priority', () {
      test(
        'password checks run in order: empty > tooShort > noUppercase > noLowercase > noDigit',
        () {
          // Too short takes priority over missing uppercase
          var errors = useCase(email: validEmail, password: 'ab1', confirmPassword: 'ab1');
          expect(errors[RegistrationField.password], RegistrationValidationError.passwordTooShort);

          // No uppercase takes priority over no lowercase
          errors = useCase(email: validEmail, password: 'abcdef1', confirmPassword: 'abcdef1');
          expect(
            errors[RegistrationField.password],
            RegistrationValidationError.passwordNoUppercase,
          );

          // No lowercase
          errors = useCase(email: validEmail, password: 'ABCDEF1', confirmPassword: 'ABCDEF1');
          expect(
            errors[RegistrationField.password],
            RegistrationValidationError.passwordNoLowercase,
          );

          // No digit
          errors = useCase(email: validEmail, password: 'Abcdefg', confirmPassword: 'Abcdefg');
          expect(errors[RegistrationField.password], RegistrationValidationError.passwordNoDigit);
        },
      );
    });
  });
}
