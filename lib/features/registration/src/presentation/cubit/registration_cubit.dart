import 'package:demo_project/core/api_client/api_client.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_field.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_validation_error.dart';
import 'package:demo_project/features/registration/src/domain/use_case/register_use_case.dart';
import 'package:demo_project/features/registration/src/domain/use_case/validate_registration_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

part 'registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final ValidateRegistrationUseCase _validateUseCase;
  final RegisterUseCase _registerUseCase;
  final AppLogger _logger;

  bool _submitted = false;

  RegistrationCubit(this._validateUseCase, this._registerUseCase, this._logger)
    : super(const RegistrationFormState());

  void validateFields({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (!_submitted) return;

    final errors = _validateUseCase(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    emit(RegistrationFormState(fieldErrors: errors));
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    _submitted = true;

    final errors = _validateUseCase(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (errors.isNotEmpty) {
      emit(RegistrationFormState(fieldErrors: errors));
      return;
    }

    emit(const RegistrationLoadingState());

    try {
      final result = await _registerUseCase(email: email, password: password);

      emit(
        RegistrationSuccessState(
          accessToken: result.accessToken,
          refreshToken: result.refreshToken,
        ),
      );
    } on ApiException catch (e) {
      _logger.error(runtimeType: runtimeType, operation: 'register', msg: e.errorMessage);
      emit(RegistrationErrorState(message: e.errorMessage));
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'register', exc: e, st: st);
      emit(const RegistrationErrorState());
    }
  }
}
