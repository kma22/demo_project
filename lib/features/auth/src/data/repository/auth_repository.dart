import 'package:demo_project/features/auth/src/data/api/base_auth_api_service.dart';
import 'package:demo_project/features/auth/src/data/model/login_request_dto.dart';
import 'package:demo_project/features/auth/src/domain/repository/base_auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseAuthRepository)
class AuthRepository implements BaseAuthRepository {
  final BaseAuthApiService _apiService;

  AuthRepository(this._apiService);

  @override
  Future<({String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequestDto(email: email, password: password);

    final response = await _apiService.login(request);

    return (accessToken: response.accessToken, refreshToken: response.refreshToken);
  }
}
