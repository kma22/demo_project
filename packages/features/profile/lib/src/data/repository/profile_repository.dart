import 'package:injectable/injectable.dart';

import 'package:profile/src/data/api/base_profile_api_service.dart';
import 'package:profile/src/domain/repository/base_profile_repository.dart';

@Injectable(as: BaseProfileRepository)
class ProfileRepository implements BaseProfileRepository {
  // ignore: unused_field
  final BaseProfileApiService _apiService;

  ProfileRepository(this._apiService);
}
