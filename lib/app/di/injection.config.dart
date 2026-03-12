// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:api_client/api_client.dart' as _i633;
import 'package:demo_project/app/router/feature_navigation.dart' as _i614;
import 'package:demo_project/app/session/data/session_repository.dart' as _i209;
import 'package:demo_project/app/session/domain/base_session_repository.dart'
    as _i899;
import 'package:demo_project/app/session/presentation/cubit/session_cubit.dart'
    as _i184;
import 'package:environment_data/environment_data.dart' as _i72;
import 'package:get_it/get_it.dart' as _i174;
import 'package:home/home.dart' as _i1024;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/local_storage.dart' as _i486;
import 'package:logger_manager/logger_manager.dart' as _i127;
import 'package:login/login.dart' as _i944;
import 'package:profile/profile.dart' as _i16;
import 'package:registration/registration.dart' as _i726;
import 'package:routing/routing.dart' as _i297;
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
    await _i633.ApiClientPackageModule().init(gh);
    gh.lazySingleton<_i297.BaseFeatureNavigation>(
      () => _i614.FeatureNavigation(),
    );
    gh.lazySingleton<_i899.BaseSessionRepository>(
      () => _i209.SessionRepository(
        gh<_i486.BaseTokenStorage>(),
        gh<_i633.SessionObserver>(),
      ),
    );
    gh.lazySingleton<_i184.SessionCubit>(
      () => _i184.SessionCubit(
        gh<_i899.BaseSessionRepository>(),
        gh<_i127.AppLogger>(),
      ),
    );
    await _i944.LoginPackageModule().init(gh);
    await _i726.RegistrationPackageModule().init(gh);
    await _i1024.HomePackageModule().init(gh);
    await _i16.ProfilePackageModule().init(gh);
    return this;
  }
}
