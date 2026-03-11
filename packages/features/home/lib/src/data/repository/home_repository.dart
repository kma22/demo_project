import 'package:injectable/injectable.dart';

import 'package:home/src/data/api/base_home_api_service.dart';
import 'package:home/src/domain/repository/base_home_repository.dart';

@Injectable(as: BaseHomeRepository)
class HomeRepository implements BaseHomeRepository {
  // ignore: unused_field
  final BaseHomeApiService _apiService;

  HomeRepository(this._apiService);
}
