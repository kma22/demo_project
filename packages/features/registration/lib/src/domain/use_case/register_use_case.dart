import 'package:injectable/injectable.dart';
import 'package:registration/src/domain/repository/base_registration_repository.dart';

@injectable
class RegisterUseCase {
  final BaseRegistrationRepository _repository;

  RegisterUseCase(this._repository);

  Future<({String accessToken, String refreshToken})> call({
    required String email,
    required String password,
  }) => _repository.register(email: email.trim(), password: password);
}
