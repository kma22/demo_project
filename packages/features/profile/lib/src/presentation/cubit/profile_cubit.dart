import 'package:api_client/api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

import 'package:profile/src/domain/repository/base_profile_repository.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  // ignore: unused_field
  final BaseProfileRepository _repository;
  final AppLogger _logger;

  ProfileCubit(this._repository, this._logger) : super(const ProfileInitialState());

  Future<void> init() async {
    emit(const ProfileLoadingState());

    try {
      // TODO: implement
      emit(const ProfileSuccessState());
    } on ApiException catch (e) {
      _logger.error(runtimeType: runtimeType, operation: 'init', msg: e.errorMessage);
      emit(ProfileErrorState(message: e.errorMessage));
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'init', exc: e, st: st);
      emit(const ProfileErrorState());
    }
  }
}
