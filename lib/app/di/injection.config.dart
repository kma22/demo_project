// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_project/app/router/feature_navigation.dart' as _i614;
import 'package:demo_project/app/session/data/session_repository.dart' as _i209;
import 'package:demo_project/app/session/domain/base_session_repository.dart'
    as _i899;
import 'package:demo_project/app/session/presentation/cubit/session_cubit.dart'
    as _i184;
import 'package:demo_project/core/api_client/api_client.dart' as _i112;
import 'package:demo_project/core/api_client/src/api_client.dart' as _i799;
import 'package:demo_project/core/api_client/src/base_api_client.dart' as _i517;
import 'package:demo_project/core/api_client/src/di/dio_module.dart' as _i622;
import 'package:demo_project/core/api_client/src/session_observer.dart'
    as _i834;
import 'package:demo_project/core/routing/routing.dart' as _i1011;
import 'package:demo_project/features/login/src/data/api/base_login_api_service.dart'
    as _i173;
import 'package:demo_project/features/login/src/data/api/mock_login_api_service.dart'
    as _i40;
import 'package:demo_project/features/login/src/data/repository/login_repository.dart'
    as _i162;
import 'package:demo_project/features/login/src/domain/repository/base_login_repository.dart'
    as _i133;
import 'package:demo_project/features/login/src/presentation/cubit/login_cubit.dart'
    as _i267;
import 'package:demo_project/features/registration/src/data/api/base_registration_api_service.dart'
    as _i40;
import 'package:demo_project/features/registration/src/data/api/mock_registration_api_service.dart'
    as _i270;
import 'package:demo_project/features/registration/src/data/repository/registration_repository.dart'
    as _i500;
import 'package:demo_project/features/registration/src/domain/repository/base_registration_repository.dart'
    as _i824;
import 'package:demo_project/features/registration/src/domain/use_case/register_use_case.dart'
    as _i92;
import 'package:demo_project/features/registration/src/domain/use_case/validate_registration_use_case.dart'
    as _i696;
import 'package:demo_project/features/registration/src/presentation/cubit/registration_cubit.dart'
    as _i588;
import 'package:dio/dio.dart' as _i361;
import 'package:environment_data/environment_data.dart' as _i72;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/local_storage.dart' as _i486;
import 'package:logger_manager/logger_manager.dart' as _i127;
import 'package:ui_kit/ui_kit.dart' as _i66;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i72.EnvironmentDataPackageModule().init(gh);
    await _i127.LoggerManagerPackageModule().init(gh);
    await _i486.LocalStoragePackageModule().init(gh);
    await _i66.UiKitPackageModule().init(gh);
    final dioModule = _$DioModule();
    gh.factory<_i696.ValidateRegistrationUseCase>(
      () => _i696.ValidateRegistrationUseCase(),
    );
    gh.lazySingleton<_i834.SessionObserver>(
      () => _i834.SessionObserver(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i1011.BaseFeatureNavigation>(
      () => _i614.FeatureNavigation(),
    );
    gh.factory<_i40.BaseRegistrationApiService>(
      () => _i270.MockRegistrationApiService(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i486.BaseTokenStorage>(),
        gh<_i127.AppLogger>(),
        gh<_i72.EnvironmentData>(),
        gh<_i834.SessionObserver>(),
      ),
    );
    gh.factory<_i173.BaseLoginApiService>(() => _i40.MockLoginApiService());
    gh.lazySingleton<_i899.BaseSessionRepository>(
      () => _i209.SessionRepository(
        gh<_i486.BaseTokenStorage>(),
        gh<_i112.SessionObserver>(),
      ),
    );
    gh.factory<_i824.BaseRegistrationRepository>(
      () => _i500.RegistrationRepository(gh<_i40.BaseRegistrationApiService>()),
    );
    gh.factory<_i517.BaseApiClient>(
      () => _i799.ApiClient(gh<_i361.Dio>(), gh<_i127.AppLogger>()),
    );
    gh.factory<_i92.RegisterUseCase>(
      () => _i92.RegisterUseCase(gh<_i824.BaseRegistrationRepository>()),
    );
    gh.lazySingleton<_i184.SessionCubit>(
      () => _i184.SessionCubit(
        gh<_i899.BaseSessionRepository>(),
        gh<_i127.AppLogger>(),
      ),
    );
    gh.factory<_i133.BaseLoginRepository>(
      () => _i162.LoginRepository(gh<_i173.BaseLoginApiService>()),
    );
    gh.factory<_i588.RegistrationCubit>(
      () => _i588.RegistrationCubit(
        gh<_i696.ValidateRegistrationUseCase>(),
        gh<_i92.RegisterUseCase>(),
        gh<_i127.AppLogger>(),
      ),
    );
    gh.factory<_i267.LoginCubit>(
      () => _i267.LoginCubit(
        gh<_i133.BaseLoginRepository>(),
        gh<_i127.AppLogger>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i622.DioModule {}
