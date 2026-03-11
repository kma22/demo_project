import 'package:injectable/injectable.dart';
import 'package:login/src/data/api/base_login_api_service.dart';
import 'package:login/src/data/dto/login_request_dto.dart';
import 'package:login/src/domain/repository/base_login_repository.dart';

@Injectable(as: BaseLoginRepository)
class LoginRepository implements BaseLoginRepository {
  final BaseLoginApiService _apiService;

  LoginRepository(this._apiService);

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
