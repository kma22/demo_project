import 'package:demo_project/features/registration/src/data/api/base_registration_api_service.dart';
import 'package:demo_project/features/registration/src/data/dto/registration_request_dto.dart';
import 'package:demo_project/features/registration/src/domain/repository/base_registration_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseRegistrationRepository)
class RegistrationRepository implements BaseRegistrationRepository {
  final BaseRegistrationApiService _apiService;

  RegistrationRepository(this._apiService);

  @override
  Future<({String accessToken, String refreshToken})> register({
    required String email,
    required String password,
  }) async {
    final request = RegistrationRequestDto(email: email, password: password);
    final response = await _apiService.register(request);
    return (accessToken: response.accessToken, refreshToken: response.refreshToken);
  }
}
