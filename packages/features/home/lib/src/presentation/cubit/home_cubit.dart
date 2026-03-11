import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

import 'package:home/src/domain/repository/base_home_repository.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  // ignore: unused_field
  final BaseHomeRepository _repository;
  final AppLogger _logger;

  HomeCubit(this._repository, this._logger) : super(const HomeInitialState());

  Future<void> init() async {
    emit(const HomeLoadingState());

    try {
      // TODO: implement
      emit(const HomeSuccessState());
    } on ApiException catch (e) {
      _logger.error(runtimeType: runtimeType, operation: 'init', msg: e.errorMessage);
      emit(HomeErrorState(message: e.errorMessage));
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'init', exc: e, st: st);
      emit(const HomeErrorState());
    }
  }
}
