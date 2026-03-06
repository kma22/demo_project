import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseDto extends Equatable {
  final String accessToken;
  final String refreshToken;

  const LoginResponseDto({required this.accessToken, required this.refreshToken});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
