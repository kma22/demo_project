import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class RegistrationResponseDto extends Equatable {
  final String accessToken;
  final String refreshToken;

  const RegistrationResponseDto({required this.accessToken, required this.refreshToken});

  factory RegistrationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseDtoFromJson(json);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
