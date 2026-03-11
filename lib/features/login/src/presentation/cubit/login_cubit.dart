import 'package:api_client/api_client.dart';
import 'package:demo_project/features/login/src/domain/repository/base_login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final BaseLoginRepository _repository;
  final AppLogger _logger;

  LoginCubit(this._repository, this._logger) : super(const LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginLoadingState());

    try {
      final result = await _repository.login(email: email, password: password);

      emit(LoginSuccessState(accessToken: result.accessToken, refreshToken: result.refreshToken));
      _logger.info('Login success', runtimeType: runtimeType);
    } on ApiException catch (e) {
      _logger.error(runtimeType: runtimeType, operation: 'login', msg: e.errorMessage);
      emit(LoginErrorState(message: e.errorMessage));
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'login', exc: e, st: st);
      emit(const LoginErrorState());
    }
  }
}
