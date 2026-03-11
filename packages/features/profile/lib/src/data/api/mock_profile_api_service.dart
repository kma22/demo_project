import 'package:injectable/injectable.dart';

import 'package:profile/src/data/api/base_profile_api_service.dart';

/// Мок-реализация [BaseProfileApiService] для разработки.
@Injectable(as: BaseProfileApiService)
class MockProfileApiService implements BaseProfileApiService {}
