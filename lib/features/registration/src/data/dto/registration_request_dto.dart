import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_request_dto.g.dart';

@JsonSerializable()
class RegistrationRequestDto extends Equatable {
  final String email;
  final String password;

  const RegistrationRequestDto({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$RegistrationRequestDtoToJson(this);

  @override
  List<Object?> get props => [email, password];
}
