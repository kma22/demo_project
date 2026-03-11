import 'package:injectable/injectable.dart';

import 'package:home/src/data/api/base_home_api_service.dart';

/// Мок-реализация [BaseHomeApiService] для разработки.
@Injectable(as: BaseHomeApiService)
class MockHomeApiService implements BaseHomeApiService {}
